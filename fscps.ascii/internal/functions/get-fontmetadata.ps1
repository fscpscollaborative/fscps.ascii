
<#
    .SYNOPSIS
        Retrieves metadata about a specified FIGlet font.
        
    .DESCRIPTION
        This function retrieves metadata for a given FIGlet font, including its options and header comment.
        It loads the font using the `Load-Font` function and extracts the header comment from the global
        `$Script:FigFonts` hashtable.
        
    .PARAMETER fontName
        The name of the FIGlet font to retrieve metadata for.
        
    .PARAMETER next
        An optional callback function to handle the result or error. If provided, the callback will be invoked
        with the font options and header comment.
        
    .EXAMPLE
        $fontName = "Standard"
        $metadata = Get-FontMetadata -fontName $fontName
        
        This example retrieves the metadata for the "Standard" FIGlet font.
        
    .NOTES
        This function assumes the existence of a `Load-Font` function to load the font options and a global
        `$Script:FigFonts` hashtable containing font metadata.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function Get-FontMetadata {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseApprovedVerbs", "")]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns','')]
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