function Get-BorderSymbols {
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param (
        [Parameter(Mandatory = $true)]
        [BorderType] # Use the enum for validation
        [string]$BorderType
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