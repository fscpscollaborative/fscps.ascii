

function Get-FontMetadata {
    param (
        [string]$fontName,          # Name of the font
        [ScriptBlock]$next = $null # Optional callback function
    )

    # Ensure fontName is a string
    $fontName = [string]"$fontName"
    # Load the font
    $fontOpts = Load-Font -fontName "$fontName"
    $headerComment = $Script:FigFonts["$fontName"].comment    

    # Return the Task object
    return @($fontOpts, $headerComment)
}