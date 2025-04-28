
<#
    .SYNOPSIS
        Applies Rule 1: Equal Character Smushing for vertical smushing.
        
    .DESCRIPTION
        This function smushes two characters vertically if they are identical. Rule 1, known as "Equal Character Smushing,"
        ensures that identical characters are combined into one. If the characters are not the same, the function returns `$false`.
        
    .PARAMETER ch1
        The first character to evaluate for vertical smushing.
        
    .PARAMETER ch2
        The second character to evaluate for vertical smushing.
        
    .EXAMPLE
        $ch1 = "H"
        $ch2 = "H"
        $result = vRule1-Smush -ch1 $ch1 -ch2 $ch2
        
        This example smushes the characters "H" and "H" into a single "H".
        
    .EXAMPLE
        $ch1 = "H"
        $ch2 = "e"
        $result = vRule1-Smush -ch1 $ch1 -ch2 $ch2
        
        This example does not smush the characters "H" and "e" and returns `$false`.
        
    .NOTES
        This function implements Rule 1 of the FIGlet vertical smushing rules: Equal Character Smushing.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
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