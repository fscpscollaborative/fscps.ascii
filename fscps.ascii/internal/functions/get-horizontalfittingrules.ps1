
<#
    .SYNOPSIS
        Retrieves the horizontal fitting rules for a specified layout type.
        
    .DESCRIPTION
        This function returns a hashtable containing the horizontal fitting rules based on the specified layout type.
        It supports multiple layout types, such as Default, Full, Fitted, and ControlledSmushing. The function maps
        the layout type to its corresponding fitting rules, including horizontal layout (`hLayout`) and individual
        smushing rules (`hRule1` to `hRule6`).
        
    .PARAMETER layout
        The layout type for which the horizontal fitting rules are retrieved. Valid values include:
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
        hLayout = [LayoutType]::Default
        hRule1 = $true
        hRule2 = $false
        hRule3 = $true
        hRule4 = $false
        hRule5 = $true
        hRule6 = $false
        }
        }
        $rules = Get-HorizontalFittingRules -layout $layout -options $options
        
        This example retrieves the horizontal fitting rules for the Default layout type using the specified options.
        
    .NOTES
        This function assumes the existence of a `[LayoutType]` enum or equivalent structure to define valid layout types.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function Get-HorizontalFittingRules {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseApprovedVerbs", "Create")]
    param (
        [string]$layout,       # Layout type (e.g., [LayoutType]::Default, [LayoutType]::Full, etc.)
        [hashtable]$options    # Options object containing fitting rules
    )

    $props = @("hLayout", "hRule1", "hRule2", "hRule3", "hRule4", "hRule5", "hRule6")
    $params = @{}

    if ($layout -eq [LayoutType]::Default) {
        foreach ($prop in $props) {
            $params[$prop] = $options.fittingRules[$prop]
        }
    } elseif ($layout -eq [LayoutType]::Full) {
        $params = @{
            hLayout = [LayoutType]::Full
            hRule1 = $false
            hRule2 = $false
            hRule3 = $false
            hRule4 = $false
            hRule5 = $false
            hRule6 = $false
        }
    } elseif ($layout -eq [LayoutType]::Fitted) {
        $params = @{
            hLayout = [LayoutType]::Fitted
            hRule1 = $false
            hRule2 = $false
            hRule3 = $false
            hRule4 = $false
            hRule5 = $false
            hRule6 = $false
        }
    } elseif ($layout -eq [LayoutType]::ControlledSmushing) {
        $params = @{
            hLayout = [LayoutType]::ControlledSmushing
            hRule1 = $true
            hRule2 = $true
            hRule3 = $true
            hRule4 = $true
            hRule5 = $true
            hRule6 = $true
        }
    } elseif ($layout -eq [LayoutType]::UniversalSmushing) {
        $params = @{
            hLayout = [LayoutType]::UniversalSmushing
            hRule1 = $false
            hRule2 = $false
            hRule3 = $false
            hRule4 = $false
            hRule5 = $false
            hRule6 = $false
        }
    } else {
        return $null
    }

    return $params
}