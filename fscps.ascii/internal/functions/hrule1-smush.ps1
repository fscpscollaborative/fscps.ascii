
<#
    .SYNOPSIS
        Applies Rule 1: Equal Character Smushing.
        
    .DESCRIPTION
        This function smushes two characters into a single character if they are the same and not a hardblank.
        Rule 1, known as "Equal Character Smushing," ensures that identical characters are combined into one,
        except when the characters are hardblanks.
        
    .PARAMETER ch1
        The first character to evaluate for smushing.
        
    .PARAMETER ch2
        The second character to evaluate for smushing.
        
    .PARAMETER hardBlank
        The character used to represent hardblanks in FIGlet fonts. Hardblanks are excluded from smushing.
        
    .EXAMPLE
        $ch1 = "H"
        $ch2 = "H"
        $hardBlank = "@"
        $result = hRule1-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $hardBlank
        
        This example smushes the characters "H" and "H" into a single "H" since they are identical and not a hardblank.
        
    .EXAMPLE
        $ch1 = "@"
        $ch2 = "@"
        $hardBlank = "@"
        $result = hRule1-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $hardBlank
        
        This example does not smush the characters "@" and "@" because they are hardblanks.
        
    .NOTES
        This function implements Rule 1 of the FIGlet smushing rules: Equal Character Smushing.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
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