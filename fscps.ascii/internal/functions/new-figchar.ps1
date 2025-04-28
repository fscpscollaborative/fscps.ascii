
<#
    .SYNOPSIS
        Creates a new empty ASCII placeholder with the specified number of rows.
        
    .DESCRIPTION
        This function generates an array of empty strings, where the number of elements in the array corresponds
        to the specified number of rows. It is typically used as a placeholder for FIGlet characters or ASCII art
        that will be populated later.
        
    .PARAMETER len
        The number of rows to include in the placeholder. Each row is represented as an empty string.
        
    .EXAMPLE
        $placeholder = New-FigChar -len 5
        
        This example creates a placeholder with 5 rows, each represented as an empty string.
        
    .NOTES
        This function is useful for initializing FIGlet character arrays or ASCII art structures.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function New-FigChar {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseApprovedVerbs", "")]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions','')]
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