

function Parse-Font {
    param (
        [string]$FontName, # Name of the font
        [string]$FontData      # Data from the FIGlet font file
    )

    
    # Normalize line endings
    $FontData = "$FontData" -replace "`r`n", "`n" -replace "`r", "`n"
    $Script:FigFonts[$FontName] = @{}

    $lines = $FontData -split "`n"
    $headerData = ($lines[0] -split " ")
    $lines = $lines[1..($lines.Count - 1)]
    $figFont = $Script:FigFonts[$FontName]
    $opts = @{}
    # Parse header data
    $opts.hardBlank = $headerData[0].Substring(5, 1)
    $opts.height = [int]$headerData[1]
    $opts.baseline = [int]$headerData[2]
    $opts.maxLength = [int]$headerData[3]
    $opts.oldLayout = if([int]$headerData[4] -eq 0) { -1 } else { [int]$headerData[4] }
    $opts.numCommentLines = [int]$headerData[5]
    $opts.printDirection = if ($headerData.Count -ge 7) { [int]$headerData[6] } else { 0 }
    $opts.fullLayout = if ($headerData.Count -ge 8) { [int]$headerData[7] } else { $null }
    $opts.codeTagCount = if ($headerData.Count -ge 9) { [int]$headerData[8] } else { $null }
    $opts.fittingRules = Get-SmushingRules -oldLayout $opts.oldLayout -fullLayout $opts.fullLayout

    $figFont.options = $opts

    # Error check
    if (
        $opts.hardBlank.Length -ne 1 -or
        -not $opts.height -or
        -not $opts.baseline -or
        -not $opts.maxLength -or
        -not $opts.oldLayout -or
        -not $opts.numCommentLines
    ) {
        throw "FIGlet header contains invalid values."
    }

    # Define required character codes
    $charNums = @(32..126) + @(196, 214, 220, 228, 246, 252, 223)

    # Error check - validate that there are enough lines in the file
    if ($lines.Count -lt ($opts.numCommentLines + $opts.height * $charNums.Count)) {
        throw "FIGlet file is missing data."
    }

    # Parse the font data
    $figFont.comment = ($lines[0..($opts.numCommentLines - 1)] -join "`n")
    $lines = $lines[$opts.numCommentLines..($lines.Count - 1)]
    $figFont.numChars = 0

    while ($lines.Count -gt 0 -and $figFont.numChars -lt $charNums.Count) {
        $cNum = $charNums[$figFont.numChars]
        $figFont[$cNum] = $lines[0..($opts.height - 1)]
        $lines = $lines[$opts.height..($lines.Count - 1)]

        # Remove end sub-chars
        for ($ii = 0; $ii -lt $opts.height; $ii++) {
            if (-not $figFont[$cNum][$ii]) {
                $figFont[$cNum][$ii] = ""
            } else {
                $endChar = [regex]::Escape($figFont[$cNum][$ii].Substring($figFont[$cNum][$ii].Length - 1, 1))
                $figFont[$cNum][$ii] = $figFont[$cNum][$ii] -replace "$endChar+$", ""
            }
        }
        $figFont.numChars++
    }

    # Parse additional characters
    $parseError = $false
    while ($lines.Count -gt 0) {
        $cNum = ($lines[0] -split " ")[0]
        $lines = $lines[1..($lines.Count - 1)]
        if ($cNum -match "^0[xX][0-9a-fA-F]+$") {
            $cNum = [int]::Parse($cNum.Substring(2), [System.Globalization.NumberStyles]::HexNumber)
        } elseif ($cNum -match "^0[0-7]+$") {
            $cNum = [int]::Parse($cNum, [System.Globalization.NumberStyles]::None)
        } elseif ($cNum -match "^[0-9]+$") {
            $cNum = [int]$cNum
        } elseif ($cNum -match "^-0[xX][0-9a-fA-F]+$") {
            $cNum = -[int]::Parse($cNum.Substring(3), [System.Globalization.NumberStyles]::HexNumber)
        } else {
            if ($cNum -eq "") {
                break
            }
            Write-PSFMessage -Level Host -Message "Invalid data: $cNum" -ForegroundColor Red
            $parseError = $true
            break
        }
        $figFont[$cNum] = $lines[0..($opts.height - 1)]
        $lines = $lines[$opts.height..($lines.Count - 1)]

        
        # Remove end sub-chars
        for ($ii = 0; $ii -lt $opts.height; $ii++) {
            if (-not $figFont[$cNum][$ii]) {
                $figFont[$cNum][$ii] = ""
            } else {
                $endChar = [regex]::Escape($figFont[$cNum][$ii].Substring($figFont[$cNum][$ii].Length - 1, 1))
                $figFont[$cNum][$ii] = $figFont[$cNum][$ii] -replace "$endChar+$", ""
            }
        }
        $figFont.numChars++
    }

    # Error check
    if ($parseError) {
        throw "Error parsing data."
    }
    return $figFont
}