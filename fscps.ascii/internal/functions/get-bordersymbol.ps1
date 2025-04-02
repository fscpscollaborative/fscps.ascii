
<#
    .SYNOPSIS
        Retrieves the border symbols for a specified border type.
        
    .DESCRIPTION
        The Get-BorderSymbol function returns a hashtable containing the symbols used for the top-left, top-right, bottom-left, bottom-right corners,
        as well as the spacers for the top, bottom, left, and right sides of a border. The border type is specified using the BorderType enum.
        
    .PARAMETER BorderType
        Specifies the type of border for which to retrieve the symbols. The parameter is mandatory and must be a valid value from the BorderType enum.
        
    .OUTPUTS
        System.Collections.Hashtable
        A hashtable containing the border symbols.
        
    .EXAMPLE
        PS C:\> Get-BorderSymbol -BorderType Box
        
        Returns the border symbols for the "Box" border type.
        
    .EXAMPLE
        PS C:\> Get-BorderSymbol -BorderType Asterisk
        
        Returns the border symbols for the "Asterisk" border type.
        
    .EXAMPLE
        PS C:\> Get-BorderSymbol -BorderType DoubleBox
        
        Returns the border symbols for the "DoubleBox" border type.
        
    .NOTES
        The function uses the BorderType enum for input validation, ensuring only valid border types are accepted.
#>
function Get-BorderSymbol {
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
        'None' { 
            return @{
                TopLeft = ""; TopRight = ""; BottomLeft = ""; BottomRight = "";
                TopSpacer = ""; BottomSpacer = ""; LeftSpacer = ""; RightSpacer = ""
            }
        }
    }
}