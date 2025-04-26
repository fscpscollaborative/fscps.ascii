function Generate-Text {
    param (
        [string]$fontName,   # Font to use
        [hashtable]$options, # Options to override the defaults
        [string]$txt         # The text to make into ASCII Art
    )

    # Replace line endings with "\n"
    $txt = $txt -replace "`r`n", "`n" -replace "`r", "`n"

    # Split the text into lines
    $lines = $txt -split "`n"
    $figLines = @()
    
    # Generate FIGlet lines for each line of text
    foreach ($line in $lines) {
        
        $figLines += Generate-FigTextLines -txt $line -figChars $Script:FigFonts[$fontName] -opts $options
    }
    # Combine the FIGlet lines vertically
    $output = $figLines[0]
    for ($ii = 1; $ii -lt $figLines.Count; $ii++) {
        $lines = $figLines[$ii]  
        $output = Smush-VerticalFigLines -output $output -lines $lines -opts $options
    }
    # Return the final output as a single string
    return $output -join "`n"
}