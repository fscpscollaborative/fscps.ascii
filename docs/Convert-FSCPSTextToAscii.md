---
external help file: fscps.ascii-help.xml
Module Name: fscps.ascii
online version:
schema: 2.0.0
---

# Convert-FSCPSTextToAscii

## SYNOPSIS
Converts a given text to ASCII art using a specified font and optional border style.

## SYNTAX

```
Convert-FSCPSTextToAscii [-Text] <String> [-Font] <String> [[-BorderType] <BorderType>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The Convert-FSCPSTextToAscii function takes a string input and converts it into ASCII art using the specified font.

Optionally, a border style can be applied around the ASCII art, such as asterisks, hashes, or other symbols.

## EXAMPLES

### EXAMPLE 1
```
Convert-FSCPSTextToAscii -Text "Hello" -Font "Standard" -BorderType Asterisk
```

Converts the text "Hello" into ASCII art using the "Standard" font and surrounds it with an asterisk border.

### EXAMPLE 2
```
Convert-FSCPSTextToAscii -Text "World" -Font "Slant"
```

Converts the text "World" into ASCII art using the "Slant" font without any border.

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
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BorderType
The type of border to apply around the ASCII art.
This parameter is optional and defaults to 'None'.

Supported values include 'Asterisk', 'Hash', and 'Plus'.

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
Tags: Configuration, Azure, Storage

Author: Oleksandr Nikolaiev (@onikolaiev)

## RELATED LINKS
