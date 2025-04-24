

# Rule 5: BIG X SMUSHING (code value 16)
# Smushes "/\" into "|", "\/" into "Y", and "><" into "X".
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