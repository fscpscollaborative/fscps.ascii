

# Rule 5: VERTICAL LINE SUPERSMUSHING (code value 4096)
# Supersmushes vertical lines consisting of several vertical bars ("|").
# This creates the illusion that FIGcharacters have slid vertically against each other.
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