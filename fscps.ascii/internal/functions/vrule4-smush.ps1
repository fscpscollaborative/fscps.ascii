

# Rule 4: HORIZONTAL LINE SMUSHING (code value 2048)
# Smushes stacked pairs of "-" and "_", replacing them with a single "=" sub-character.
# It does not matter which is found above the other.
function vRule4-Smush {
    param (
        [string]$ch1,
        [string]$ch2
    )
    if (($ch1 -eq "-" -and $ch2 -eq "_") -or ($ch1 -eq "_" -and $ch2 -eq "-")) {
        return "="
    }
    return $false
}