
<#
    .SYNOPSIS
        Calculates the horizontal smushing distance between two text strings based on the specified smushing rules.
        
    .DESCRIPTION
        This function determines the maximum horizontal smushing distance between two text strings (`txt1` and `txt2`)
        according to the smushing rules defined in the `opts.fittingRules` parameter. It evaluates character overlaps
        and applies specific smushing rules, such as Full, Fitted, and UniversalSmushing, to calculate the distance.
        
    .PARAMETER txt1
        The first text string to evaluate for horizontal smushing.
        
    .PARAMETER txt2
        The second text string to evaluate for horizontal smushing.
        
    .PARAMETER opts
        A hashtable containing smushing options, including:
        - `fittingRules.hLayout`: Specifies the horizontal layout type (e.g., Full, Fitted, UniversalSmushing).
        - `hardBlank`: The character used to represent hard blanks in FIGlet fonts.
        
    .EXAMPLE
        $txt1 = "Hello"
        $txt2 = "World"
        $opts = @{
        fittingRules = @{
        hLayout = [LayoutType]::UniversalSmushing
        }
        hardBlank = "@"
        }
        $smushLength = Get-HorizontalSmushLength -txt1 $txt1 -txt2 $txt2 -opts $opts
        
        This example calculates the horizontal smushing distance between the strings "Hello" and "World" using
        the UniversalSmushing layout type.
        
    .NOTES
        This function assumes the existence of a `[LayoutType]` enum or equivalent structure to define valid layout types.
        It also relies on the `hardBlank` option to handle special cases for smushing.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function Get-HorizontalSmushLength {
    param (
        [string]$txt1,          # First text string
        [string]$txt2,          # Second text string
        [hashtable]$opts        # Options for smushing
    )

    if ($opts.fittingRules.hLayout -eq [LayoutType]::Full) {
        return 0
    }

    $len1 = $txt1.Length
    $len2 = $txt2.Length
    $maxDist = $len1
    $curDist = 1
    $breakAfter = $false
    $validSmush = $false

    if ($len1 -eq 0) {
        return 0
    }
    $stopWhile = $false
    while ($curDist -le $maxDist -and (-not $stopWhile)) {
        $seg1StartPos = $len1 - $curDist
        $seg1 = $txt1.Substring($seg1StartPos, $curDist)
        $seg2 = $txt2.Substring(0, [math]::Min($curDist, $len2))
        for ($ii = 0; $ii -lt [math]::Min($curDist, $len2) -and (-not $stopWhile); $ii++) {
            $ch1 = $seg1.Substring($ii, 1)
            $ch2 = $seg2.Substring($ii, 1)
            if ($ch1 -ne " " -and $ch2 -ne " ") {
                if ($opts.fittingRules.hLayout -eq [LayoutType]::Fitted) {
                    $curDist -= 1
                    $stopWhile = $true
                    break 
                } elseif ($opts.fittingRules.hLayout -eq [LayoutType]::UniversalSmushing) {
                    if ($ch1 -eq $opts.hardBlank -or $ch2 -eq $opts.hardBlank) {
                        $curDist -= 1 # universal smushing does not smush hardblanks
                    }
                    $stopWhile = $true
                    break
                } else {
                    $breakAfter = $true # we know we need to break, but we need to check if our smushing rules will allow us to smush the overlapped characters
                    $validSmush = $false # the below checks will let us know if we can smush these characters

                    if ($opts.fittingRules.hRule1) {
                        $validSmush = hRule1-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $opts.hardBlank
                    }
                    if (-not $validSmush -and $opts.fittingRules.hRule2) {
                        $validSmush = hRule2-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $opts.hardBlank
                    }
                    if (-not $validSmush -and $opts.fittingRules.hRule3) {
                        $validSmush = hRule3-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $opts.hardBlank
                    }
                    if (-not $validSmush -and $opts.fittingRules.hRule4) {
                        $validSmush = hRule4-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $opts.hardBlank
                    }
                    if (-not $validSmush -and $opts.fittingRules.hRule5) {
                        $validSmush = hRule5-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $opts.hardBlank
                    }
                    if (-not $validSmush -and $opts.fittingRules.hRule6) {
                        $validSmush = hRule6-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $opts.hardBlank
                    }

                    if (-not $validSmush) {
                        $curDist -= 1
                        $stopWhile = $true
                        break
                    }
                }
            }
        }
        if($stopWhile) {
            break
        }

        if ($breakAfter) {
            break
        }
        $curDist++
    }

    return [math]::Min($maxDist, $curDist)
}