
<#
    .SYNOPSIS
        Combines two horizontal text blocks with optional overlapping smushing.
        
    .DESCRIPTION
        The Horizontal-Smush function takes two horizontal text blocks (`textBlock1` and `textBlock2`) and combines
        them into a single text block. If an overlap is specified, the function applies horizontal smushing rules
        to the overlapping characters. The smushing behavior is determined by the options provided in the `opts`
        parameter, including the horizontal layout type (`hLayout`) and specific smushing rules (`hRule1` to `hRule6`).
        
        The function processes each line of the text blocks, calculates the overlapping segments, and applies the
        appropriate smushing rules to generate the combined output.
        
    .PARAMETER textBlock1
        An array of strings representing the first horizontal text block.
        
    .PARAMETER textBlock2
        An array of strings representing the second horizontal text block.
        
    .PARAMETER overlap
        The number of overlapping characters to smush. If set to 0, no smushing is applied, and the text blocks
        are concatenated.
        
    .PARAMETER opts
        A hashtable containing options for horizontal smushing, including:
        - `fittingRules.hLayout`: Specifies the horizontal layout type (e.g., Fitted, UniversalSmushing, ControlledSmushing).
        - `fittingRules.hRule1` to `hRule6`: Boolean flags indicating which smushing rules to apply.
        - `hardBlank`: The character used to represent hard blanks in FIGlet fonts.
        - `height`: The number of rows in the text blocks.
        
    .EXAMPLE
        $textBlock1 = @(
        "Hello",
        "World"
        )
        $textBlock2 = @(
        "Foo",
        "Bar"
        )
        $opts = @{
        fittingRules = @{
        hLayout = [LayoutType]::ControlledSmushing
        hRule1 = $true
        hRule2 = $false
        hRule3 = $true
        hRule4 = $false
        hRule5 = $true
        hRule6 = $false
        }
        hardBlank = "@"
        height = 2
        }
        $result = Horizontal-Smush -textBlock1 $textBlock1 -textBlock2 $textBlock2 -overlap 3 -opts $opts
        
        This example combines two horizontal text blocks with 3 characters of overlap using ControlledSmushing rules.
        
    .NOTES
        This function relies on the following helper functions:
        - `Uni-Smush`: Applies universal smushing rules to overlapping characters.
        - `hRule1-Smush` to `hRule6-Smush`: Applies specific controlled smushing rules to overlapping characters.
        
        Author: Oleksandr Nikolaiev (@onikolaiev)
#>
function Horizontal-Smush {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseApprovedVerbs", "")]
    param (
        [string[]]$textBlock1,  # First text block
        [string[]]$textBlock2,  # Second text block
        [int]$overlap,          # Overlap length
        [hashtable]$opts        # Options containing fitting rules and hardBlank
    )

    $outputFig = @()
    $height = $opts.height

    for ($ii = 0; $ii -lt $height; $ii++) {
        $txt1 = $textBlock1[$ii]
        $txt2 = $textBlock2[$ii]
        $len1 = $txt1.Length
        $len2 = $txt2.Length
        $overlapStart = $len1 - $overlap
        $piece1 = $txt1.Substring(0, [math]::Max(0, $overlapStart))
        $piece2 = ""

        # Determine overlap piece
        $seg1StartPos = [math]::Max(0, $len1 - $overlap)
        $seg1 = $txt1.Substring($seg1StartPos, [math]::Min($overlap, $len1 - $seg1StartPos))
        $seg2 = $txt2.Substring(0, [math]::Min($overlap, $len2))

        for ($jj = 0; $jj -lt $overlap; $jj++) {
            $ch1 = if ($jj -lt $len1) { $seg1[$jj] } else { " " }
            $ch2 = if ($jj -lt $len2) { $seg2[$jj] } else { " " }

            if ($ch1 -ne " " -and $ch2 -ne " ") {
                if ($opts.fittingRules.hLayout -eq [LayoutType]::Fitted) {
                    $piece2 += Uni-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $opts.hardBlank
                } elseif ($opts.fittingRules.hLayout -eq [LayoutType]::UniversalSmushing) {
                    $piece2 += Uni-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $opts.hardBlank
                } else {
                    # Controlled Smushing
                    $nextCh = ""
                    if (-not $nextCh -and $opts.fittingRules.hRule1) {
                        $nextCh = hRule1-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $opts.hardBlank
                    }
                    if (-not $nextCh -and $opts.fittingRules.hRule2) {
                        $nextCh = hRule2-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $opts.hardBlank
                    }
                    if (-not $nextCh -and $opts.fittingRules.hRule3) {
                        $nextCh = hRule3-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $opts.hardBlank
                    }
                    if (-not $nextCh -and $opts.fittingRules.hRule4) {
                        $nextCh = hRule4-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $opts.hardBlank
                    }
                    if (-not $nextCh -and $opts.fittingRules.hRule5) {
                        $nextCh = hRule5-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $opts.hardBlank
                    }
                    if (-not $nextCh -and $opts.fittingRules.hRule6) {
                        $nextCh = hRule6-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $opts.hardBlank
                    }
                    $nextCh = if ($nextCh) { $nextCh } else { Uni-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $opts.hardBlank }
                    $piece2 += $nextCh
                }
            } else {
                $piece2 += Uni-Smush -ch1 $ch1 -ch2 $ch2 -hardBlank $opts.hardBlank
            }
        }

        if ($overlap -ge $len2) {
            $piece3 = ""
        } else {
            $piece3 = $txt2.Substring($overlap, [math]::Max(0, $len2 - $overlap))
        }

        $outputFig += $piece1 + $piece2 + $piece3
    }

    return $outputFig
}