# Script to generate the parameter unit tests.
# based on https://gist.github.com/Splaxi/2a24fc3c5193089ae7047ac5b8f104db
# See also https://github.com/fscpscollaborative/fscps.ascii/wiki/Building-tools
$path = "$PSScriptRoot\..\fscps.ascii"

Import-Module $path -Force -ErrorAction SilentlyContinue

$excludeCommands = @()

$commandsRaw = Get-Command -Module fscps.ascii -CommandType Function

if ($excludeCommands.Count -gt 0) {
    $commands = $commandsRaw | Select-String -Pattern $excludeCommands -SimpleMatch -NotMatch

} else {
    $commands = $commandsRaw
}

Remove-Item -Path "$path\tests\functions\*.Tests.ps1"
foreach ( $commandName in $commands) {
    Invoke-PSMDTemplate CommandTest -OutPath "$path\tests\functions" -Name $commandName -Force
}

Get-ChildItem -Path "$path\tests\functions" -Recurse -File | Set-PSMDEncoding