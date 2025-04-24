

# Rule 2: UNDERSCORE SMUSHING (code value 512)
# Same as horizontal smushing rule 2.
function vRule2-Smush {
    param (
        [string]$ch1,
        [string]$ch2
    )
    $rule2Str = "|/\[]{}()<>"
    if ($ch1 -eq "_") {
        if ($rule2Str.Contains($ch2)) {
            return $ch2
        }
    } elseif ($ch2 -eq "_") {
        if ($rule2Str.Contains($ch1)) {
            return $ch1
        }
    }
    return $false
}
