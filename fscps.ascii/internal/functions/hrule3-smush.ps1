
<#
    .SYNOPSIS
        Applies Rule 3: Hierarchy Smushing.
        
    .DESCRIPTION
        This function smushes two characters based on their hierarchy class according to Rule 3 of the FIGlet smushing rules.
        A hierarchy of six classes is defined: "|", "/\", "[]", "{}", "()", and "<>". When two smushing characters belong
        to different classes, the character from the latter class in the hierarchy is used.
        
    .PARAMETER ch1
        The first character to evaluate for smushing.
        
    .PARAMETER ch2
        The second character to evaluate for smushing.
        
    .EXAMPLE
        $ch1 = "|"
        $ch2 = ">"
        $result = hRule3-Smush -ch1 $ch1 -ch2 $ch2
        
        This example smushes the characters "|" and ">" and returns ">".
        
    .EXAMPLE
        $ch1 = "("
        $ch2 = "["
        $result = hRule3-Smush -ch1 $ch1 -ch2 $ch2
        
        This example smushes the characters "(" and "[" and returns "[".
        
    .EXAMPLE
        $ch1 = "|"
        $ch2 = "|"
        $result = hRule3-Smush -ch1 $ch1 -ch2 $ch2
        
        This example does not smush the characters "|" and "|" because they belong to the same class and returns `$false`.
        
    .NOTES
        This function implements Rule 3 of the FIGlet smushing rules: Hierarchy Smushing.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function hRule3-Smush {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseApprovedVerbs", "Create")]
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
        # Check if characters are from different classes
        if ($r3_pos1 -ne $r3_pos2) {
            # Return the character from the latter class
            return $rule3Classes[[math]::Max($r3_pos1, $r3_pos2)]
        }
    }
    return $false
}