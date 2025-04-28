<#
    .SYNOPSIS
        Calculates the maximum vertical smushing distance between two sets of text lines.

    .DESCRIPTION
        This function determines the maximum number of overlapping lines (`curDist`) that can be vertically smushed
        between two sets of text lines (`lines1` and `lines2`) based on the smushing rules defined in the `opts` parameter.
        It evaluates each pair of overlapping lines using the `Can-VerticalSmush` function and adjusts the distance
        based on the results ("valid", "invalid", or "end").

    .PARAMETER lines1
        An array of strings representing the first set of text lines.

    .PARAMETER lines2
        An array of strings representing the second set of text lines.

    .PARAMETER opts
        A hashtable containing smushing options, including:
        - `fittingRules.vLayout`: Specifies the vertical layout type (e.g., Full, Fitted, UniversalSmushing).
        - Additional smushing rules for evaluating line overlaps.

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
                vLayout = [LayoutType]::UniversalSmushing
            }
        }
        $maxDist = Get-VerticalSmushDist -lines1 $lines1 -lines2 $lines2 -opts $opts

        This example calculates the maximum vertical smushing distance between the two sets of text lines.

    .NOTES
        This function relies on the `Can-VerticalSmush` helper function to evaluate individual line overlaps.
        The result is determined based on the smushing rules and the overlap validity.

        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function Get-VerticalSmushDist {
    param (
        [string[]] $lines1,
        [string[]] $lines2,
        [hashtable] $opts
    )

    $maxDist = $lines1.Count
    $len1 = $lines1.Count
    $len2 = $lines2.Count
    $curDist = 1

    while ($curDist -le $maxDist) {
        $startIndex = [math]::Max(0, $len1 - $curDist)
        $subLines1 = $lines1[$startIndex..($len1 - 1)]
        $subLines2 = $lines2[0..([math]::Min($len2, $curDist) - 1)]
        $slen = $subLines2.Count
        $result = ""

        for ($ii = 0; $ii -lt $slen; $ii++) {
            $ret = Can-VerticalSmush -txt1 $subLines1[$ii] -txt2 $subLines2[$ii] -opts $opts
            if ($ret -eq "end") {
                $result = $ret
                break
            } elseif ($ret -eq "invalid") {
                $result = $ret
                break
            } else {
                $result = "valid"
            }
        }

        if ($result -eq "invalid") {
            $curDist--
            break
        }
        if ($result -eq "end") {
            break
        }
        if ($result -eq "valid") {
            $curDist++
        }
    }

    return [math]::Min($maxDist, $curDist)
}