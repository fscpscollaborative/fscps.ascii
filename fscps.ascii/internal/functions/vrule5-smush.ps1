<#
    .SYNOPSIS
        Applies Rule 5: Vertical Line Supersmushing.

    .DESCRIPTION
        This function smushes stacked vertical bars (`|`) into a single vertical bar according to Rule 5 of the
        FIGlet vertical smushing rules. If both characters are vertical bars, they are replaced with a single
        vertical bar. If the characters do not match this rule, the function returns `$false`.

    .PARAMETER ch1
        The first character to evaluate for vertical smushing.

    .PARAMETER ch2
        The second character to evaluate for vertical smushing.

    .EXAMPLE
        $ch1 = "|"
        $ch2 = "|"
        $result = vRule5-Smush -ch1 $ch1 -ch2 $ch2

        This example smushes the characters `|` and `|` into a single `|`.

    .EXAMPLE
        $ch1 = "|"
        $ch2 = "-"
        $result = vRule5-Smush -ch1 $ch1 -ch2 $ch2

        This example does not smush the characters `|` and `-` and returns `$false`.

    .NOTES
        This function implements Rule 5 of the FIGlet vertical smushing rules: Vertical Line Supersmushing.

        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function vRule5-Smush {
    param (
        [string]$ch1,
        [string]$ch2
    )
    if ($ch1 -eq "|" -and $ch2 -eq "|") {
        return "|"
    }
    return $false
}