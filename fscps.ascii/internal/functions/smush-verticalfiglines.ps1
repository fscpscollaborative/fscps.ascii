<#
    .SYNOPSIS
        Combines two sets of FIGlet text lines vertically with optional overlapping smushing.

    .DESCRIPTION
        The Smush-VerticalFigLines function takes two sets of FIGlet text lines (`output` and `lines`) and combines
        them vertically. If the lengths of the lines in the two sets differ, the shorter set is padded with spaces
        to match the length of the longer set. The function calculates the vertical smush distance using the provided
        smushing options and applies vertical smushing rules to the overlapping lines. The resulting text is returned
        as a single array of combined lines.

    .PARAMETER output
        An array of strings representing the first set of FIGlet text lines.

    .PARAMETER lines
        An array of strings representing the second set of FIGlet text lines.

    .PARAMETER options
        A hashtable containing options for vertical smushing, including:
        - `fittingRules.vLayout`: Specifies the vertical layout type (e.g., Full, Fitted, ControlledSmushing).
        - Additional smushing rules for evaluating overlaps.

    .EXAMPLE
        $output = @(
            "Hello",
            "World"
        )
        $lines = @(
            "Foo",
            "Bar"
        )
        $options = @{
            fittingRules = @{
                vLayout = [LayoutType]::ControlledSmushing
            }
        }
        $result = Smush-VerticalFigLines -output $output -lines $lines -options $options

        This example combines two sets of FIGlet text lines using ControlledSmushing rules.

    .NOTES
        This function relies on the following helper functions:
        - `Pad-Lines`: Pads the shorter set of lines with spaces to match the length of the longer set.
        - `Get-VerticalSmushDist`: Calculates the vertical smush distance between the two sets of lines.
        - `Vertical-Smush`: Performs the actual vertical smushing of the two sets of lines.

        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function Smush-VerticalFigLines {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseApprovedVerbs", "Create")]
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