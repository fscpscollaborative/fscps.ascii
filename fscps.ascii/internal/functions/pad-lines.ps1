
<#
    .SYNOPSIS
        Pads each line in an array of strings with a specified number of spaces.
        
    .DESCRIPTION
        This function takes an array of strings (`lines`) and appends a specified number of spaces (`numSpaces`)
        to the end of each line. It returns a new array containing the padded lines.
        
    .PARAMETER lines
        An array of strings representing the lines to be padded.
        
    .PARAMETER numSpaces
        The number of spaces to append to the end of each line.
        
    .EXAMPLE
        $lines = @("Line1", "Line2", "Line3")
        $numSpaces = 4
        $paddedLines = Pad-Lines -lines $lines -numSpaces $numSpaces
        
        This example pads each line in the array with 4 spaces and returns the padded lines.
        
    .NOTES
        This function creates a new array to store the padded lines and does not modify the original input array.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function Pad-Lines {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseApprovedVerbs", "Create")]
    param (
        [string[]]$lines,     # Array of lines to pad
        [int]$numSpaces       # Number of spaces to pad
    )

    # Create the padding string
    $padding = " " * $numSpaces

    # Create a new array with padded lines
    $paddedLines = @()
    foreach ($line in $lines) {
        $paddedLines += $line + $padding
    }

    return $paddedLines
}