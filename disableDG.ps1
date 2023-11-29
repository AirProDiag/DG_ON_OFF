# PowerShell script to disable a driver

# Start PowerShell with Admin rights
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!" -ForegroundColor Red
    exit
}


# Define the name of the driver you want to disable
$driverName = "VSI-NxGen USB VCom Port*"


$driver = Get-PnpDevice | Where-Object { $_.FriendlyName -like $driverName }


Disable-PnpDevice -InstanceId $driver.InstanceId -Confirm:$false


