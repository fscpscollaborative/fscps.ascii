

# Rule 1: EQUAL CHARACTER SMUSHING (code value 256)
# Same as horizontal smushing rule 1.
function vRule1-Smush {
    param (
        [string]$ch1,
        [string]$ch2
    )
    if ($ch1 -eq $ch2) {
        return $ch1
    }
    return $false
}