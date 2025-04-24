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