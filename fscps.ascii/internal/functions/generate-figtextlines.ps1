


function Generate-FigTextLines {
    param (
        [string]$txt,          # Input text
        [hashtable]$figChars,  # FIGlet characters
        [hashtable]$opts       # Options object
    )

    $overlap = 0
    $height = $opts.height
    $outputFigLines = @()
    $figWords = @()
    $outputFigText = New-FigChar -len $height
    $nextFigChars = $null

    if ($opts.width -gt 0 -and $opts.whitespaceBreak) {
        $nextFigChars = @{
            chars = @()
            overlap = $overlap
        }
    }

    if ($opts.printDirection -eq 1) {
        $txt = ($txt.ToCharArray() | ForEach-Object { $_ })[-1..-($txt.Length)] -join ""
    }

    $len = $txt.Length
    for ($charIndex = 0; $charIndex -lt $len; $charIndex++) {
        $char = $txt.Substring($charIndex, 1)
        $isSpace = $char -match "\s"
        $figChar = $figChars[[int][char]$char]
        $textFigLine = $null

        if ($figChar) {
            if ($opts.fittingRules.hLayout -ne [LayoutType]::Full) {
                $overlap = 10000
                for ($row = 0; $row -lt $opts.height; $row++) {
                    $overlap = [math]::Min(
                        $overlap,
                        (Get-HorizontalSmushLength -txt1 $outputFigText[$row] -txt2 $figChar[$row] -opts $opts)
                    )
                }
                $overlap = if ($overlap -eq 10000) { 0 } else { $overlap }
            }

            if ($opts.width -gt 0) {
                if ($opts.whitespaceBreak) {
                    $textFigWord = Join-FigArray -array ($nextFigChars.chars + @(@{ fig = $figChar; overlap = $overlap })) -len $height -opts $opts
                    $textFigLine = Join-FigArray -array ($figWords + @(@{ fig = $textFigWord; overlap = $nextFigChars.overlap })) -len $height -opts $opts
                    $maxWidth = Get-FigLinesWidth -textLines $textFigLine
                } else {
                    $textFigLine = Horizontal-Smush -textBlock1 $outputFigText -textBlock2 $figChar -overlap $overlap -opts $opts
                    $maxWidth = Get-FigLinesWidth -textLines $textFigLine
                }

                if ($maxWidth -ge $opts.width -and $charIndex -gt 0) {
                    if ($opts.whitespaceBreak) {
                        $outputFigText = Join-FigArray -array $figWords[0..($figWords.Count - 2)] -len $height -opts $opts
                        if ($figWords.Count -gt 1) {
                            $outputFigLines += $outputFigText
                            $outputFigText = New-FigChar -len $height
                        }
                        $figWords = @()
                    } else {
                        $outputFigLines += $outputFigText
                        $outputFigText = New-FigChar -len $height
                    }
                }
            }

            if ($opts.width -gt 0 -and $opts.whitespaceBreak) {
                if (-not $isSpace -or $charIndex -eq $len - 1) {
                    $nextFigChars.chars += @{ fig = $figChar; overlap = $overlap }
                }

                if ($isSpace -or $charIndex -eq $len - 1) {
                    $tmpBreak = $null
                    while ($true) {
                        $textFigLine = Join-FigArray -array $nextFigChars.chars -len $height -opts $opts
                        $maxWidth = Get-FigLinesWidth -textLines $textFigLine
                        if ($maxWidth -ge $opts.width) {
                            $tmpBreak = Break-Word -figChars $nextFigChars.chars -len $height -opts $opts
                            $nextFigChars = @{ chars = $tmpBreak.chars }
                            $outputFigLines += $tmpBreak.outputFigText
                        } else {
                            break
                        }
                    }

                    if ($maxWidth -gt 0) {
                        if ($tmpBreak) {
                            $figWords += @{ fig = $textFigLine; overlap = 1 }
                        } else {
                            $figWords += @{ fig = $textFigLine; overlap = $nextFigChars.overlap }
                        }
                    }

                    if ($isSpace) {
                        $figWords += @{ fig = $figChar; overlap = $overlap }
                        $outputFigText = New-FigChar -len $height
                    }

                    if ($charIndex -eq $len - 1) {
                        $outputFigText = Join-FigArray -array $figWords -len $height -opts $opts
                    }

                    $nextFigChars = @{
                        chars = @()
                        overlap = $overlap
                    }
                    continue
                }
            }

            $outputFigText = Horizontal-Smush -textBlock1 $outputFigText -textBlock2 $figChar -overlap $overlap -opts $opts
        }
    }

    if (Get-FigLinesWidth -textLines $outputFigText -gt 0) {
        $outputFigLines += $outputFigText
    }

    if (-not $opts.showHardBlanks) {
        $outputFigLines = $outputFigLines | ForEach-Object {
            $_ | ForEach-Object {
                $_ -replace [regex]::Escape($opts.hardBlank), " "
            }
        }
    }

    return $outputFigLines
}