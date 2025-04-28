
<#
    .SYNOPSIS
        Applies Rule 6: Hardblank Smushing.
        
    .DESCRIPTION
        This function smushes two hardblanks together into a single hardblank according to Rule 6 of the FIGlet
        smushing rules. If both characters are hardblanks, they are replaced with a single hardblank. If either
        character is not a hardblank, the function returns `$false`.
        
    .PARAMETER ch1
        The first character to evaluate for smushing.
        
    .PARAMETER ch2
        The second character to evaluate for smushing.
        
    .PARAMETER hardBlank
        The character used to represent hardblanks in FIGlet fonts.
        
    .EXAMPLE
        $ch1 = "@"
        $ch2 = "@"
        $hardBlank = "@"
        $result = hRule6-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $hardBlank
        
        This example smushes two hardblanks (`@` and `@`) into a single hardblank (`@`).
        
    .EXAMPLE
        $ch1 = "@"
        $ch2 = "H"
        $hardBlank = "@"
        $result = hRule6-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $hardBlank
        
        This example does not smush the characters `@` and `H` because `H` is not a hardblank, and it returns `$false`.
        
    .NOTES
        This function implements Rule 6 of the FIGlet smushing rules: Hardblank Smushing.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
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