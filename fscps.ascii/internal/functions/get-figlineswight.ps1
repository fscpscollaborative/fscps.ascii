# Returns the maximum line width of the ASCII Art
function Get-FigLinesWidth {
    param (
        [string[]]$textLines # Array of lines for text
    )

    return ($textLines | ForEach-Object { $_.Length } | Measure-Object -Maximum).Maximum
}