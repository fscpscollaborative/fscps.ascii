# **fscps.ascii**

A PowerShell module to handle work with ASCII.

## Getting started
### Install the latest module
```PowerShell
Install-Module -Name fscps.ascii
```

### Install without administrator privileges
```PowerShell
Install-Module -Name fscps.ascii -Scope CurrentUser
```
### List all available commands / functions

```PowerShell
Get-Command -Module fscps.ascii
```

### Update the module

```PowerShell
Update-Module -name fscps.ascii
```

### Update the module - force

```PowerShell
Update-Module -name fscps.ascii -Force
```

# Available functions

# Convert-FSCPSTextToAscii

## Description
The `Convert-FSCPSTextToAscii` function is a PowerShell utility that converts a given text into ASCII art using a specified font. It also supports optional border styles and customizable colors for both the text and the border. This function is ideal for creating visually appealing text banners or decorations in scripts, logs, or console outputs.

## Parameters

### `-Text`
- **Description**: The text to be converted into ASCII art.
- **Type**: `string`
- **Mandatory**: Yes

### `-Font`
- **Description**: The font to be used for generating the ASCII art.
- **Type**: `FontType` (Enum)
- **Mandatory**: Yes

### `-BorderType`
- **Description**: The type of border to apply around the ASCII art.
- **Type**: `BorderType` (Enum)
- **Mandatory**: No
- **Default**: `None`

### `-TextColor`
- **Description**: The color to use for the ASCII art text.
- **Type**: `string`
- **Mandatory**: No
- **Default**: `White`
- **Valid Values**: `Black`, `DarkBlue`, `DarkGreen`, `DarkCyan`, `DarkRed`, `DarkMagenta`, `DarkYellow`, `Gray`, `DarkGray`, `Blue`, `Green`, `Cyan`, `Red`, `Magenta`, `Yellow`, `White`

### `-BorderColor`
- **Description**: The color to use for the border.
- **Type**: `string`
- **Mandatory**: No
- **Default**: `Gray`
- **Valid Values**: `Black`, `DarkBlue`, `DarkGreen`, `DarkCyan`, `DarkRed`, `DarkMagenta`, `DarkYellow`, `Gray`, `DarkGray`, `Blue`, `Green`, `Cyan`, `Red`, `Magenta`, `Yellow`, `White`

### `-Timestamp`
- **Description**: Enables or disables detailed information (timestamp and function name) in the output.
- **Type**: `bool`
- **Mandatory**: No
- **Default**: `False`
- **Valid Values**: `True`, `False`
## Examples

### Example 1: Basic ASCII Art
- **Description**:  Converts the text "Hello" into ASCII art using the "Standard" font without any border or color customization.
```powershell
Convert-FSCPSTextToAscii -Text "Hello" -Font "Standard"
```
- **Output**:

![Example_1](images/screenshots/example_1.png)

### Example 2: ASCII Art with Border
- **Description**: Converts the text "Welcome" into ASCII art using the "Slant" font and surrounds it with a box border.
```powershell
Convert-FSCPSTextToAscii -Text "Welcome" -Font "Slant" -BorderType Box
```
- **Output**:

![Example_2](images/screenshots/example_2.png)

### Example 3: ASCII Art with Custom Colors
- **Description**: Converts the text "PowerShell" into ASCII art using the "Big" font, surrounds it with an asterisk border, and applies yellow text with a green border.
```powershell
Convert-FSCPSTextToAscii -Text "PowerShell" -Font "Big" -BorderType Asterisk -TextColor Yellow -BorderColor Green
```
- **Output**:

![Example_3](images/screenshots/example_3.png)

### Example 4: ASCII Art with No Border and Custom Text Color
- **Description**: Converts the text "No Border" into ASCII art using the "Standard" font with cyan-colored text and no border.
```powershell
Convert-FSCPSTextToAscii -Text "No Border" -Font "Standard" -TextColor Cyan
```
- **Output**:

![Example_4](images/screenshots/example_4.png)

### Example 5: ASCII Art with Dots Border
- **Description**: Converts the text "Dots Border" into ASCII art using the "Standard" font, surrounds it with a dots border, and applies magenta text with a dark gray border.
```powershell
Convert-FSCPSTextToAscii -Text "Dots Border" -Font "Standard" -BorderType Dots -TextColor Magenta -BorderColor DarkGray
```
- **Output**:

![Example_5](images/screenshots/example_5.png)

### Example 6: ASCII Art with Timestamp
- **Description**: Converts the text "Timestamp Example" into ASCII art using the "Standard" font, surrounds it with a box border, and enables detailed information (timestamp) in the output.
```powershell
Convert-FSCPSTextToAscii -Text "Timestamp Example" -Font "Standard" -BorderType Box -Timestamp
```
- **Output**:

![Example_6](images/screenshots/example_6.png)

### Requirements
- PowerShell 5.1 or later  
- `PSFramework` module (if used for additional functionality)

### License
This script is provided under the MIT License. Feel free to use and modify it as needed.