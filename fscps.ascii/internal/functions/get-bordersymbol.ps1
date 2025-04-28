
<#
    .SYNOPSIS
        Retrieves the border symbols for a specified border type.
        
    .DESCRIPTION
        This function returns a hashtable containing the symbols used for constructing borders
        based on the specified border type. The hashtable includes symbols for the corners,
        spacers, and edges of the border.
        
    .PARAMETER BorderType
        The type of border to retrieve symbols for. Valid values are defined in the `BorderType` enum
        and include:
        - `Asterisk`
        - `Hash`
        - `Plus`
        - `Box`
        - `TwoLinesFrame`
        
    .EXAMPLE
        $borderSymbols = Get-BorderSymbol -BorderType "Box"
        
        This example retrieves the border symbols for the "Box" border type.
        
    .EXAMPLE
        $borderSymbols = Get-BorderSymbol -BorderType "Asterisk"
        
        This example retrieves the border symbols for the "Asterisk" border type.
        
    .NOTES
        This function uses a switch statement to map the specified border type to its corresponding
        symbols. The returned hashtable includes the following keys:
        - `TopLeft`, `TopRight`, `BottomLeft`, `BottomRight`: Symbols for the corners.
        - `TopSpacer`, `BottomSpacer`: Symbols for the horizontal edges.
        - `LeftSpacer`, `RightSpacer`: Symbols for the vertical edges.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function Get-BorderSymbol {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseApprovedVerbs", "")]
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param (
        [Parameter(Mandatory = $true)]
        [BorderType] # Use the enum for validation
        $BorderType
    )

    switch ($BorderType) {
        'Asterisk' { 
            return @{
                TopLeft = "*"; TopRight = "*"; BottomLeft = "*"; BottomRight = "*";
                TopSpacer = "*"; BottomSpacer = "*"; LeftSpacer = "*"; RightSpacer = "*"
            }
        }
        'Hash' { 
            return @{
                TopLeft = "#"; TopRight = "#"; BottomLeft = "#"; BottomRight = "#";
                TopSpacer = "#"; BottomSpacer = "#"; LeftSpacer = "#"; RightSpacer = "#"
            }
        }
        'Plus' { 
            return @{
                TopLeft = "+"; TopRight = "+"; BottomLeft = "+"; BottomRight = "+";
                TopSpacer = "+"; BottomSpacer = "+"; LeftSpacer = "+"; RightSpacer = "+"
            }
        }
        'Box' {
            return @{
                TopLeft = "┌"; TopRight = "┐"; BottomLeft = "└"; BottomRight = "┘";
                TopSpacer = "─"; BottomSpacer = "─"; LeftSpacer = "│"; RightSpacer = "│"
            }
        }
        'TwoLinesFrame' {
            return @{
                TopLeft = "/"; TopRight = "\"; BottomLeft = "\"; BottomRight = "/";
                TopSpacer = "="; BottomSpacer = "="; LeftSpacer = "||"; RightSpacer = "||"
            }
        }
        'DoubleBox' {
            return @{
                TopLeft = "╔"; TopRight = "╗"; BottomLeft = "╚"; BottomRight = "╝";
                TopSpacer = "═"; BottomSpacer = "═"; LeftSpacer = "║"; RightSpacer = "║"
            }
        }
        'DoubleCorners' {
            return @{
                TopLeft = "╔"; TopRight = "╗"; BottomLeft = "╚"; BottomRight = "╝";
                TopSpacer = "─"; BottomSpacer = "─"; LeftSpacer = "│"; RightSpacer = "│"
            }
        }
        'BubbleBorder' {
            return @{
                TopLeft = "(_)"; TopRight = "(_)"; BottomLeft = "(_)"; BottomRight = "(_)";
                TopSpacer = "(_)"; BottomSpacer = "(_)"; LeftSpacer = "(_)"; RightSpacer = "(_)"
            }
        }
        'BoxBorder' {
            return @{
                TopLeft = "|_|"; TopRight = "|_|"; BottomLeft = "|_|"; BottomRight = "|_|";
                TopSpacer = "|_|"; BottomSpacer = "|_|"; LeftSpacer = "|_|"; RightSpacer = "|_|"
            }
        }
        'Dots' { 
            return @{
                TopLeft = "."; TopRight = "."; BottomLeft = ":"; BottomRight = ":";
                TopSpacer = "."; BottomSpacer = "."; LeftSpacer = ":"; RightSpacer = ":"
            }
        }
        'DoubleDots' { 
            return @{
                TopLeft = "::"; TopRight = "::"; BottomLeft = "::"; BottomRight = "::";
                TopSpacer = ":"; BottomSpacer = ":"; LeftSpacer = "::"; RightSpacer = "::"
            }
        }
        'None' { 
            return @{
                TopLeft = ""; TopRight = ""; BottomLeft = ""; BottomRight = "";
                TopSpacer = ""; BottomSpacer = ""; LeftSpacer = ""; RightSpacer = ""
            }
        }
    }
}