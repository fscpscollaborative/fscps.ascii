<#
    .SYNOPSIS
        Applies Rule 5: Big X Smushing.

    .DESCRIPTION
        This function smushes specific character pairs into predefined replacements according to Rule 5 of the FIGlet
        smushing rules. It replaces:
        - `"/\"` with `"|"`,
        - `"\\"` with `"Y"`,
        - `"><"` with `"X"`.
        If the character pair does not match any of these patterns, the function returns `$false`.

    .PARAMETER ch1
        The first character to evaluate for smushing.

    .PARAMETER ch2
        The second character to evaluate for smushing.

    .EXAMPLE
        $ch1 = "/"
        $ch2 = "\"
        $result = hRule5-Smush -ch1 $ch1 -ch2 $ch2

        This example smushes the characters `"/\"` into `"|"`.

    .EXAMPLE
        $ch1 = ">"
        $ch2 = "<"
        $result = hRule5-Smush -ch1 $ch1 -ch2 $ch2

        This example smushes the characters `"><"` into `"X"`.

    .EXAMPLE
        $ch1 = "/"
        $ch2 = ">"
        $result = hRule5-Smush -ch1 $ch1 -ch2 $ch2

        This example does not smush the characters `"/"` and `">"` and returns `$false`.

    .NOTES
        This function implements Rule 5 of the FIGlet smushing rules: Big X Smushing.

        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function hRule5-Smush {
    param (
        [string]$ch1,
        [string]$ch2
    )
    $rule5Str = "/\ \/ ><"
    $rule5Hash = @{
        0 = "|"
        3 = "Y"
        6 = "X"
    }

    if($rule5Str.IndexOf($ch1+$ch2) -ge 0) {
        return $rule5Hash[$rule5Str.IndexOf($ch1+$ch2)]
    }

    return $false
}