# Script to generate the comment based markdown help files.
# based on https://gist.github.com/Splaxi/8934e13cb35918d13af6e3a21c208b0e
# See also https://github.com/fscpscollaborative/fscps.ascii/wiki/Building-tools
$path = "$PSScriptRoot\.."

Import-Module "$path\fscps.ascii" -Force

Remove-Item -Path "$path\docs\*.md"
$null = New-MarkdownHelp -Module fscps.ascii -OutputFolder "$path\docs" -Force

Get-ChildItem -Path "$path\docs" -Recurse -File | Set-PSMDEncoding