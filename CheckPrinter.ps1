#Displays printer information related to chosen hostname.

If ($args -eq "-q"+$compname)

{
$compname = Read-Host "Hostname:"
Get-WMIObject -computer $compname Win32_PerfFormattedData_Spooler_PrintQueue |
 Select Name, @{Expression={$_.jobs};Label="CurrentJobs"}, TotalPagesPrinted, JobErrors         


Exit

}


else

{

$compname = Read-Host "Hostname:"


gwmi -computer $compname Win32_Printer | Select-Object DeviceID,DriverName, PortName | Format-List 


}   

