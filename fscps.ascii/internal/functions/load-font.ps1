

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