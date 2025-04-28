
<#
    .SYNOPSIS
        Loads a FIGlet font from the specified font path and parses its data.
        
    .DESCRIPTION
        This function loads a FIGlet font file by its name from the configured font path. If the font is already
        loaded in the global `$Script:FigFonts` hashtable, it retrieves the cached font data. Otherwise, it reads
        the font file, parses its content, and stores the parsed font options in the global hashtable for future use.
        
    .PARAMETER fontName
        The name of the FIGlet font to load. The font file should have a `.flf` extension and reside in the
        directory specified by `$Script:FigDefaults.fontPath`.
        
    .EXAMPLE
        $fontName = "Standard"
        $fontOptions = Load-Font -fontName $fontName
        
        This example loads the "Standard" FIGlet font and returns its parsed options.
        
    .NOTES
        This function relies on the `Parse-Font` helper function to parse the font data and extract its options.
        If the font file cannot be found or an error occurs during loading, the function logs an error message
        and stops execution.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function Load-Font {
    param (
        [string]$fontName       # Name of the font to load
    )
    # Construct the font URL
    $fontPath = $Script:FigDefaults.fontPath
    $fontUrl =  Join-Path $fontPath "$fontName.flf"
    # Check if the font already exists in the global $Script:FigFonts hashtable
    if ($Script:FigFonts["$fontName"]) {
        return $Script:FigFonts["$fontName"]
    }

    # Fetch the font data
    try {
        $response = (Get-Content -Path $fontUrl -Raw)
        if ($response) {
            # Parse the font and store it in $Script:FigFonts
            $FontData = $response
            $fontOptions = Parse-Font -fontName $fontName -fontData $FontData
            $Script:FigFonts[$fontName] = $fontOptions

            return $fontOptions
        } else {
            throw
        }
    } catch {
        Write-PSFMessage -Level Error -Message "Something went wrong during request to ADO: $($_.ErrorDetails)" -Exception $PSItem.Exception
        Stop-PSFFunction -Message "Stopping because of errors"
        throw $($PSItem.Exception)
    }
}