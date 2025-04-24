

# Rule 6: HARDBLANK SMUSHING (code value 32)
# Smushes two hardblanks together, replacing them with a single hardblank.
function hRule6-Smush {
    param (
        [string]$ch1,
        [string]$ch2,
        [string]$hardBlank
    )
    if ($ch1 -eq $hardBlank -and $ch2 -eq $hardBlank) {
        return $hardBlank
    }
    return $false
}