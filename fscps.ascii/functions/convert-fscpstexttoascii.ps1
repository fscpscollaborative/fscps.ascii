
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
        [string]$Font,
    
        [Parameter(Mandatory=$false)]
        [BorderType]$BorderType = [BorderType]::None,

        [Parameter(Mandatory=$false)]
        [ValidateSet("Black", "DarkBlue", "DarkGreen", "DarkCyan", "DarkRed", "DarkMagenta", "DarkYellow", "Gray", "DarkGray", "Blue", "Green", "Cyan", "Red", "Magenta", "Yellow", "White")]
        [string]$TextColor = "White",

        [Parameter(Mandatory=$false)]
        [ValidateSet("Black", "DarkBlue", "DarkGreen", "DarkCyan", "DarkRed", "DarkMagenta", "DarkYellow", "Gray", "DarkGray", "Blue", "Green", "Cyan", "Red", "Magenta", "Yellow", "White")]
        [string]$BorderColor = "Gray",

        [Parameter(Mandatory=$false)]
        [switch]$Timestamp,

        [Parameter(Mandatory=$false)]
        [LayoutType]$VerticalLayout = [LayoutType]::Default,

        [Parameter(Mandatory=$false)]
        [LayoutType]$HorizontalLayout = [LayoutType]::Default,
        [Parameter(Mandatory=$false)]
        [switch]$ShowHardBlanks,

        [Parameter(Mandatory=$false)]
        [switch]$WhitespaceBreak,

        [Parameter(Mandatory=$false)]
        [int]$ScreenWigth = 100,

        [Parameter(Mandatory=$false)]
        [switch]$PrintDirection,

        [Parameter(Mandatory=$false)]
        [string]$OutputColorVariable,

        [Parameter(Mandatory=$false)]
        [string]$OutputNoColorVariable

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

        $_printDirection = 0

        if($PrintDirection) {
            $_printDirection = 1
        }

    }
    PROCESS {


        $options = @{
            font ="$Font"
            showHardBlanks = $ShowHardBlanks
            whitespaceBreak = $WhitespaceBreak
            verticalLayout = $VerticalLayout
            horizontalLayout = $HorizontalLayout
            width = $ScreenWigth
            printDirection = $_printDirection
        }
        # Call the function
        $outputLines = New-Object System.Collections.Generic.List[string]
        $resultColorLines = New-Object System.Collections.Generic.List[string]
        $resultNoColorLines = New-Object System.Collections.Generic.List[string]
        $null = (Get-FontMetadata -fontName $Font) 
        $arrayLines = (Text-Sync -txt $Text -options $options)
        foreach ($line in $arrayLines) {
            $outputLines.Add($line.TrimEnd())
        }
        $outputLines = $outputLines -split "`n"

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
            $topBorderMessageColor = ('<c="'+$BorderColor.ToLower()+'">' + $topBorderLine + "</c>")
            $topBorderMessageNoColor = ($topBorderLine)
            $resultColorLines.Add($topBorderMessageColor)
            $resultNoColorLines.Add($topBorderMessageNoColor)
            Write-PSFMessage -Level Important -Message $topBorderMessageColor
            # Draw lines, padding each to the max length
            foreach ($line in $outputLines) {
                $curLineLength = $line.Length + $border.LeftSpacer.Length + $border.RightSpacer.Length 
                $curAdvDifference = ($topBorderLine.Length - ($curLineLength))
                $padded = $line.PadRight($line.Length + $curAdvDifference)
                $centerMessageColor = ('<c="'+$BorderColor.ToLower()+'">' + $border.LeftSpacer + "</c>" + '<c="'+$TextColor.ToLower()+'">' + $padded +"</c>" + '<c="'+$BorderColor.ToLower()+'">' + $border.RightSpacer + "</c>")
                $centerMessageNoColor = ($border.LeftSpacer + $padded + $border.RightSpacer)
                $resultColorLines.Add($centerMessageColor)
                $resultNoColorLines.Add($centerMessageNoColor)
                Write-PSFMessage -Level Important -Message $centerMessageColor
            }
            
            # Draw bottom border
            $bottomBorderMessageColor = ('<c="'+$BorderColor.ToLower()+'">' + $border.BottomLeft + $bottomBorder + $border.BottomRight  + "</c>")
            $bottomBorderMessageNoColor = ($border.BottomLeft + $bottomBorder + $border.BottomRight)
            $resultColorLines.Add($bottomBorderMessageColor)
            $resultNoColorLines.Add($bottomBorderMessageNoColor)
            Write-PSFMessage -Level Host -Message $bottomBorderMessageColor
        }
        else {
            # Draw lines without borders
            foreach ($line in $outputLines) {
                Write-PSFMessage -Level Host -Message  ('<c="'+$TextColor.ToLower()+'">' + $line + "</c>") 
            }
        }    
        # If the custom output variable is provided, set its value
        if ($PSBoundParameters.ContainsKey('OutputNoColorVariable') -and $OutputNoColorVariable) {
            Set-Variable -Name $OutputNoColorVariable -Value $resultNoColorLines -Scope 1
        }
        if ($PSBoundParameters.ContainsKey('OutputColorVariable') -and $OutputColorVariable) {
            Set-Variable -Name $OutputColorVariable -Value $resultColorLines -Scope 1
        }
    }
    END {
        # Restore the original state of the PSFramework message style settings
        Set-PSFConfig -Module PSFramework -Name 'Message.Style.Timestamp' -Value $originalTimestampSetting
        Set-PSFConfig -Module PSFramework -Name 'Message.Style.FunctionName' -Value $originalFunctionNameSetting
        Invoke-TimeSignal -End
    }    
}
