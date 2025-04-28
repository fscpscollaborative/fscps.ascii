
<#
    .SYNOPSIS
        Determines if two lines of text can be vertically smushed based on the specified smushing rules.
        
    .DESCRIPTION
        This function evaluates whether two lines of text (`txt1` and `txt2`) can be vertically smushed together
        according to the vertical smushing rules defined in the `opts.fittingRules` parameter. It iterates through
        each character in the lines and applies the appropriate smushing rules to determine if the lines can be
        combined. The function returns whether the smushing is valid, invalid, or has ended.
        
    .PARAMETER txt1
        The first line of text to evaluate for vertical smushing.
        
    .PARAMETER txt2
        The second line of text to evaluate for vertical smushing.
        
    .PARAMETER opts
        A hashtable containing the smushing options, including:
        - `fittingRules.vLayout`: Specifies the vertical layout type (e.g., Full, Fitted, UniversalSmushing).
        - `fittingRules.vRule1` to `vRule4`: Boolean flags indicating which smushing rules to apply.
        
    .EXAMPLE
        $txt1 = "Hello"
        $txt2 = "World"
        $opts = @{
        fittingRules = @{
        vLayout = [LayoutType]::UniversalSmushing
        vRule1 = $true
        vRule2 = $false
        vRule3 = $true
        vRule4 = $false
        }
        }
        $result = Can-VerticalSmush -txt1 $txt1 -txt2 $txt2 -opts $opts
        
        This example checks if the lines "Hello" and "World" can be vertically smushed using the specified smushing rules.
        
    .NOTES
        This function relies on helper functions (`vRule1-Smush`, `vRule2-Smush`, `vRule3-Smush`, `vRule4-Smush`, and `vRule5-Smush`)
        to evaluate individual smushing rules for character pairs.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function Can-VerticalSmush {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseApprovedVerbs", "Create")]
    param (
        [string]$txt1,  # A line of text
        [string]$txt2,  # A line of text
        [hashtable]$opts  # FIGlet options array
    )

    # Check if the vertical layout is FULL_WIDTH
    if ($opts.fittingRules.vLayout -eq [LayoutType]::Full) {
        return "invalid"
    }

    # Determine the minimum length of the two lines
    $len = [math]::Min($txt1.Length, $txt2.Length)
    if ($len -eq 0) {
        return "invalid"
    }

    $endSmush = $false
    $validSmush = $false

    # Iterate through each character in the lines
    for ($ii = 0; $ii -lt $len; $ii++) {
        $ch1 = $txt1[$ii]
        $ch2 = $txt2[$ii]
        # Check if both characters are not spaces
        if ($ch1 -ne " " -and $ch2 -ne " ") {
            if ($opts.fittingRules.vLayout -eq [LayoutType]::Fitted) {
                return "invalid"
            } elseif ($opts.fittingRules.vLayout -eq [LayoutType]::UniversalSmushing) {
                return "end"
            } else {
                # Apply smushing rules
                if (vRule5-Smush -ch1 $ch1 -ch2 $ch2) {
                    $endSmush = $endSmush -or $false
                    continue
                }

                $validSmush = $false
                if ($opts.fittingRules.vRule1) {
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

                $endSmush = $true
                if (-not $validSmush) {
                    return "invalid"
                }
            }
        }
    }

    # Return the result based on whether smushing has ended
    if ($endSmush) {
        return "end"
    } else {
        return "valid"
    }
}