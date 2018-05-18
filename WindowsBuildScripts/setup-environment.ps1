If(!(Test-Path -Path "$env:ProgramData\Chocolatey")){
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

$currentDir = Get-Location
$jsonFilePath = "$($currentDir)\aurea-central-jervis\WindowsBuildScripts\toolsconfigs.json"
$configJson = (Get-Content $jsonFilePath) | ConvertFrom-Json

choco install saxonhe -y
exit 0