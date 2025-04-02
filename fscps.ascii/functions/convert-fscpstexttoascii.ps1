
<#
    .SYNOPSIS
        Converts a given text to ASCII art using a specified font and optional border style.
        
    .DESCRIPTION
        The Convert-FSCPSTextToAscii function takes a string input and converts it into ASCII art using the specified font.
        
        Optionally, a border style can be applied around the ASCII art, such as asterisks, hashes, or other symbols.
        
    .PARAMETER Text
        The text to be converted into ASCII art. This parameter is mandatory.
        
    .PARAMETER Font
        The font to be used for generating the ASCII art. This parameter is mandatory.
        
    .PARAMETER BorderType
        The type of border to apply around the ASCII art. This parameter is optional and defaults to 'None'.
        
        Supported values include 'Asterisk', 'Hash', and 'Plus'.
        
    .EXAMPLE
        PS C:\> Convert-FSCPSTextToAscii -Text "Hello" -Font "Standard" -BorderType Asterisk
        
        Converts the text "Hello" into ASCII art using the "Standard" font and surrounds it with an asterisk border.
        
    .EXAMPLE
        PS C:\> Convert-FSCPSTextToAscii -Text "World" -Font "Slant"
        
        Converts the text "World" into ASCII art using the "Slant" font without any border.
        
    .NOTES
        Tags: Configuration, Azure, Storage
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
        
#>
function Convert-FSCPSTextToAscii {
    [CmdletBinding()]
    [OutputType()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$Text,

        [Parameter(Mandatory=$true)]
        [FontType]$Font,
    
        [Parameter(Mandatory=$false)]
        [BorderType]$BorderType = [BorderType]::None
    )

    $border = Get-BorderSymbol -BorderType $BorderType

    $fontDirectory = "$ModuleRoot\internal\misc\Fonts"
    $fontFilePath = Join-Path $fontDirectory "$Font.flf"
    

    # Load .flf file lines
    $flfLines = (Get-Content -Path $fontFilePath -Raw -ErrorAction Stop -Encoding UTF8) -split "`r?`n"

    # Parse metadata from the first line
    # e.g. header: "flf2a$ 6 5 20 15 11 0 24463 229"
    $headerParts = $flfLines[0].Split(' ')
    $charHeight  = [int]$headerParts[1]
    $commentLines= [int]$headerParts[5]

    # Skip header + comment lines
    $startIndex = 1 + $commentLines

    # Build a dictionary of ASCII art for each printable character
    $charMap = @{}
    $asciiCode = 32  # Start from space (ASCII 32)
    $linePos = $startIndex
    while ($linePos -lt $flfLines.Count) {
        $charLines = @()
        for ($i = 0; $i -lt $charHeight; $i++) {
            if ($linePos -ge $flfLines.Count) { break }
            $charLines += $flfLines[$linePos]
            $linePos++
        }
        $charMap[$asciiCode] = $charLines
        $asciiCode++

        # Stop if we've passed typical ASCII printable range
        if ($asciiCode -gt 126) { break }
    }

    # Generate ASCII art lines for input text
    $outputLines = New-Object System.Collections.Generic.List[string]
    for ($row = 0; $row -lt $charHeight; $row++) {
        $rowBuilder = " "
        foreach ($c in $Text.ToCharArray()) {
            $charCode = [int][char]$c
            if ($charMap.ContainsKey($charCode)) {
                $rowText = $charMap[$charCode][$row]
                # Remove trailing '@' or '$'
                $rowText = $rowText -replace "\$", " "  # remove all '$'
                $rowText = $rowText -replace "[@]+$", ""  # remove trailing
                $rowBuilder += $rowText
            }
            else {
                $rowBuilder += "?"  # fallback if not in font map
            }
        }
        $rowBuilder += " "
        $outputLines.Add($rowBuilder)
    }

    if($outputLines[-1].Replace(" ", "").Length -eq 0) {
        $outputLines.RemoveAt($outputLines.Count - 1)  # Remove last line of whitespace
    }

    # Determine max line length
    $maxLen = ($outputLines | ForEach-Object { $_.Length } | Measure-Object -Maximum).Maximum
    
    # Calculate the total width of the content including side borders
    $totalWidth = $maxLen
    
    if($BorderType -ne [BorderType]::None) {
        # Repeat spacer patterns to match the required total width
        $topBorder = $border.TopSpacer * ([math]::Ceiling($totalWidth / $border.TopSpacer.Length))
        $topBorder = $topBorder.Substring(0, $topBorder.Length)  # Trim to exact length
        
        $bottomBorder = $border.BottomSpacer * [math]::Ceiling($totalWidth / $border.BottomSpacer.Length)
        $bottomBorder = $bottomBorder.Substring(0, $bottomBorder.Length)  # Trim to exact length
        
        # Draw top border
        $topBorderLine = $border.TopLeft + $topBorder + $border.TopRight
        Write-Output ($topBorderLine)
        
        
        # Draw lines, padding each to the max length
        foreach ($line in $outputLines) {
            $curLineLenght = $line.Length + $border.LeftSpacer.Length + $border.RightSpacer.Length 
            $curAdvDifference = ($topBorderLine.Length - ($curLineLenght))
            $padded = $line.PadRight($maxLen + $curAdvDifference)
            Write-Output ("$($border.LeftSpacer)$padded$($border.RightSpacer)")
        }
        
        # Draw bottom border
        Write-Output ($border.BottomLeft + $bottomBorder + $border.BottomRight)
    }
    else {
        # Draw lines without borders
        foreach ($line in $outputLines) {
            Write-Output ($line)
        }
    }
    
}