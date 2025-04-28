
<#
    .SYNOPSIS
        Sets or overrides the default FIGlet font options.
        
    .DESCRIPTION
        This function initializes the global `$Script:FigDefaults` hashtable with default FIGlet font options
        if it is not already defined. It then merges the user-specified options (`$opts`) into the defaults,
        overriding any existing properties. The updated defaults are returned as a copy to prevent unintended
        modifications to the global hashtable.
        
    .PARAMETER opts
        A hashtable containing user-specified properties to override the default FIGlet font options.
        Supported properties include:
        - `font`: The name of the default FIGlet font.
        - `fontPath`: The path to the directory containing FIGlet font files.
        
    .EXAMPLE
        $opts = @{
        font = "Big"
        fontPath = "./custom_fonts"
        }
        $updatedDefaults = Set-Defaults -opts $opts
        
        This example sets the default font to "Big" and updates the font path to "./custom_fonts".
        
    .EXAMPLE
        $updatedDefaults = Set-Defaults -opts @{}
        
        This example returns the current default FIGlet font options without making any changes.
        
    .NOTES
        This function ensures that the global `$Script:FigDefaults` hashtable is always initialized before
        applying any overrides. It returns a copy of the updated defaults to prevent unintended modifications.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function Set-Defaults {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseApprovedVerbs", "")]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns','')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions','')]
    param (
        [hashtable]$opts # Hashtable containing properties to override
    )

    # Ensure $figDefaults is defined globally
    if (-not $Script:FigDefaults) {
        $Script:FigDefaults = @{
            font = "Standard"
            fontPath = "$Script:ModuleRoot\internal\misc\Fonts"
        }
    }

    # Override defaults if $opts is a hashtable and not null
    if ($opts -is [hashtable] -and $opts -ne $null) {
        foreach ($prop in $opts.Keys) {
            $Script:FigDefaults[$prop] = $opts[$prop]
        }
    }

    # Return a copy of the updated $figDefaults
    return $Script:FigDefaults.PSObject.Copy()
}