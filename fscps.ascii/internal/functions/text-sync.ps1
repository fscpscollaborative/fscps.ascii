
<#
    .SYNOPSIS
        Generates ASCII art text synchronously using a specified FIGlet font and options.

    .DESCRIPTION
        This function converts input text into ASCII art using the specified FIGlet font and rendering options.
        It validates the input, processes the provided options, and generates the ASCII art text by calling
        helper functions to load the font, rework font options, and render the text.

    .PARAMETER txt
        The input text to be converted into ASCII art.

    .PARAMETER options
        A hashtable containing font and rendering options. Supported properties include:
        - `font`: The name of the FIGlet font to use.
        - Additional font settings such as width, layout, and smushing rules.

    .EXAMPLE
        $txt = "Hello, World!"
        $options = @{
            font = "Standard"
            width = 80
        }
        $asciiArt = Text-Sync -txt $txt -options $options

        This example generates ASCII art for the text "Hello, World!" using the "Standard" FIGlet font.

    .EXAMPLE
        $txt = "Hello, World!"
        $asciiArt = Text-Sync -txt $txt -options "Standard"

        This example generates ASCII art for the text "Hello, World!" using the "Standard" FIGlet font by passing the font name directly.

    .NOTES
        This function relies on helper functions such as `Rework-FontOpts`, `Load-Font`, and `Generate-Text` to process
        the font and render the ASCII art.

        Author: Oleksandr Nikolaiev (@onikolaiev)
#>function Text-Sync {
    param (
        [string]$txt,          # Input text
        [hashtable]$options    # Options for font and settings
    )
    
    # Initialize fontName
    $fontName = ""

    # Validate inputs
    $txt = [string]$txt

    # Handle options
    if ($options -is [string]) {
        $fontName = $options
        $options = @{}
    } else {
        $options = if($options){$options}else{@{}}
        $fontName = if ($options.font) { $options.font } else { $Script:FigDefaults.font }
    }
    # Rework font options
    $fontOpts = Rework-FontOpts -fontOpts (Load-Font -fontName "$fontName").options -options $options

    # Generate the ASCII art text
    return Generate-Text -fontName $fontName -options $fontOpts -txt $txt
}