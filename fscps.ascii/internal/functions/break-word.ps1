# Breaks a long word, returning leftover characters and the line before the break
function Break-Word {
    param (
        [array]$figChars, # List of single ASCII characters in form {fig, overlap}
        [int]$len,        # Number of rows
        [hashtable]$opts  # Options object
    )

    $result = @{}
    for ($i = $figChars.Count; --$i -ge 0; ) {
        # Join the figChars up to the current index
        $w = Join-FigArray -array $figChars[0..($i)] -len $len -opts $opts
        # Check if the width of the joined array is within the allowed width
        if ((Get-FigLinesWidth -textLines $w) -le $opts.width) {
            $result["outputFigText"] = $w
            # If there are leftover characters, add them to the result
            if ($i -lt $figChars.Count) {
                $result["chars"] = $figChars[$i..($figChars.Count)]
            } else {
                $result["chars"] = @()
            }
            break
        }
    }
    return $result
}