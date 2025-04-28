<#
    .SYNOPSIS
        Applies Rule 4: Horizontal Line Smushing for vertical smushing.

    .DESCRIPTION
        This function smushes stacked pairs of `"-"` and `"_"` characters into a single `"="` sub-character
        according to Rule 4 of the FIGlet vertical smushing rules. The order of the characters does not matter;
        if one character is `"-"` and the other is `"_"`, they are replaced with `"="`. If the characters do not
        match this rule, the function returns `$false`.

    .PARAMETER ch1
        The first character to evaluate for vertical smushing.

    .PARAMETER ch2
        The second character to evaluate for vertical smushing.

    .EXAMPLE
        $ch1 = "-"
        $ch2 = "_"
        $result = vRule4-Smush -ch1 $ch1 -ch2 $ch2

        This example smushes the characters `"-"` and `"_"` into `"="`.

    .EXAMPLE
        $ch1 = "_"
        $ch2 = "-"
        $result = vRule4-Smush -ch1 $ch1 -ch2 $ch2

        This example smushes the characters `"_"` and `"-"` into `"="`.

    .EXAMPLE
        $ch1 = "-"
        $ch2 = "|"
        $result = vRule4-Smush -ch1 $ch1 -ch2 $ch2

        This example does not smush the characters `"-"` and `"|"` and returns `$false`.

    .NOTES
        This function implements Rule 4 of the FIGlet vertical smushing rules: Horizontal Line Smushing.

        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
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