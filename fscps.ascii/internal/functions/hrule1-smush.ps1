

# Rule 1: EQUAL CHARACTER SMUSHING (code value 1)
# Two characters are smushed into a single character if they are the same.
# This rule does not smush hardblanks.
function hRule1-Smush {
    param (
        [string]$ch1,
        [string]$ch2,
        [string]$hardBlank
    )
    if ($ch1 -eq $ch2 -and $ch1 -ne $hardBlank) {
        return $ch1
    }
    return $false
}