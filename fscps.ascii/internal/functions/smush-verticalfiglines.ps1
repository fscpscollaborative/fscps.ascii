function Smush-VerticalFigLines {
    param (
        [string[]]$output,    # First set of lines
        [string[]]$lines,     # Second set of lines
        [hashtable]$options      # Options for smushing
    )

    # Determine the lengths of the first lines in both arrays
    $len1 = $output[0].Length
    $len2 = $lines[0].Length
    $overlap = 0

    # Pad the shorter set of lines to match the length of the longer set
    if ($len1 -gt $len2) {
        $lines = Pad-Lines -lines $lines -numSpaces ($len1 - $len2)
    } elseif ($len2 -gt $len1) {
        $output = Pad-Lines -lines $output -numSpaces ($len2 - $len1)
    }

    # Calculate the vertical smush distance
    $overlap = Get-VerticalSmushDist -lines1 $output -lines2 $lines -opts $options
    $lines1 = $output
    $lines2 = $lines
    # Perform the vertical smush
    return Vertical-Smush -lines1 $lines1 -lines2 $lines2 -overlap $overlap -options $options
}