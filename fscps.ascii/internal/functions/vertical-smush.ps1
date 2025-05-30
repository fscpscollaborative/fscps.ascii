
<#
    .SYNOPSIS
        Combines two sets of text lines vertically with optional overlapping smushing.
        
    .DESCRIPTION
        This function takes two sets of text lines (`lines1` and `lines2`) and combines them vertically.
        If an overlap is specified, the function applies vertical smushing rules to the overlapping lines
        using the `Vertically-SmushLines` helper function. The resulting text is returned as a single array
        of combined lines.
        
    .PARAMETER lines1
        An array of strings representing the first set of text lines.
        
    .PARAMETER lines2
        An array of strings representing the second set of text lines.
        
    .PARAMETER overlap
        The number of overlapping lines to smush. If set to 0, no smushing is applied, and the lines are simply concatenated.
        
    .PARAMETER opts
        A hashtable containing options for vertical smushing, including:
        - `fittingRules.vLayout`: Specifies the vertical layout type (e.g., Full, Fitted, ControlledSmushing).
        - Additional smushing rules for evaluating overlaps.
        
    .EXAMPLE
        $lines1 = @(
        "Hello",
        "World"
        )
        $lines2 = @(
        "Foo",
        "Bar"
        )
        $opts = @{
        fittingRules = @{
        vLayout = [LayoutType]::ControlledSmushing
        }
        }
        $result = Vertical-Smush -lines1 $lines1 -lines2 $lines2 -overlap 2 -opts $opts
        
        This example combines two sets of text lines with 2 lines of overlap using ControlledSmushing rules.
        
    .NOTES
        This function relies on the `Vertically-SmushLines` helper function to process overlapping lines
        and applies the specified smushing rules.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function Vertical-Smush {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseApprovedVerbs", "")]
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
    $piece2_1 = $lines1[([math]::Max(0, $len1 - $overlap -1))..($len1)]
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