

function Vertical-Smush {
    param (
        [string[]]$lines1,  # First set of lines
        [string[]]$lines2,  # Second set of lines
        [int]$overlap,      # Overlap length
        [hashtable]$opts    # Options for smushing
    )

    # Calculate lengths of the input arrays
    $len1 = $lines1.Count
    $len2 = $lines2.Count

    # Split the input arrays into pieces
    $piece1 = $lines1[0..([math]::Max(0, $len1 - $overlap - 1))]
    $piece2_1 = $lines1[([math]::Max(0, $len1 - $overlap))..($len1)]
    $piece2_2 = $lines2[0..([math]::Min($overlap, $len2))]

    # Initialize variables
    $piece2 = @()

    # Process the overlapping lines
    $len = $piece2_1.Count
    for ($ii = 1; $ii -lt $len; $ii++) {
        if ($ii -ge $len2) {
            $line = $piece2_1[$ii]
        } else {
            $line = Vertically-SmushLines -line1 $piece2_1[$ii] -line2 $piece2_2[$ii] -opts $opts
        }
        $piece2 += $line
    }

    # Get the remaining lines from lines2
    $piece3 = $lines2[([math]::Min($overlap, $len2))..($len2 - 1)]

    # Concatenate all pieces and return the result
    return $piece1 + $piece2 + $piece3
}