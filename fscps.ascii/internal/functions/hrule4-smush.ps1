

# Rule 4: OPPOSITE PAIR SMUSHING (code value 8)
# Smushes opposing brackets ("[]" or "]["), braces ("{}" or "}{"), and parentheses ("()" or ")(") together,
# replacing any such pair with a vertical bar ("|").
function hRule4-Smush {
    param (
        [string]$ch1,
        [string]$ch2
    )
    $rule4Str = "[] {} ()"
    $r4_pos1 = $rule4Str.IndexOf($ch1)
    $r4_pos2 = $rule4Str.IndexOf($ch2)
    if ($r4_pos1 -ne -1 -and $r4_pos2 -ne -1) {
        if ([math]::Abs($r4_pos1 - $r4_pos2) -le 1) {
            return "|"
        }
    }
    return $false
}