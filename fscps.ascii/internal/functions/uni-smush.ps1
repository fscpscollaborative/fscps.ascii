

# Universal smushing
# Overrides the earlier character with the later character, producing an "overlapping" effect.
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