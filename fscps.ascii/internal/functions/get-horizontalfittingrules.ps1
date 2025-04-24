

# Parsing and Generation methods
function Get-HorizontalFittingRules {
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