
<#
    .SYNOPSIS
        Converts a given text into ASCII art using a specified font and customizable options.
        
    .DESCRIPTION
        The Convert-FSCPSTextToAscii function generates ASCII art from the provided text using the specified font.
        It supports optional customization, including border styles, text and border colors, layout types, and additional
        formatting options such as showing hard blanks or breaking lines at whitespace. The function is highly configurable
        and can be used to create visually appealing text banners or decorations for console outputs.
        
        The function also supports outputting the ASCII art with or without color to custom variables, allowing for
        further processing or storage of the generated ASCII art.
        
    .PARAMETER Text
        The text to be converted into ASCII art. This parameter is mandatory.
        
    .PARAMETER Font
        The font to be used for generating the ASCII art. This parameter is mandatory.
        
    .PARAMETER BorderType
        The type of border to apply around the ASCII art. Defaults to `None`.
        
    .PARAMETER TextColor
        The color to use for the ASCII art text. Defaults to `White`.
        
    .PARAMETER BorderColor
        The color to use for the border. Defaults to `Gray`.
        
    .PARAMETER Timestamp
        A switch to include a timestamp in the output. Defaults to `$false`.
        
    .PARAMETER VerticalLayout
        Specifies the vertical layout type for the ASCII art. Defaults to `Default`.
        
    .PARAMETER HorizontalLayout
        Specifies the horizontal layout type for the ASCII art. Defaults to `Default`.
        
    .PARAMETER ShowHardBlanks
        A switch to display hard blanks in the ASCII art. Defaults to `$false`.
        
    .PARAMETER WhitespaceBreak
        A switch to enable breaking lines at whitespace. Defaults to `$false`.
        
    .PARAMETER ScreenWigth
        The maximum width of the screen for rendering the ASCII art. Defaults to `100`.

    .PARAMETER Padding
        The padding to apply to the ASCII art. Defaults to `0`.
        
    .PARAMETER PrintDirection
        A switch to specify the print direction of the ASCII art. Defaults to left-to-right.
        
    .PARAMETER OutputColorVariable
        The name of the variable to store the ASCII art with color formatting.
        
    .PARAMETER OutputNoColorVariable
        The name of the variable to store the ASCII art without color formatting.
        
    .EXAMPLE
        PS C:\> Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "Standard" -BorderType Box -TextColor Yellow -BorderColor Blue -Timestamp
        
        Converts the text "Hello, World!" into ASCII art using the "Standard" font, applies a box border, and uses yellow text with a blue border. A timestamp is included in the output.
        
    .EXAMPLE
        PS C:\> Convert-FSCPSTextToAscii -Text "PowerShell" -Font "Big" -BorderType Asterisk -TextColor Cyan -BorderColor Green -OutputColorVariable "ColoredOutput" -OutputNoColorVariable "PlainOutput"
        
        Converts the text "PowerShell" into ASCII art using the "Big" font, applies an asterisk border, and uses cyan text with a green border. The colored and plain outputs are stored in the variables `ColoredOutput` and `PlainOutput`, respectively.
        
    .NOTES
        This function uses the PSFramework module for logging and configuration management. Ensure the PSFramework module
        is installed and imported before using this function.
        
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
        [int]$Padding = 0,

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
            
            #$outputLines.Add($line.TrimEnd())
            if ($Padding -gt 0) {
                $outputLines.Add((" " * $Padding) + $line  + (" " * $Padding))
            } else {
                $outputLines.Add($line)
            }
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
                if ($Padding -gt 0) {
                    Write-PSFMessage -Level Host -Message  (" " * $Padding) + ('<c="'+$TextColor.ToLower()+'">' + $line + "</c>") + (" " * $Padding)
                } else {
                    Write-PSFMessage -Level Host -Message  ('<c="'+$TextColor.ToLower()+'">' + $line + "</c>")
                }
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