
<#
    .SYNOPSIS
        Applies universal smushing by overlapping two characters.
        
    .DESCRIPTION
        This function implements universal smushing, where the earlier character (`ch1`) is overridden by the later
        character (`ch2`) to produce an overlapping effect. If the later character is a space or empty, the earlier
        character is retained. If the later character is a hardblank and the earlier character is not a space, the
        earlier character is retained. Otherwise, the later character is used.
        
    .PARAMETER ch1
        The first character to evaluate for smushing.
        
    .PARAMETER ch2
        The second character to evaluate for smushing.
        
    .PARAMETER hardBlank
        The character used to represent hardblanks in FIGlet fonts.
        
    .EXAMPLE
        $ch1 = "H"
        $ch2 = "e"
        $hardBlank = "@"
        $result = uni-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $hardBlank
        
        This example applies universal smushing to the characters "H" and "e", resulting in "e".
        
    .EXAMPLE
        $ch1 = "H"
        $ch2 = " "
        $hardBlank = "@"
        $result = uni-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $hardBlank
        
        This example retains the earlier character "H" because the later character is a space.
        
    .EXAMPLE
        $ch1 = "H"
        $ch2 = "@"
        $hardBlank = "@"
        $result = uni-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $hardBlank
        
        This example retains the earlier character "H" because the later character is a hardblank.
        
    .NOTES
        This function implements universal smushing as defined in FIGlet smushing rules.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function uni-Smush {
    param (
        [string]$ch1,
        [string]$ch2,
        [string]$hardBlank
    )
    if ($ch2 -eq " " -or $ch2 -eq "") {
        return $ch1
    } elseif ($ch2 -eq $hardBlank -and $ch1 -ne " ") {
        return $ch1
    } else {
        return $ch2
    }
}