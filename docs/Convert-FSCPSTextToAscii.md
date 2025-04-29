---
external help file: fscps.ascii-help.xml
Module Name: fscps.ascii
online version:
schema: 2.0.0
---

# Convert-FSCPSTextToAscii

## SYNOPSIS
Converts a given text into ASCII art using a specified font and customizable options.

## SYNTAX

```
Convert-FSCPSTextToAscii [-Text] <String> [-Font] <String> [[-BorderType] <BorderType>] [[-TextColor] <String>]
 [[-BorderColor] <String>] [-Timestamp] [[-VerticalLayout] <LayoutType>] [[-HorizontalLayout] <LayoutType>]
 [-ShowHardBlanks] [-WhitespaceBreak] [[-ScreenWigth] <Int32>] [[-Padding] <Int32>] [-PrintDirection]
 [[-OutputColorVariable] <String>] [[-OutputNoColorVariable] <String>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
The Convert-FSCPSTextToAscii function generates ASCII art from the provided text using the specified font.
It supports optional customization, including border styles, text and border colors, layout types, and additional
formatting options such as showing hard blanks or breaking lines at whitespace.
The function is highly configurable
and can be used to create visually appealing text banners or decorations for console outputs.

The function also supports outputting the ASCII art with or without color to custom variables, allowing for
further processing or storage of the generated ASCII art.

## EXAMPLES

### EXAMPLE 1
```
Convert-FSCPSTextToAscii -Text "Hello, World!" -Font "Standard" -BorderType Box -TextColor Yellow -BorderColor Blue -Timestamp
```

Converts the text "Hello, World!" into ASCII art using the "Standard" font, applies a box border, and uses yellow text with a blue border.
A timestamp is included in the output.

### EXAMPLE 2
```
Convert-FSCPSTextToAscii -Text "PowerShell" -Font "Big" -BorderType Asterisk -TextColor Cyan -BorderColor Green -OutputColorVariable "ColoredOutput" -OutputNoColorVariable "PlainOutput"
```

Converts the text "PowerShell" into ASCII art using the "Big" font, applies an asterisk border, and uses cyan text with a green border.
The colored and plain outputs are stored in the variables \`ColoredOutput\` and \`PlainOutput\`, respectively.

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
Defaults to \`None\`.

```yaml
Type: BorderType
Parameter Sets: (All)
Aliases:
Accepted values: None, Asterisk, Hash, Box, TwoLinesFrame, BoxBorder, DoubleBox, DoubleCorners, BubbleBorder, Plus, Dots, DoubleDots

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TextColor
The color to use for the ASCII art text.
Defaults to \`White\`.

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
Defaults to \`Gray\`.

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
A switch to include a timestamp in the output.
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

### -VerticalLayout
Specifies the vertical layout type for the ASCII art.
Defaults to \`Default\`.

```yaml
Type: LayoutType
Parameter Sets: (All)
Aliases:
Accepted values: Default, Full, Fitted, ControlledSmushing, UniversalSmushing

Required: False
Position: 6
Default value: Default
Accept pipeline input: False
Accept wildcard characters: False
```

### -HorizontalLayout
Specifies the horizontal layout type for the ASCII art.
Defaults to \`Default\`.

```yaml
Type: LayoutType
Parameter Sets: (All)
Aliases:
Accepted values: Default, Full, Fitted, ControlledSmushing, UniversalSmushing

Required: False
Position: 7
Default value: Default
Accept pipeline input: False
Accept wildcard characters: False
```

### -ShowHardBlanks
A switch to display hard blanks in the ASCII art.
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

### -WhitespaceBreak
A switch to enable breaking lines at whitespace.
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

### -ScreenWigth
The maximum width of the screen for rendering the ASCII art.
Defaults to \`100\`.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: 100
Accept pipeline input: False
Accept wildcard characters: False
```

### -Padding
The padding to apply to the ASCII art.
Defaults to \`0\`.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -PrintDirection
A switch to specify the print direction of the ASCII art.
Defaults to left-to-right.

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

### -OutputColorVariable
The name of the variable to store the ASCII art with color formatting.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutputNoColorVariable
The name of the variable to store the ASCII art without color formatting.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
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
This function uses the PSFramework module for logging and configuration management.
Ensure the PSFramework module
is installed and imported before using this function.

Author: Oleksandr Nikolaiev (@onikolaiev)

## RELATED LINKS
