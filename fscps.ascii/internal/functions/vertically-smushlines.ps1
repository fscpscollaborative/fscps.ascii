function Vertically-SmushLines {
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