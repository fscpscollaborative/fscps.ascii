

function Get-VerticalFittingRules {
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