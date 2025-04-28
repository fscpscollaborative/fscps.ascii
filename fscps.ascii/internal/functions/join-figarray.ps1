
<#
    .SYNOPSIS
        Joins an array of ASCII words or single characters into a single FIGlet line.
        
    .DESCRIPTION
        This function combines an array of ASCII words or single characters into a single FIGlet line.
        It processes each element in the array and smushes it horizontally with the accumulated result
        using the specified smushing rules and options.
        
    .PARAMETER array
        An array of ASCII words or single characters. Each element is a hashtable with the following keys:
        - `fig`: The FIGlet representation of the word or character.
        - `overlap`: The number of overlapping characters to smush.
        
    .PARAMETER len
        The height of the FIGlet characters (number of rows).
        
    .PARAMETER opts
        A hashtable containing options for smushing, including:
        - `fittingRules.hLayout`: Specifies the horizontal layout type (e.g., Full, Fitted, ControlledSmushing).
        - Additional smushing rules for evaluating overlaps.
        
    .EXAMPLE
        $array = @(
        @{ fig = @("H", "H"); overlap = 1 },
        @{ fig = @("e", "e"); overlap = 1 },
        @{ fig = @("l", "l"); overlap = 1 },
        @{ fig = @("l", "l"); overlap = 1 },
        @{ fig = @("o", "o"); overlap = 1 }
        )
        $len = 2
        $opts = @{
        fittingRules = @{
        hLayout = [LayoutType]::ControlledSmushing
        }
        }
        $result = Join-FigArray -array $array -len $len -opts $opts
        
        This example joins the characters "H", "e", "l", "l", and "o" into a single FIGlet line.
        
    .NOTES
        This function relies on the `Horizontal-Smush` helper function to smush characters horizontally
        and the `New-FigChar` function to initialize the accumulator.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function Join-FigArray {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseApprovedVerbs", "Create")]
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