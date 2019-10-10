#Host+Seriennummer //erledigt
#IP und MAC Adresse, Netzadapter //erledigt                       
#CPU (Typ, Hersteller) //erledigt
#Arbeitsspeicher //erledigt
#Laufwerke, Festplatten (Größe, Partitionierung) //did it
#GPU // erledigt
#InstallDate OS //did it
#OS genaue Version // did it
#Monitore (Typ, Hersteller) //erledigt
#Bisher angemeldete Benutzer am PC //erledigt
#Domäne falls vorhanden //erledigt
#Geräteart (Laptop, Tablet, PC,...) //keine Ahnung
#Installierte Software //erledigt
#
#-> Pfad frei wählbar //erledigt

$a = Read-Host "Inventarisierung (l)okal oder (n)etzwerk"
If($a -eq "l"){
    $HostComputer = $env:COMPUTERNAME
    [String] $ErrorConnection = ""
}
elseIf($a = "n"){
$HostComputer = Read-Host 'Hostname eingeben'

      If(Test-Connection $HostComputer -Quiet -Count 1){
            If($e[0] -eq $null){[String] $ErrorConnection = ""}
            else{[String] $ErrorConnection = $true} 
       }
       else{[String] $ErrorConnection = $true} 

}

Start-Sleep 2

