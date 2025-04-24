# Joins words or single characters into a single Fig line
function Join-FigArray {
    param (
        [array]$array, # Array of ASCII words or single characters: {fig: array, overlap: number}
        [int]$len,     # Height of the characters (number of rows)
        [hashtable]$opts # Options object
    )

    $acc = New-FigChar -len $len
    foreach ($data in $array) {
        $acc = Horizontal-Smush -textBlock1 $acc -textBlock2 $data.fig -overlap $data.overlap -opts $opts
    }
    return $acc
}