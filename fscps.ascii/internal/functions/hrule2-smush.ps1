
<#
    .SYNOPSIS
        Applies Rule 2: Underscore Smushing.
        
    .DESCRIPTION
        This function smushes an underscore (`_`) with specific characters (`|`, `/`, `\`, `[`, `]`, `{`, `}`, `(`, `)`, `<`, `>`)
        according to Rule 2 of the FIGlet smushing rules. If one of the characters is an underscore and the other is
        in the allowed set, the underscore is replaced by the other character.
        
    .PARAMETER ch1
        The first character to evaluate for smushing.
        
    .PARAMETER ch2
        The second character to evaluate for smushing.
        
    .EXAMPLE
        $ch1 = "_"
        $ch2 = "|"
        $result = hRule2-Smush -ch1 $ch1 -ch2 $ch2
        
        This example smushes the underscore (`_`) with the pipe (`|`) and returns `|`.
        
    .EXAMPLE
        $ch1 = "/"
        $ch2 = "_"
        $result = hRule2-Smush -ch1 $ch1 -ch2 $ch2
        
        This example smushes the underscore (`_`) with the forward slash (`/`) and returns `/`.
        
    .EXAMPLE
        $ch1 = "_"
        $ch2 = "A"
        $result = hRule2-Smush -ch1 $ch1 -ch2 $ch2
        
        This example does not smush the underscore (`_`) with the character `A` and returns `$false`.
        
    .NOTES
        This function implements Rule 2 of the FIGlet smushing rules: Underscore Smushing.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function hRule2-Smush {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseApprovedVerbs", "Create")]
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