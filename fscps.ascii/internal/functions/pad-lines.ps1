function Pad-Lines {
    param (
        [string[]]$lines,     # Array of lines to pad
        [int]$numSpaces       # Number of spaces to pad
    )

    # Create the padding string
    $padding = " " * $numSpaces

    # Create a new array with padded lines
    $paddedLines = @()
    foreach ($line in $lines) {
        $paddedLines += $line + $padding
    }

    return $paddedLines
}