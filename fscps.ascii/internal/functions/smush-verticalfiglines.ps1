<#
    .SYNOPSIS
        Combines two sets of FIGlet text lines vertically with optional smushing.

    .DESCRIPTION
        This function takes two sets of FIGlet text lines (`lines1` and `lines2`) and combines them vertically.
        If an overlap is specified, the function applies vertical smushing rules to the overlapping lines.
        The smushing behavior is determined by the options provided in the `opts` parameter.

    .PARAMETER lines1
        An array of strings representing the first set of FIGlet text lines.

    .PARAMETER lines2
        An array of strings representing the second set of FIGlet text lines.

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

        This example combines two sets of FIGlet text lines with 2 lines of overlap using ControlledSmushing rules.

    .NOTES
        This function relies on the `Can-VerticalSmush` helper function to evaluate individual line overlaps
        and determine the smushing behavior.

        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
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