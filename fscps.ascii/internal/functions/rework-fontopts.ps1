<#
    .SYNOPSIS
        Merges assigned options with the default font options for a FIGlet font.

    .DESCRIPTION
        This function takes the default font options (`fontOpts`) and merges them with the user-specified options
        (`options`). It overrides the default horizontal and vertical fitting rules if specified, and updates
        additional font properties such as `printDirection`, `showHardBlanks`, `width`, and `whitespaceBreak`.

    .PARAMETER fontOpts
        A hashtable containing the default font options, including fitting rules and other font properties.

    .PARAMETER options
        A hashtable containing user-specified options to override the default font options. These may include:
        - `horizontalLayout`: Specifies the horizontal layout type.
        - `verticalLayout`: Specifies the vertical layout type.
        - `printDirection`: The direction in which the text is printed.
        - `showHardBlanks`: A flag indicating whether to display hard blanks.
        - `width`: The maximum width of the text.
        - `whitespaceBreak`: A flag indicating whether to break lines at whitespace.

    .EXAMPLE
        $fontOpts = @{
            fittingRules = @{
                hLayout = "default"
                vLayout = "default"
            }
            printDirection = 0
            showHardBlanks = $true
            width = 80
            whitespaceBreak = $true
        }
        $options = @{
            horizontalLayout = "fitted"
            verticalLayout = "controlled smushing"
            printDirection = 1
            showHardBlanks = $false
            width = 100
        }
        $mergedOpts = Rework-FontOpts -fontOpts $fontOpts -options $options

        This example merges the user-specified options with the default font options and returns the updated options.

    .NOTES
        This function relies on the `Get-HorizontalFittingRules` and `Get-VerticalFittingRules` helper functions
        to calculate the fitting rules for the specified layouts.

        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
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