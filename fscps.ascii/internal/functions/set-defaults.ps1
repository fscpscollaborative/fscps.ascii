function Set-Defaults {
    param (
        [hashtable]$opts # Hashtable containing properties to override
    )

    # Ensure $figDefaults is defined globally
    if (-not $Script:FigDefaults) {
        $Script:FigDefaults = @{
            font = "Standard"
            fontPath = "./fonts"
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