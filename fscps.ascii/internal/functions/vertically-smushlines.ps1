
<#
    .SYNOPSIS
        Smushes two lines of text vertically based on specified smushing rules.
        
    .DESCRIPTION
        This function takes two lines of text (`line1` and `line2`) and combines them vertically by applying
        vertical smushing rules. The smushing behavior is determined by the `vLayout` and individual smushing
        rules (`vRule1` to `vRule5`) provided in the `opts` parameter. If no valid smushing rule applies, the
        characters from both lines are retained as-is.
        
    .PARAMETER line1
        The first line of text to smush.
        
    .PARAMETER line2
        The second line of text to smush.
        
    .PARAMETER opts
        A hashtable containing smushing options, including:
        - `fittingRules.vLayout`: Specifies the vertical layout type (e.g., Fitted, UniversalSmushing).
        - `fittingRules.vRule1` to `vRule5`: Boolean flags indicating which smushing rules to apply.
        
    .EXAMPLE
        $line1 = "Hello"
        $line2 = "World"
        $opts = @{
        fittingRules = @{
        vLayout = [LayoutType]::UniversalSmushing
        vRule1 = $true
        vRule2 = $false
        vRule3 = $true
        vRule4 = $false
        vRule5 = $true
        }
        }
        $result = Vertically-SmushLines -line1 $line1 -line2 $line2 -opts $opts
        
        This example smushes the lines "Hello" and "World" using UniversalSmushing and the specified smushing rules.
        
    .NOTES
        This function relies on helper functions (`Uni-Smush`, `vRule1-Smush`, `vRule2-Smush`, `vRule3-Smush`, `vRule4-Smush`, and `vRule5-Smush`)
        to evaluate individual character pairs for smushing.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function Vertically-SmushLines {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseApprovedVerbs", "Create")]
    param (
        [string]$line1,  # First line of text
        [string]$line2,  # Second line of text
        [hashtable]$opts # FIGlet options
    )

    # Determine the minimum length of the two lines
    $len = [math]::Min($line1.Length, $line2.Length)
    $result = ""

    # Iterate through each character in the lines
    for ($ii = 0; $ii -lt $len; $ii++) {
        $ch1 = $line1.Substring($ii, 1)
        $ch2 = $line2.Substring($ii, 1)

        if ($ch1 -ne " " -and $ch2 -ne " ") {
            if ($opts.fittingRules.vLayout -eq [LayoutType]::Fitted) {
                $result += Uni-Smush -ch1 $ch1 -ch2 $ch2
            } elseif ($opts.fittingRules.vLayout -eq [LayoutType]::UniversalSmushing) {
                $result += Uni-Smush -ch1 $ch1 -ch2 $ch2
            } else {
                $validSmush = $false
                if ($opts.fittingRules.vRule5) {
                    $validSmush = vRule5-Smush -ch1 $ch1 -ch2 $ch2
                }
                if (-not $validSmush -and $opts.fittingRules.vRule1) {
                    $validSmush = vRule1-Smush -ch1 $ch1 -ch2 $ch2
                }
                if (-not $validSmush -and $opts.fittingRules.vRule2) {
                    $validSmush = vRule2-Smush -ch1 $ch1 -ch2 $ch2
                }
                if (-not $validSmush -and $opts.fittingRules.vRule3) {
                    $validSmush = vRule3-Smush -ch1 $ch1 -ch2 $ch2
                }
                if (-not $validSmush -and $opts.fittingRules.vRule4) {
                    $validSmush = vRule4-Smush -ch1 $ch1 -ch2 $ch2
                }
                if ($validSmush) {
                    $result += $validSmush
                } else {
                    # If no smushing rule applies, append both characters
                    $result += $ch1 + $ch2
                }
            }
        } else {
            # If one of the characters is a space, use universal smushing
            $result += Uni-Smush -ch1 $ch1 -ch2 $ch2
        }
    }

    return $result
}