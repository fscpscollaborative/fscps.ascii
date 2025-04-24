# takes assigned options and merges them with the default options from the choosen font
function Rework-FontOpts {
    param (
        [hashtable]$fontOpts,  # Default font options
        [hashtable]$options    # Assigned options to merge with the defaults
    )

    # Make a copy of the font options
    $myOpts = $fontOpts.PSObject.Copy()

    # If the user specifies a horizontal layout, override the default font options
    if ($options.horizontalLayout -ne $null) {
        $params = Get-HorizontalFittingRules -layout $options.horizontalLayout -options $fontOpts
        foreach ($prop in $params.Keys) {
            $myOpts.fittingRules[$prop] = $params[$prop]
        }
    }

    # If the user specifies a vertical layout, override the default font options
    if ($options.verticalLayout -ne $null) {
        $params = Get-VerticalFittingRules -layout $options.verticalLayout -options $fontOpts
        foreach ($prop in $params.Keys) {
            $myOpts.fittingRules[$prop] = $params[$prop]
        }
    }

    # Set printDirection, showHardBlanks, width, and whitespaceBreak
    $myOpts.printDirection = if ($options.printDirection -ne $null) { $options.printDirection } else { $fontOpts.printDirection }
    $myOpts.showHardBlanks = $options.showHardBlanks -or $false
    $myOpts.width = if ($options.width -ne $null) { $options.width } else { -1 }
    $myOpts.whitespaceBreak = $options.whitespaceBreak -or $false

    return $myOpts
}