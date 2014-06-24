#Remotely change hostname.

$OldHost = Read-Host "Current Hostname:"
$NewHost = Read-Host "New Hostname:"

$credential = Get-Credential

Get-WmiObject Win32_ComputerSystem -ComputerName $OldHost -Authentication 6 |

ForEach-Object {$_.Rename($NewHost,$credential.GetNetworkCredential().Password,$credential.Username)}
