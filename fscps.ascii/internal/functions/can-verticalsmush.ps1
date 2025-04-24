

function Can-VerticalSmush {
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