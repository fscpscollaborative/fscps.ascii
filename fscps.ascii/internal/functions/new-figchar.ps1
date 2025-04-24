

# Creates a new empty ASCII placeholder of given length
function New-FigChar {
    [OutputType([string[]])]
    param (
        [int]$len # Number of rows
    )

    $outputFigText = @()
    for ($row = 0; $row -lt $len; $row++) {
        $outputFigText += ""
    }
    return $outputFigText
}