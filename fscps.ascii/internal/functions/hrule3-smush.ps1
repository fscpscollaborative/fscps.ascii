

# Rule 3: HIERARCHY SMUSHING (code value 4)
# A hierarchy of six classes is used: "|", "/\", "[]", "{}", "()", and "<>".
# When two smushing characters are from different classes, the one from the latter class is used.
function hRule3-Smush {
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