If(!$ErrorConnection){
$so = New-CimSessionOption -Protocol Wsman
$session =  New-CimSession -ComputerName $HostComputer -SessionOption $so -ErrorAction SilentlyContinue -ErrorVariable e

try{$MAC = Get-NetAdapter -Physical -CimSession $session}catch{Write-Host -ForegroundColor Red "[Fehler] Auslesen der NIC von $HostComputer"}
try{$computer = Get-CimInstance -Class CIM_ComputerSystem -ComputerName $HostComputer}catch{Write-Host -ForegroundColor Red "[Fehler] Auslesen von CIM_ComputerSystem am $HostComputer"}
try{$os = Get-CimInstance -Class CIM_OperatingSystem -ComputerName $HostComputer}catch{Write-Host -ForegroundColor Red "[Fehler] Auslesen von CIM_OperatingSystem am $HostComputer"}
try{$BIOS = Get-CimInstance -Class CIM_BIOSElement -ComputerName $HostComputer}catch{Write-Host -ForegroundColor Red "[Fehler] Auslesen von CIM_BIOSElement am $HostComputer"}
try{$cpu = Get-CimInstance -ClassName Win32_Processor -ComputerName $HostComputer}catch{Write-Host -ForegroundColor Red "[Fehler] Auslesen von Win32_Processor am $HostComputer"}
try{$gpu = Get-CimInstance Win32_VideoController -ComputerName $HostComputer}catch{Write-Host -ForegroundColor Red "[Fehler] Auslesen von Win32_VideoController am $HostComputer"}
try{$Disk = Get-Disk -CimSession $session}catch{Write-Host -ForegroundColor Red "[Fehler] Auslesen von Get-Disk am $HostComputer"}
try{$Partition = Get-Partition -CimSession $session}catch{Write-Host -ForegroundColor Red "[Fehler] Auslesen von Get-Partition am $HostComputer"}

#-----------------------------------------------------------------------------------------------------------------------
#PCInfos
$Model = $computer.Model
$SN = $bios.SerialNumber
$OSVersion = $os.Caption
$ReleaseID = Invoke-command -computer $HostComputer {(Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\" -Name ReleaseID).ReleaseId}
$CurrentBuild = Invoke-command -computer $HostComputer {(Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\" -Name CurrentBuild).CurrentBuild}
$InstallDate = $os.InstallDate.ToString("yyyy-MM-dd")
$RAM = [math]::round((($computer.TotalPhysicalMemory) / 1GB), 2)
$CPU_Manufacturer = $cpu.Manufacturer
$CPU = $cpu.Name
$GPU = $gpu.Name
$DiskCounter = ($disk | Where-object OperationalStatus -eq "Online" | Measure-Object).Count
$Storage = [math]::round(((($disk.Size | Measure-Object -Sum).Sum) / 1GB), 2)
$NetAdapter = $MAC | Select-Object Name,InterfaceDescription, MacAddress  
$IP = (Resolve-DnsName $env:computername).ipaddress
$domain = ($computer).Domain
$Partition = $Partition | Select-Object DriveLetter, Size, Type
$UserLoggedIn = Get-childItem \\$HostComputer\c$\Users | Select Name).Name

#-----------------------------------------------------------------------------------------------------------------------
#Monitor(e)

#Monitor
                    $Error_Monitor = $false
                    $Seriennummer1 = ""
                    $Seriennummer2 = ""
                    $Hersteller1 = ""
                    $Hersteller2 = ""
                    $Produktname1 = ""
                    $Produktname2 = ""
                    try{$Monitor = Get-WmiObject WmiMonitorId -ComputerName $HostComputer -Namespace root\wmi}catch{$Error_Monitor = $true}
                        If($Error_Monitor -ne $true){
                            #Verarbeitung Seriennummern 
                                $counter = 0
                                $vorgaenger = ""
                                ForEach($i in $Monitor.SerialNumberID){
                                    If($i -ne 0){
                                        if($counter -eq 0){
                                        $Seriennummer1 = $Seriennummer1,[char] $i -join "" 
                                        $vorgaenger = $i
                                        }
                                        elseIf($counter -eq 1){
                                        $Seriennummer2 = $Seriennummer2,[char] $i -join ""
                                        $vorgaenger = $i
                                        }
                                    }
                                    elseIf(($i -eq 0) -and($vorgaenger -ne 0))
                                        {$counter++;$vorgaenger = $i} 
                                } 

                            #Verarbeitung Produktname
                                $counter = 0
                                $vorgaenger = ""
                                ForEach($i in $Monitor.UserFriendlyName){
                                    If($i -ne 0){
                                        if($counter -eq 0){
                                        $Produktname1 = $Produktname1,[char] $i -join "" 
                                        $vorgaenger = $i
                                        }
                                        elseIf($counter -eq 1){
                                        $Produktname2 = $Produktname2,[char] $i -join ""
                                        $vorgaenger = $i
                                        }
                                    }
                                    elseIf(($i -eq 0) -and($vorgaenger -ne 0))
                                        {$counter++;$vorgaenger = $i} 
                                } 

                            #Verarbeitung Hersteller
                                $counter = 0
                                $vorgaenger = ""
                                ForEach($i in $Monitor.ManufacturerName){
                                    If($i -ne 0){
                                        if($counter -eq 0){
                                        $Hersteller1 = $Hersteller1,[char] $i -join ""
                                        $vorgaenger = $i
                                        }
                                        elseIf($counter -eq 1){
                                        $Hersteller2 = $Hersteller2,[char] $i -join ""
                                        $vorgaenger = $i
                                        }
                                    }
                                    elseIf(($i -eq 0) -and($vorgaenger -ne 0))
                                        {$counter++;$vorgaenger = $i} 
                                } 
                                    $YearOManufacture1 = @($Monitor.YearOfManufacture)[0]
                                    $YearOManufacture2 = @($Monitor.YearOfManufacture)[1]

                                    $PSComputerName = @($Monitor.PSComputerName)[0]
                             }

$MonitorCounter = $Monitor.Count

#-----------------------------------------------------------------------------------------------------------------------
#Software
If(!$ErrorConnection){
try{$Software = Invoke-command -computer $HostComputer {Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*| Sort Displayname | Select-Object DisplayName, DisplayVersion, InstallDate, Publisher | Format-Table}}
catch{Write-Host Fehler Softwareinventarierung}
}

#-----------------------------------------------------------------------------------------------------------------------
#Ausgabe:

Write-Host -ForegroundColor Magenta "PC Info:"

$PCInfo = [PSCustomObject] @{
Host = $HostComputer
Model = $Model
SN = $SN
RAM = $RAM
Manufacturer_CPU = $CPU_Manufacturer
CPU = $CPU
GPU = $GPU
DiskCount = $DiskCounter
Storage = $Storage
Partitionen = $Partition

NetAdapter = $NetAdapter
IP = $IP
Domain = $domain

Version = $OSVersion
ReleaseID = $ReleaseID
Build = $CurrentBuild
InstallDate = $InstallDate
Users = $UserLoggedIn
}

If($MonitorCounter -eq 1)
{

    $MonitorInfo  = [PSCustomObject] @{
    Bezeichnung = $Produktname1
    Hersteller = $Hersteller1
    SN = $Seriennummer1
    YoM = $YearOManufacture1
    }
}
elseIf($MonitorCounter -eq 2)
{
    $MonitorInfo  = [PSCustomObject] @{
    Bezeichnung_M1 = $Produktname1
    Hersteller_M1 = $Hersteller1
    SN_M1 = $Seriennummer1
    YoM_1 = $YearOManufacture1

    Bezeichnung_M2 = $Produktname1
    Hersteller_M2 = $Hersteller1
    SN_M2 = $Seriennummer1
    YoM_2 = $YearOManufacture1
    }
}

$session.Close()

$PCInfo
$MonitorInfo
$Software


#-----------------------------------------------------------------------------------------------------------------------

$y = Read-Host "Soll Ergebnis gespeichert werden? (j)a (n)ein"
If($y -eq "j"){
    $pfad = Read-Host "Pfad + Dateinamen + Datei (C:\temp\)"
    $datei = Read-Host "Dateinamen + Datei (Inventarierung.txt)"
    If($pfad -and $datei){
        If(Test-Path -Path $pfad){
            $PCInfo | Out-File $($pfad+$datei) -Encoding utf8
            $MonitorInfo | Out-File $($pfad+$datei) -Encoding utf8 -Append
            $Software | Out-File $($pfad+$datei) -Encoding utf8 -Append
        }
        else{Write-Warning "Pfad ungueltig"}
         
    }
    else{Write-Warning "Pfad- und/oder Dateinameneingabe = NULL"}
}


}
else{Write-Warning "Es ist ein Fehler aufgetreten."}