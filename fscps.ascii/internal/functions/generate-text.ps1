<#
    .SYNOPSIS
        Generates ASCII art text using a specified FIGlet font and options.

    .DESCRIPTION
        This function converts input text into ASCII art using the specified FIGlet font and rendering options.
        It processes each line of the input text, generates FIGlet lines for each, and combines them vertically
        to produce the final ASCII art output.

    .PARAMETER fontName
        The name of the FIGlet font to use for generating the ASCII art.

    .PARAMETER options
        A hashtable containing options to override the default font settings, including:
        - `width`: The maximum width of the output text.
        - `fittingRules`: Rules for horizontal and vertical smushing.
        - `printDirection`: The direction in which the text is printed (e.g., left-to-right or right-to-left).

    .PARAMETER txt
        The input text to be converted into ASCII art.

    .EXAMPLE
        $fontName = "Standard"
        $options = @{
            width = 80
            fittingRules = @{
                hLayout = [LayoutType]::ControlledSmushing
                vLayout = [LayoutType]::UniversalSmushing
            }
            printDirection = 0
        }
        $txt = "Hello, World!"
        $asciiArt = Generate-Text -fontName $fontName -options $options -txt $txt

        This example generates ASCII art for the text "Hello, World!" using the "Standard" FIGlet font and the specified options.

    .NOTES
        This function assumes the existence of helper functions such as `Generate-FigTextLines` for generating FIGlet lines
        and `Smush-VerticalFigLines` for combining FIGlet lines vertically.

        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function Generate-Text {
    param (
        [string]$fontName,   # Font to use
        [hashtable]$options, # Options to override the defaults
        [string]$txt         # The text to make into ASCII Art
    )

    # Replace line endings with "\n"
    $txt = $txt -replace "`r`n", "`n" -replace "`r", "`n"

    # Split the text into lines
    $lines = $txt -split "`n"
    $figLines = @()
    
    # Generate FIGlet lines for each line of text
    foreach ($line in $lines) {
        
        $figLines += Generate-FigTextLines -txt $line -figChars $Script:FigFonts[$fontName] -opts $options
    }
    # Combine the FIGlet lines vertically
    $output = $figLines[0]
    for ($ii = 1; $ii -lt $figLines.Count; $ii++) {
        $lines = $figLines[$ii]  
        $output = Smush-VerticalFigLines -output $output -lines $lines -opts $options
    }
    # Return the final output as a single string
    return $output -join "`n"
}