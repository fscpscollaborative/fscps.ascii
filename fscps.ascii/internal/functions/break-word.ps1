
<#
    .SYNOPSIS
        Breaks a long word into two parts: the portion that fits within the allowed width and the leftover characters.
        
    .DESCRIPTION
        This function processes a list of ASCII characters (`figChars`) and determines how much of the word can fit
        within the specified width (`opts.width`). It returns the portion that fits (`outputFigText`) and any leftover
        characters (`chars`).
        
    .PARAMETER figChars
        An array of single ASCII characters in the form `{fig, overlap}`. Represents the word to be broken.
        
    .PARAMETER len
        The number of rows to process.
        
    .PARAMETER opts
        A hashtable containing options, including:
        - `width`: The maximum allowed width for the word.
        
    .EXAMPLE
        $figChars = @(
        @{ fig = "H"; overlap = 1 },
        @{ fig = "e"; overlap = 1 },
        @{ fig = "l"; overlap = 1 },
        @{ fig = "l"; overlap = 1 },
        @{ fig = "o"; overlap = 1 }
        )
        $opts = @{
        width = 10
        }
        $result = Break-Word -figChars $figChars -len 2 -opts $opts
        
        This example breaks the word "Hello" into a portion that fits within the width of 10 and any leftover characters.
        
    .NOTES
        This function assumes the existence of helper functions `Join-FigArray` and `Get-FigLinesWidth` for processing
        the ASCII characters and calculating their widths.
#>
function Break-Word {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseApprovedVerbs", "")]
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