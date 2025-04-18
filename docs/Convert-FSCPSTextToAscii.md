﻿---
external help file: fscps.ascii-help.xml
Module Name: fscps.ascii
online version:
schema: 2.0.0
---

# Convert-FSCPSTextToAscii

## SYNOPSIS
Converts a given text to ASCII art using a specified font and optional border style with color support.

## SYNTAX

```
Convert-FSCPSTextToAscii [-Text] <String> [-Font] <FontType> [[-BorderType] <BorderType>]
 [[-TextColor] <String>] [[-BorderColor] <String>] [-Timestamp] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
The Convert-FSCPSTextToAscii function takes a string input and converts it into ASCII art using the specified font.
Optionally, a border style and colors for the text and border can be applied.
The function supports various fonts
and border styles, allowing for customization of the output.
The text and border colors can also be specified
to enhance the visual appearance of the ASCII art.

This function is ideal for creating visually appealing text banners or decorations in scripts, logs, or console outputs.

## EXAMPLES

### EXAMPLE 1
```
Convert-FSCPSTextToAscii -Text "Hello" -Font "Standard" -BorderType Asterisk -TextColor Yellow -BorderColor Green -DetailedInfo $true
```

Converts the text "Hello" into ASCII art using the "Standard" font, surrounds it with an asterisk border, and applies yellow text with a green border.
Detailed information (timestamp and function name) is enabled.

## PARAMETERS

### -Text
The text to be converted into ASCII art.
This parameter is mandatory.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Font
The font to be used for generating the ASCII art.
This parameter is mandatory.

```yaml
Type: FontType
Parameter Sets: (All)
Aliases:
Accepted values: Acrobatic, Alligator, Alligator2, Alpha, Alphabet, Arrows, Avatar, B1FF, Banner, Banner3, Banner4, Barbwire, Basic, Bear, Bell, Benjamin, Big, Bigfig, Binary, Block, Blocks, Bloody, Bolger, Braced, Bright, Broadway, Bubble, Bulbhead, Caligraphy, Caligraphy2, Cards, Catwalk, Chiseled, Chunky, Coinstak, Cola, Colossal, Computer, Contessa, Contrast, Cosmike, Cosmike2, Crawford, Crawford2, Crazy, Cricket, Cursive, Cyberlarge, Cybermedium, Cybersmall, Cygnet, DANC4, Decimal, DiamFont, Diamond, Digital, Doh, Doom, Double, DWhistled, Electronic, Elite, Epic, Fender, Fraktur, Fuzzy, Georgi16, Georgia11, Ghost, Ghoulish, Glenyn, Goofy, Gothic, Graceful, Gradient, Graffiti, Greek, Hex, Hieroglyphs, Hollywood, Impossible, Invita, Isometric1, Isometric2, Isometric3, Isometric4, Italic, Ivrit, Jacky, Jazmine, Jerusalem, Katakana, Kban, Keyboard, Knob, Konto, LCD, Lean, Letters, Linux, Lockergnome, Madrid, Marquee, Maxfour, Merlin1, Merlin2, Mike, Mini, Mirror, Mnemonic, Modular, Morse, Morse2, Moscow, Mshebrew210, Muzzle, Nancyj, Nipples, NScript, O8, Octal, Ogre, OS2, Pagga, Pawp, Peaks, Pebbles, Pepper, Poison, Puffy, Puzzle, Pyramid, Rammstein, Rectangles, Relief, Relief2, Reverse, Roman, Rot13, Rotated, Rounded, Rozzo, RubiFont, Runic, Runyc, Script, Serifcap, Shadow, Shimrod, Short, Slant, Slide, Small, Soft, Speed, Spliff, Stacey, Stampate, Stampatello, Standard, Stellar, Stforek, Stop, Straight, Swan, Sweet, Tanja, Tengwar, Term, Test1, Thick, Thin, THIS, Thorned, Ticks, Tiles, Tombstone, Train, Trek, Tsalagi, Tubular, Twisted, Univers, Varsity, Wavy, Weird, Whimsy, Wow

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BorderType
The type of border to apply around the ASCII art.
This parameter is optional and defaults to 'None'.

```yaml
Type: BorderType
Parameter Sets: (All)
Aliases:
Accepted values: None, Asterisk, Hash, Box, TwoLinesFrame, BoxBorder, DoubleBox, DoubleCorners, BubbleBorder, Plus, Dots

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TextColor
The color to use for the ASCII art text.
This parameter is optional and defaults to 'White'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: White
Accept pipeline input: False
Accept wildcard characters: False
```

### -BorderColor
The color to use for the border.
This parameter is optional and defaults to 'Gray'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: Gray
Accept pipeline input: False
Accept wildcard characters: False
```

### -Timestamp
Enables or disables detailed information (timestamp) in the output.
Defaults to \`$false\`.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Author: Oleksandr Nikolaiev (@onikolaiev)

## RELATED LINKS
