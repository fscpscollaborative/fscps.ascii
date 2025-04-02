$path = "$PSScriptRoot\.."

Import-Module "$path\fscps.ascii" -Force

$null = Find-FSCPSCommand -Rebuild -Verbose