

function Text-Sync {
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