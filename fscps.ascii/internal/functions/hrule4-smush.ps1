
<#
    .SYNOPSIS
        Applies Rule 4: Opposite Pair Smushing.
        
    .DESCRIPTION
        This function smushes opposing pairs of brackets (`[]` or `][`), braces (`{}` or `}{`), and parentheses (`()` or `)(`)
        into a vertical bar (`|`). It checks if the two characters belong to the predefined set of opposing pairs and replaces
        them with a vertical bar if they meet the criteria.
        
    .PARAMETER ch1
        The first character to evaluate for smushing.
        
    .PARAMETER ch2
        The second character to evaluate for smushing.
        
    .EXAMPLE
        $ch1 = "["
        $ch2 = "]"
        $result = hRule4-Smush -ch1 $ch1 -ch2 $ch2
        
        This example smushes the characters `[` and `]` into a vertical bar (`|`).
        
    .EXAMPLE
        $ch1 = "("
        $ch2 = ")"
        $result = hRule4-Smush -ch1 $ch1 -ch2 $ch2
        
        This example smushes the characters `(` and `)` into a vertical bar (`|`).
        
    .EXAMPLE
        $ch1 = "["
        $ch2 = "}"
        $result = hRule4-Smush -ch1 $ch1 -ch2 $ch2
        
        This example does not smush the characters `[` and `}` and returns `$false`.
        
    .NOTES
        This function implements Rule 4 of the FIGlet smushing rules: Opposite Pair Smushing.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
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