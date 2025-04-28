
<#
    .SYNOPSIS
        Retrieves vertical fitting rules for a specified layout type.
        
    .DESCRIPTION
        This function returns a hashtable containing the vertical fitting rules based on the specified layout type.
        It supports multiple layout types, such as Default, Full, Fitted, and ControlledSmushing. The function maps
        the layout type to its corresponding fitting rules, including vertical layout (`vLayout`) and individual
        smushing rules (`vRule1` to `vRule5`).
        
    .PARAMETER layout
        The layout type for which the vertical fitting rules are retrieved. Valid values include:
        - `[LayoutType]::Default`
        - `[LayoutType]::Full`
        - `[LayoutType]::Fitted`
        - `[LayoutType]::ControlledSmushing`
        
    .PARAMETER options
        A hashtable containing the fitting rules for the Default layout. This parameter is used when the layout type
        is `[LayoutType]::Default`.
        
    .EXAMPLE
        $layout = [LayoutType]::Default
        $options = @{
        fittingRules = @{
        vLayout = [LayoutType]::Default
        vRule1 = $true
        vRule2 = $false
        vRule3 = $true
        vRule4 = $false
        vRule5 = $true
        }
        }
        $rules = Get-VerticalFittingRules -layout $layout -options $options
        
        This example retrieves the vertical fitting rules for the Default layout type using the specified options.
        
    .NOTES
        This function assumes the existence of a `[LayoutType]` enum or equivalent structure to define valid layout types.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function Get-VerticalFittingRules {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseApprovedVerbs", "")]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseSingularNouns','')]
    param (
        [string]$layout,       # Layout type (e.g., [LayoutType]::Default, [LayoutType]::Full, etc.)
        [hashtable]$options    # Options object containing fitting rules
    )

    $props = @("vLayout", "vRule1", "vRule2", "vRule3", "vRule4", "vRule5")
    $params = @{}

    if ($layout -eq [LayoutType]::Default) {
        foreach ($prop in $props) {
            $params[$prop] = $options.fittingRules[$prop]
        }
    } elseif ($layout -eq [LayoutType]::Full) {
        $params = @{
            vLayout = [LayoutType]::Full
            vRule1 = $false
            vRule2 = $false
            vRule3 = $false
            vRule4 = $false
            vRule5 = $false
        }
    } elseif ($layout -eq [LayoutType]::Fitted) {
        $params = @{
            vLayout = [LayoutType]::Fitted
            vRule1 = $false
            vRule2 = $false
            vRule3 = $false
            vRule4 = $false
            vRule5 = $false
        }
    } elseif ($layout -eq [LayoutType]::ControlledSmushing) {
        $params = @{
            vLayout = [LayoutType]::ControlledSmushing
            vRule1 = $true
            vRule2 = $true
            vRule3 = $true
            vRule4 = $true
            vRule5 = $true
        }
    } elseif ($layout -eq [LayoutType]::UniversalSmushing) {
        $params = @{
            vLayout = [LayoutType]::UniversalSmushing
            vRule1 = $false
            vRule2 = $false
            vRule3 = $false
            vRule4 = $false
            vRule5 = $false
        }
    } else {
        return $null
    }

    return $params
}