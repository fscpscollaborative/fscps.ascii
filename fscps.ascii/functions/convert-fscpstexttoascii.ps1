
<#
    .SYNOPSIS
        Converts a given text to ASCII art using a specified font and optional border style with color support.
        
    .DESCRIPTION
        The Convert-FSCPSTextToAscii function takes a string input and converts it into ASCII art using the specified font.
        Optionally, a border style and colors for the text and border can be applied. The function supports various fonts
        and border styles, allowing for customization of the output. The text and border colors can also be specified
        to enhance the visual appearance of the ASCII art.
        
        This function is ideal for creating visually appealing text banners or decorations in scripts, logs, or console outputs.
        
    .PARAMETER Text
        The text to be converted into ASCII art. This parameter is mandatory.
        
    .PARAMETER Font
        The font to be used for generating the ASCII art. This parameter is mandatory.
        
    .PARAMETER BorderType
        The type of border to apply around the ASCII art. This parameter is optional and defaults to 'None'.
        
    .PARAMETER TextColor
        The color to use for the ASCII art text. This parameter is optional and defaults to 'White'.
        
    .PARAMETER BorderColor
        The color to use for the border. This parameter is optional and defaults to 'Gray'.
        
    .PARAMETER Timestamp
        Enables or disables detailed information (timestamp) in the output. Defaults to `$false`.
        
    .EXAMPLE
        PS C:\> Convert-FSCPSTextToAscii -Text "Hello" -Font "Standard" -BorderType Asterisk -TextColor Yellow -BorderColor Green -DetailedInfo $true
        
        Converts the text "Hello" into ASCII art using the "Standard" font, surrounds it with an asterisk border, and applies yellow text with a green border. Detailed information (timestamp and function name) is enabled.
    .NOTES
        
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
        [BorderType]$BorderType = [BorderType]::None,

        [Parameter(Mandatory=$false)]
        [ValidateSet("Black", "DarkBlue", "DarkGreen", "DarkCyan", "DarkRed", "DarkMagenta", "DarkYellow", "Gray", "DarkGray", "Blue", "Green", "Cyan", "Red", "Magenta", "Yellow", "White")]
        [string]$TextColor = "White",

        [Parameter(Mandatory=$false)]
        [ValidateSet("Black", "DarkBlue", "DarkGreen", "DarkCyan", "DarkRed", "DarkMagenta", "DarkYellow", "Gray", "DarkGray", "Blue", "Green", "Cyan", "Red", "Magenta", "Yellow", "White")]
        [string]$BorderColor = "Gray",

        [Parameter(Mandatory=$false)]
        [switch]$Timestamp = $false
    )
    begin {
        Invoke-TimeSignal -Start
        # Save the current state of the PSFramework message style settings
        $originalTimestampSetting = (Get-PSFConfig -Module PSFramework -Name 'Message.Style.Timestamp').Value
        
        $originalFunctionNameSetting = (Get-PSFConfig -Module PSFramework -Name 'Message.Style.FunctionName').Value

        # Apply the detailed info setting
        if ($Timestamp) {
            Set-PSFConfig -Module PSFramework -Name 'Message.Style.Timestamp' -Value $true
            Set-PSFConfig -Module PSFramework -Name 'Message.Style.FunctionName' -Value $false
        } else {
            Set-PSFConfig -Module PSFramework -Name 'Message.Style.Timestamp' -Value $false
            Set-PSFConfig -Module PSFramework -Name 'Message.Style.FunctionName' -Value $false
        }

        $border = Get-BorderSymbol -BorderType $BorderType

        $fontDirectory = "$ModuleRoot\internal\misc\Fonts"
        $fontFilePath = Join-Path $fontDirectory "$Font.flf"
        
        # Load .flf file lines
        $flfLines = (Get-Content -Path $fontFilePath -Raw -ErrorAction Stop -Encoding UTF8) -split "`r?`n"
    
        # Parse metadata from the first line
        $headerParts = $flfLines[0].Split(' ')
        $charHeight  = [int]$headerParts[1]
        $commentLines= [int]$headerParts[5]
    
        # Skip header + comment lines
        $startIndex = 1 + $commentLines
    
        # Build a dictionary of ASCII art for each printable character
        $charMap = @{ }
        $asciiCode = 32  # Start from space (ASCII 32)
    }
    PROCESS {

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
                    # Logic to handle '@' replacements
                    if ($rowText -eq "@") {
                        $rowText = " "
                    } elseif ($rowText.EndsWith("@")) {
                        $rowText = $rowText.TrimEnd("@")
                    }
    
                    # Logic to handle '$' replacements
                    if ($rowText -eq "$") {
                        $rowText = " "
                    } elseif ($rowText.EndsWith("$")) {
                        $rowText = $rowText.TrimEnd("$")
                    }
                    $rowBuilder += $rowText
                }
                else {
                    $rowBuilder += "?"  # fallback if not in font map
                }
            }
            $rowBuilder += " "
            $outputLines.Add($rowBuilder)
        }
    
        if ($outputLines[-1].Replace(" ", "").Length -eq 0) {
            $outputLines.RemoveAt($outputLines.Count - 1)  # Remove last line of whitespace
        }
    
        # Determine max line length
        $maxLen = ($outputLines | ForEach-Object { $_.Length } | Measure-Object -Maximum).Maximum
        
        # Calculate the total width of the content including side borders
        $totalWidth = $maxLen
        
        if ($BorderType -ne [BorderType]::None) {
            # Repeat spacer patterns to match the required total width
            $topBorder = $border.TopSpacer * ([math]::Ceiling($totalWidth / $border.TopSpacer.Length))
            $topBorder = $topBorder.Substring(0, $topBorder.Length)  # Trim to exact length
            
            $bottomBorder = $border.BottomSpacer * [math]::Ceiling($totalWidth / $border.BottomSpacer.Length)
            $bottomBorder = $bottomBorder.Substring(0, $bottomBorder.Length)  # Trim to exact length
            
            # Draw top border
            $topBorderLine = $border.TopLeft + $topBorder + $border.TopRight
            Write-PSFMessage -Level Important -Message ('<c="'+$BorderColor.ToLower()+'">' + $topBorderLine + "</c>")
            
            # Draw lines, padding each to the max length
            foreach ($line in $outputLines) {
                $curLineLength = $line.Length + $border.LeftSpacer.Length + $border.RightSpacer.Length 
                $curAdvDifference = ($topBorderLine.Length - ($curLineLength))
                $padded = $line.PadRight($maxLen + $curAdvDifference)
                Write-PSFMessage -Level Important -Message ('<c="'+$BorderColor.ToLower()+'">' + "$($border.LeftSpacer)" + "</c>" + '<c="'+$TextColor.ToLower()+'">' + $padded +"</c>" + '<c="'+$BorderColor.ToLower()+'">' + "$($border.RightSpacer)" + "</c>")
            }
            
            # Draw bottom border
            Write-PSFMessage -Level Host -Message  ('<c="'+$BorderColor.ToLower()+'">' + $border.BottomLeft + $bottomBorder + $border.BottomRight  + "</c>")
        }
        else {
            # Draw lines without borders
            foreach ($line in $outputLines) {
                Write-PSFMessage -Level Host -Message  ('<c="'+$TextColor.ToLower()+'">' + $line + "</c>") 
            }
        }    
    }
    END {
        # Restore the original state of the PSFramework message style settings
        Set-PSFConfig -Module PSFramework -Name 'Message.Style.Timestamp' -Value $originalTimestampSetting
        Set-PSFConfig -Module PSFramework -Name 'Message.Style.FunctionName' -Value $originalFunctionNameSetting
        Invoke-TimeSignal -End
    }    
}