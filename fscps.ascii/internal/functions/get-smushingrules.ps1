function Get-SmushingRules {
    param (
        [int]$oldLayout,
        [int]$newLayout
    )

    # Initialize rules
    $rules = @{}

    # Define codes array
    $codes = @(
        @{ Value = 16384; Key = "vLayout"; Default = [LayoutType]::UniversalSmushing },
        @{ Value = 8192; Key = "vLayout"; Default = [LayoutType]::Fitted },
        @{ Value = 4096; Key = "vRule5"; Default = $true },
        @{ Value = 2048; Key = "vRule4"; Default = $true },
        @{ Value = 1024; Key = "vRule3"; Default = $true },
        @{ Value = 512; Key = "vRule2"; Default = $true },
        @{ Value = 256; Key = "vRule1"; Default = $true },
        @{ Value = 128; Key = "hLayout"; Default = [LayoutType]::UniversalSmushing },
        @{ Value = 64; Key = "hLayout"; Default = [LayoutType]::Fitted },
        @{ Value = 32; Key = "hRule6"; Default = $true },
        @{ Value = 16; Key = "hRule5"; Default = $true },
        @{ Value = 8; Key = "hRule4"; Default = $true },
        @{ Value = 4; Key = "hRule3"; Default = $true },
        @{ Value = 2; Key = "hRule2"; Default = $true },
        @{ Value = 1; Key = "hRule1"; Default = $true }
    )

    # Determine the layout value
    $val = if ($null -ne $newLayout) { $newLayout } else { $oldLayout }

    # Process codes
    foreach ($code in $codes) {
        if ($val -ge $code.Value) {
            $val -= $code.Value
            if (-not $rules.ContainsKey($code.Key)) {
                $rules[$code.Key] = $code.Default
            }
        } elseif ($code.Key -notin @("vLayout", "hLayout")) {
            $rules[$code.Key] = $false
        }
    }

    # Handle undefined horizontal layout
    if (-not $rules.ContainsKey("hLayout")) {
        if ($oldLayout -eq 0) {
            $rules["hLayout"] = [LayoutType]::Fitted
        } elseif ($oldLayout -eq -1) {
            $rules["hLayout"] = [LayoutType]::Full
        } else {
            if (
                $rules["hRule1"] -or
                $rules["hRule2"] -or
                $rules["hRule3"] -or
                $rules["hRule4"] -or
                $rules["hRule5"] -or
                $rules["hRule6"]
            ) {
                $rules["hLayout"] = [LayoutType]::ControlledSmushing
            } else {
                $rules["hLayout"] = [LayoutType]::UniversalSmushing
            }
        }
    } elseif ($rules["hLayout"] -eq [LayoutType]::UniversalSmushing) {
        if (
            $rules["hRule1"] -or
            $rules["hRule2"] -or
            $rules["hRule3"] -or
            $rules["hRule4"] -or
            $rules["hRule5"] -or
            $rules["hRule6"]
        ) {
            $rules["hLayout"] = [LayoutType]::ControlledSmushing
        }
    }

    # Handle undefined vertical layout
    if (-not $rules.ContainsKey("vLayout")) {
        if (
            $rules["vRule1"] -or
            $rules["vRule2"] -or
            $rules["vRule3"] -or
            $rules["vRule4"] -or
            $rules["vRule5"]
        ) {
            $rules["vLayout"] = [LayoutType]::ControlledSmushing
        } else {
            $rules["vLayout"] = [LayoutType]::Full
        }
    } elseif ($rules["vLayout"] -eq [LayoutType]::UniversalSmushing) {
        if (
            $rules["vRule1"] -or
            $rules["vRule2"] -or
            $rules["vRule3"] -or
            $rules["vRule4"] -or
            $rules["vRule5"]
        ) {
            $rules["vLayout"] = [LayoutType]::ControlledSmushing
        }
    }

    return $rules
}