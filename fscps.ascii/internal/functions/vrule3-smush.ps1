
<#
    .SYNOPSIS
        Applies Rule 3: Hierarchy Smushing for vertical smushing.
        
    .DESCRIPTION
        This function smushes two characters vertically based on their hierarchy class according to Rule 3 of the FIGlet
        vertical smushing rules. A hierarchy of classes is defined: `|`, `/`, `\`, `[`, `]`, `{`, `}`, `(`, `)`, `<`, `>`.
        When two smushing characters belong to different classes, the character from the latter class in the hierarchy
        is used. If the characters belong to the same class, the function returns `$false`.
        
    .PARAMETER ch1
        The first character to evaluate for vertical smushing.
        
    .PARAMETER ch2
        The second character to evaluate for vertical smushing.
        
    .EXAMPLE
        $ch1 = "|"
        $ch2 = ">"
        $result = vRule3-Smush -ch1 $ch1 -ch2 $ch2
        
        This example smushes the characters "|" and ">" and returns ">".
        
    .EXAMPLE
        $ch1 = "("
        $ch2 = "["
        $result = vRule3-Smush -ch1 $ch1 -ch2 $ch2
        
        This example smushes the characters "(" and "[" and returns "[".
        
    .EXAMPLE
        $ch1 = "|"
        $ch2 = "|"
        $result = vRule3-Smush -ch1 $ch1 -ch2 $ch2
        
        This example does not smush the characters "|" and "|" because they belong to the same class and returns `$false`.
        
    .NOTES
        This function implements Rule 3 of the FIGlet vertical smushing rules: Hierarchy Smushing.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function vRule3-Smush {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseApprovedVerbs", "")]
    param (
        [string]$ch1,
        [string]$ch2
    )
    # Define the hierarchy classes explicitly
    $rule3Classes = @("|", "/", "\", "[", "]", "{", "}", "(", ")", "<", ">")
    # Get the indices of the characters in the hierarchy
    $r3_pos1 = $rule3Classes.IndexOf($ch1)
    $r3_pos2 = $rule3Classes.IndexOf($ch2)

    # Ensure both characters are in the hierarchy
    if ($r3_pos1 -ne -1 -and $r3_pos2 -ne -1) {
        # Return $false if both characters are the same
        if ($r3_pos1 -eq $r3_pos2) {
            return $false
        }
        # Return the character from the latter class
        return $rule3Classes[[math]::Max($r3_pos1, $r3_pos2)]
    }
    return $false
}