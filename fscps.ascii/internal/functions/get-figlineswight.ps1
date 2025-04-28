
<#
    .SYNOPSIS
        Calculates the maximum line width of the provided ASCII art text.
        
    .DESCRIPTION
        This function takes an array of text lines as input and determines the maximum width
        (number of characters) among all the lines. It is useful for measuring the width of
        ASCII art or text blocks.
        
    .PARAMETER textLines
        An array of strings representing the lines of text to measure.
        
    .EXAMPLE
        $textLines = @(
        "Hello, World!",
        "This is a test.",
        "PowerShell"
        )
        $maxWidth = Get-FigLinesWidth -textLines $textLines
        
        This example calculates the maximum line width from the provided text lines.
        
    .NOTES
        This function uses the `Measure-Object` cmdlet to determine the maximum length of the lines.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function Get-FigLinesWidth {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseApprovedVerbs", "Create")]
    param (
        [string[]]$textLines # Array of lines for text
    )

    return ($textLines | ForEach-Object { $_.Length } | Measure-Object -Maximum).Maximum
}