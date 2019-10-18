<#
    Links:
    Get-NetAdapter: https://devblogs.microsoft.com/scripting/using-powershell-to-find-connected-network-adapters/
    https://www.msxfaq.de/code/powershell/pscsv.htm

    #$ServiceBranch = (([wmiclass]"\\$($env:COMPUTERNAME)$DBUserdefault:stdRegProv").GetStringValue(2147483650, 'SOFTWARE\Microsoft\Windows NT\CurrentVersion', 'ReleaseID')).svalue
    #Einlesen USB Verlauf:
     #$USB = Import-Csv -Path C:\temp\USB_SticksVerlauf.csv -Header "Beschreibung","Hostname","Dateisystem", "Speicherplatz","Seriennummer","Ausgelesen_am" -Delimiter "," -Encoding utf8 | ft
    
    #Notizen
    #Size Partition C und D wenn nicht vorhanden Value = 0
    #SNMP Abfrage Router,
                  Switched Hub,
                  USV,
                  Netzteil,
                  Server
#>
#Requires –Modules ActiveDirectory
#Requires –Modules SNMP
#.Requires –Modules MySqlCmdlets
#.Requires MySQL Connector https://dev.mysql.com/downloads/file/?id=485753

# Scriptpfad ermitteln
$scriptPath = if($psise) {Split-Path $psise.CurrentFile.FullPath} else {$global:PSScriptRoot}
# Funktionen Einbinden
. "$scriptPath\_Funktionen_Database.ps1"

#Verbindung zu DB aufbauen
$MySQLAdminUserName = "root"
$MySQLAdminPassword = ""
$MySQLDatabase = "Inventar"
$MySQLHost = "localhost"
$port = "3306"
$ConnectionString = "server=" + $MySQLHost + ";port=$port;uid=" + $MySQLAdminUserName + ";pwd=" + $MySQLAdminPassword + ";database="+$MySQLDatabase

Try {
  [void][System.Reflection.Assembly]::LoadWithPartialName("MySql.Data")
  $Connection = New-Object MySql.Data.MySqlClient.MySqlConnection
  $Connection.ConnectionString = $ConnectionString
  $Connection.Open()
  }
Catch {
  Write-Host "ERROR : Unable to start DB-Connetion: $MySQLDatabase on $MySQLHost`n$Error[0]"
 }

#Drucker Hostnamen
[Array] $ToshibaHosts = @("bro-dr-w103etg","bro-dr-w214etg","bro-dr-w314etg")
[Array] $LexmarkHosts = @("bro-dr-w001mfp","bro-dr-w110mfp","bro-dr-w118","bro-dr-w212mfp","bro-dr-w311mfp","bro-dr-w404mfp","bro-dr-w407mfp")
[Array] $CanonHosts = @("bro-dr-w006c","bro-dr-w409etg")
[array] $HPHosts = @("bro-dr-w006plt", "bro-dr-w314plt")

[String] $ErrorActionPreference  = "Stop"
[bool] $RefreshNotebook = $false
[bool] $RefreshMonitor = $false
[bool] $RefreshPC = $false
[String] $Searchbase_PC = "OU=Hochbau,OU=Computer W10,OU=StBA-Rosenheim, OU=STAATSBAUVERWALTUNG ,DC=stmi ,DC=bayern, DC=de"
[String] $Searchbase_NB = "OU=Notebook W10,OU=StBA-Rosenheim, OU=STAATSBAUVERWALTUNG ,DC=stmi ,DC=bayern, DC=de"

$PC_NB_Hostname = (Get-ADComputer -Filter * -SearchBase $Searchbase_PC | Select-Object Name) + (Get-ADComputer -Filter {(Name -like "*-W*")} -SearchBase $Searchbase_NB | Select-Object Name)
$date = (Get-Date).ToString("yyyy-MM-dd")

#Computer einfügen
foreach($rpc in $PC_NB_Hostname)
{
    [String] $remote_computer = $rpc.Name

    If(Test-Connection $remote_computer -Quiet -Count 1)
    { 
        $so = New-CimSessionOption -Protocol Wsman
        $session =  New-CimSession -ComputerName $remote_computer -SessionOption $so -ErrorAction SilentlyContinue -ErrorVariable e

     If($e[0] -eq $null) #Nötig wegen Workstations mit zwei NIC auf eine geht immer Ping Session, aber wenn pc aus fliegt exeption
     {
        Write-Host "Verbunden mit $remote_computer"
        try{$MAC = Get-NetAdapter -Physical -CimSession $session}catch{Write-Host -ForegroundColor Red "[Fehler] Auslesen der NIC von $remote_computer"}
        try{$computer = Get-CimInstance -Class CIM_ComputerSystem -ComputerName $remote_computer -Property *}catch{Write-Host -ForegroundColor Red "[Fehler] Auslesen von CIM_ComputerSystem am $remote_computer"}
        try{$os = Get-CimInstance -Class CIM_OperatingSystem -ComputerName $remote_computer -Property *}catch{Write-Host -ForegroundColor Red "[Fehler] Auslesen von CIM_OperatingSystem am $remote_computer"}
        try{$BIOS = Get-CimInstance -Class CIM_BIOSElement -ComputerName $remote_computer -Property *}catch{Write-Host -ForegroundColor Red "[Fehler] Auslesen von CIM_BIOSElement am $remote_computer"}
        try{$cpu = Get-CimInstance -ClassName Win32_Processor -ComputerName $remote_computer -Property *}catch{Write-Host -ForegroundColor Red "[Fehler] Auslesen von Win32_Processor am $remote_computer"}
        try{$gpu = Get-Wmiobject Win32_VideoController -ComputerName $remote_computer -Property *}catch{Write-Host -ForegroundColor Red "[Fehler] Auslesen von Win32_VideoController am $remote_computer"}
        try{$Disk = Get-CimInstance CIM_LogicalDisk -CimSession $session -Property *}catch{Write-Host -ForegroundColor Red "[Fehler] Auslesen von CIM_LogicalDisk am $remote_computer"}
        try{$DiskPhysical = Get-Disk -CimSession $session}catch{Write-Host -ForegroundColor Red "[Fehler] Auslesen von Get-Disk am $remote_computer"}

            if($remote_computer -like "*PC*")
            {

                    #Monitor
                    $Error_Monitor = $false
                    $Seriennummer1 = ""
                    $Seriennummer2 = ""
                    $Hersteller1 = ""
                    $Hersteller2 = ""
                    $Produktname1 = ""
                    $Produktname2 = ""

                    try{$Monitor = Get-WmiObject WmiMonitorId -ComputerName $remote_computer -Namespace root\wmi -Property *}catch{$Error_Monitor = $true}
                        If($Error_Monitor -ne $true){
                            #Verarbeitung Seriennummern 
                                $counter = 0
                                $vorgänger = ""
                                ForEach($i in $Monitor.SerialNumberID){
                                    If($i -ne 0){
                                        if($counter -eq 0){
                                        $Seriennummer1 = $Seriennummer1,[char] $i -join "" 
                                        $vorgänger = $i
                                        }
                                        elseIf($counter -eq 1){
                                        $Seriennummer2 = $Seriennummer2,[char] $i -join ""
                                        $vorgänger = $i
                                        }
                                    }
                                    elseIf(($i -eq 0) -and($vorgänger -ne 0))
                                        {$counter++;$vorgänger = $i} 
                                } 

                             #Verarbeitung Produktname
                                $counter = 0
                                $vorgänger = ""
                                ForEach($i in $Monitor.UserFriendlyName){
                                    If($i -ne 0){
                                        if($counter -eq 0){
                                        $Produktname1 = $Produktname1,[char] $i -join "" 
                                        $vorgänger = $i
                                        }
                                        elseIf($counter -eq 1){
                                        $Produktname2 = $Produktname2,[char] $i -join ""
                                        $vorgänger = $i
                                        }
                                    }
                                    elseIf(($i -eq 0) -and($vorgänger -ne 0))
                                        {$counter++;$vorgänger = $i} 
                                } 

                             #Verarbeitung Hersteller
                                $counter = 0
                                $vorgänger = ""
                                ForEach($i in $Monitor.ManufacturerName){
                                    If($i -ne 0){
                                        if($counter -eq 0){
                                        $Hersteller1 = $Hersteller1,[char] $i -join ""
                                        $vorgänger = $i
                                        }
                                        elseIf($counter -eq 1){
                                        $Hersteller2 = $Hersteller2,[char] $i -join ""
                                        $vorgänger = $i
                                        }
                                    }
                                    elseIf(($i -eq 0) -and($vorgänger -ne 0))
                                        {$counter++;$vorgänger = $i} 
                                } 
                                    $YearOManufacture1 = @($Monitor.YearOfManufacture)[0]
                                    $YearOManufacture2 = @($Monitor.YearOfManufacture)[1]

                                    $PSComputerName = @($Monitor.PSComputerName)[0]
                            }    
                            If({$mac -ne $null} -and {$BIOS -ne $null} -and {$computer -ne $null} -and {$os -ne $null} -and {$cpu -ne $null} -and {$gpu -ne $null} -and {$Disk -ne $null})
                            {
                                    $Hostname = $remote_computer
                                    $Model = $computer.Model
                                    $SN = $bios.SerialNumber
                                    $OSVersion = $os.Caption
                                    $InstallDate = $os.InstallDate.ToString("yyyy-MM-dd")
                                    [string] $RAM = ([math]::round((($computer.TotalPhysicalMemory) / 1GB), 2)).ToString().Replace(",",".")
                                    $MAC = ($MAC | Where-Object Name -Like "Ethernet").MacAddress
                                    $CPU_Name = $cpu.Name
                                    $GPU_Name = $gpu.Name
                                    $DiskCounter = ($DiskPhysical | Where-object OperationalStatus -eq "Online" | Measure-Object).Count
                                    [String] $Storage = ([math]::round((((($disk | Where-Object DriveType -eq 3 | Select-Object Size).Size | Measure-Object -Sum).Sum) / 1GB), 2).ToString().Replace(",","."))
                                    
                                    $sticks = $Disk | Where-Object {($_.DriveType -eq 2) -and ($_.Size -ne $null)} | Select-Object Description,PSComputerName,FileSystem,Size,VolumeSerialNumber
                                    $sticks | Add-Member -MemberType NoteProperty -Name 'Date' -Value "$date"
                                    If($sticks -ne $null){$sticks | Export-Csv "C:\temp\USB_SticksVerlauf.csv" -Delimiter ";" -NoTypeInformation -Append -Encoding UTF8}

                                    $ResultQueryPC = New-DBCommand -Connection $Connection -Command "Select * from t_computer Where MAC = '$MAC'"
                                    If($ResultQueryPC -eq $null){
                                    New-DBInsert -Connection $Connection -Insert "Insert into t_computer (Hostname,Model,SN,OS,InstallDate,RAM,MAC,CPU,GPU,Storage,DiskCount,LastConnect) Values ('$Hostname','$Model','$SN','$OSVersion', '$InstallDate','$RAM','$MAC', '$CPU_Name','$GPU_Name','$Storage','$DiskCounter','$date')"
                                    [Array] $NewHostsPC+=$Hostname
                                    }
                                    else{ #Neu
                                        New-DBCommand -Connection $Connection -Command "Update t_computer Set Hostname = '$Hostname',Model='$Model',SN='$SN',OS='$OSVersion',InstallDate='$InstallDate',RAM='$RAM',CPU='$CPU_Name',GPU='$GPU_Name',Storage='$Storage',DiskCount='$DiskCounter',LastConnect='$date' Where MAC = '$MAC'"
                                    } #Neu
                            }
                            else {
                                Write-Warning Probleme bei der Datenauswertung am $remote_computer
                            }

                If($Error_Monitor -ne $true)
                {
                    If(($Produktname1 -ne $null) -and ($Hersteller1 -ne $null) -and ($Seriennummer1 -ne $null) -and ($YearOManufacture1 -ne $null)){
                        $ResultQueryMonitor = (New-DBCommand -Connection $Connection -Command "Select MID from t_monitor Where SN = '$Seriennummer1'").MID
                            If($ResultQueryMonitor -eq $null){
                                $ResultCID = (New-DBCommand -Connection $Connection -Command "Select CID from t_computer Where Hostname = '$PSComputerName'").CID    
                                New-DBInsert -Connection $Connection -Insert "Insert into t_monitor (Model,Manufacturer,SN,YoM,CID,LastConnect) Values ('$Produktname1','$Hersteller1','$Seriennummer1','$YearOManufacture1','$ResultCID','$date')"
                                $ResultNewMonitor = (New-DBCommand -Connection $Connection -Command "Select * from t_monitor where SN= '$Seriennummer1'")
                                [Array] $NewMonitor +=  $ResultNewMonitor
                                If($ResultNewMonitor -ne $null){Clear-Variable ResultNewMonitor}
                            }
                            else {
                                $ResultCIDMonitor = (New-DBCommand -Connection $Connection -Command "Select CID from t_Monitor Where SN = '$Seriennummer1'").CID
                                $ResultHost = New-DBCommand -Connection $Connection -Command "Select Hostname,CID from t_Computer Where CID = '$ResultCIDMonitor'"
                                If($ResultHost.Hostname -ne $PSComputerName){
                                    $CIDUpdate = $ResultHost.CID
                                    New-DBCommand -Connection $Connection -Command "Update t_monitor set CID='$CIDUpdate', LastConnect='$date' Where SN='$Seriennummer1'"
                                    Clear-Variable CIDUpdate
                                }
                                Clear-Variable ResultQueryMonitor,ResultCIDMonitor
                            }

                    Clear-Variable Produktname1,Hersteller1,Seriennummer1,YearOManufacture1
                    }
                    If(($Produktname2 -ne $null) -and ($Hersteller2 -ne $null) -and ($Seriennummer2 -ne $null) -and ($YearOManufacture2 -ne $null)){
                        $ResultQueryMonitor = (New-DBCommand -Connection $Connection -Command "Select MID from t_monitor Where SN = '$Seriennummer2'").MID
                            If($ResultQueryMonitor -eq $null){
                                $ResultCID = (New-DBCommand -Connection $Connection -Command "Select CID from t_computer Where Hostname = '$PSComputerName'").CID
                                New-DBInsert -Connection $Connection -Insert "Insert into t_monitor (Model,Manufacturer,SN,YoM,CID,LastConnect) Values ('$Produktname2','$Hersteller2','$Seriennummer2','$YearOManufacture2','$ResultCID','$date')"
                                $ResultNewMonitor = (New-DBCommand -Connection $Connection -Command "Select * from t_monitor where SN= '$Seriennummer2'")
                                [Array] $NewMonitor +=  $ResultNewMonitor
                                If($ResultNewMonitor -ne $null){Clear-Variable ResultNewMonitor}
                            }
                            else {
                                $ResultCIDMonitor = (New-DBCommand -Connection $Connection -Command "Select CID from t_Monitor Where SN = '$Seriennummer2'").CID
                                $ResultHost = New-DBCommand -Connection $Connection -Command "Select Hostname,CID from t_Computer Where CID = '$ResultCIDMonitor'"
                                    If($ResultHost.Hostname -ne $PSComputerName){
                                        $CIDUpdate = $ResultHost.CID
                                        New-DBCommand -Connection $Connection -Command "Update t_monitor set CID='$CIDUpdate', LastConnect='$date' Where SN='$Seriennummer2'"
                                        Clear-Variable CIDUpdate
                                    }
                                    Clear-Variable ResultQueryMonitor,ResultCIDMonitor                            
                                }
                        Clear-Variable Produktname2,Hersteller2,Seriennummer2,YearOManufacture2
                    }
                }else{Write-Warning "Problem bei Monitorabfrage am $remote_computer"}
            }
            elseif($remote_computer -like "*NB*")
                {
                    If({$mac -ne $null} -and {$BIOS -ne $null} -and {$computer -ne $null} -and {$os -ne $null} -and {$cpu -ne $null} -and {$gpu -ne $null} -and {$Disk -ne $nul})
                    {
                        #NotebookInfo
                        $Hostname = $remote_computer
                        $Model = $computer.Model
                        $SN = $bios.SerialNumber
                        $OSVersion = $os.Caption
                        $InstallDate = $os.InstallDate.ToString("yyyy-MM-dd")
                        [string] $RAM = ([math]::round((($computer.TotalPhysicalMemory) / 1GB), 2)).ToString().Replace(",",".")
                        $MAC_Ethernet = ($MAC | Where-Object Name -Like "Ethernet").MacAddress
                        $MAC_Wifi = ($MAC | Where-Object {$_.Name -like "WLAN" -or $_.Name -like "Wi-Fi"}).MacAddress
                        $CPU_Name = $cpu.Name
                        $GPU_Name = $gpu.Name
                        $DiskCounter = ($DiskPhysical | Where-object OperationalStatus -eq "Online" | Measure-Object).Count
                        [String] $Storage = ([math]::round((((($disk | Where-Object DriveType -eq 3 | Select-Object Size).Size | Measure-Object -Sum).Sum) / 1GB), 2).ToString().Replace(",","."))
                        $DisplayWidth = ($gpu | Where-Object VideoModeDescription -ne $null | Select-Object CurrentHorizontalResolution).CurrentHorizontalResolution
                        $DisplayHeight = ($gpu | Where-Object VideoModeDescription -ne $null | Select-Object CurrentVerticalResolution).CurrentVerticalResolution
                    
                        $ResultQueryPC = New-DBCommand -Connection $Connection -Command "Select * from t_notebook Where MAC_Ethernet = '$MAC_Ethernet' and MAC_Wifi = '$MAC_Wifi'"
                        If($ResultQueryPC -eq $null){
                        New-DBInsert -Connection $Connection -Insert "Insert into t_notebook (Hostname,Model,SN,OS,InstallDate,RAM,MAC_Ethernet,MAC_Wifi,CPU,GPU,Storage,DiskCount,DisplayResolutionHeight,DisplayResolutionWidth,LastConnect) Values ('$Hostname','$Model','$SN','$OSVersion', '$InstallDate','$RAM','$MAC_Ethernet','$MAC_Wifi', '$CPU_Name','$GPU_Name','$Storage','$DiskCounter','$DisplayHeight','$DisplayWidth','$date')"
                        [Array] $NewHostsNB+=$Hostname
                        }
                        else{
                                New-DBCommand -Connection $Connection -Command "Update t_notebook Set Hostname = '$Hostname',Model='$Model',SN='$SN',OS='$OSVersion',InstallDate='$InstallDate',RAM='$RAM',CPU='$CPU_Name',GPU='$GPU_Name',Storage='$Storage',DiskCount='$DiskCounter',DisplayResolutionHeight ='$DisplayHeight',DisplayResolutionWidth= '$DisplayWidth',LastConnect='$date' Where MAC_Ethernet = '$MAC_Ethernet' and MAC_Wifi = '$MAC_Wifi'"
                            }
                        }

                }
            else{Write-Host "Der Name enthält kein PC oder NB."}
               Remove-CimSession -CimSession $session
            }
            else {
                 Write-Host "[Fehler] CIMSession $remote_computer" 
                 Clear-Variable e
            }
    }
    else{Write-Host $remote_computer ist nicht erreichbar.}    
}


#Drucker einfügen
foreach($DrH in $ToshibaHosts)
{   
    If(Test-Connection $DrH -Quiet -Count 1)
    {
        $ResultDNSQuery = Resolve-DnsName $DrH -ErrorAction SilentlyContinue
        If($ResultDNSQuery)
        {
                $IPDR = $ResultDNSQuery.IP4Address
                $HostnameDr = $DrH
                $SnDr = (Get-SnmpData -IP $IPDR -OID .1.3.6.1.2.1.43.5.1.1.17.1).Data
                $PrintedPages = (Get-SnmpData -IP $IPDR -OID .1.3.6.1.2.1.43.10.2.1.4.1.1).Data
                $HerstellerDr = (Get-SnmpData -IP $IPDR -OID .1.3.6.1.2.1.43.8.2.1.14.1.1).Data
                $Office = $DrH.Substring(8,3)
                $Typ = $DrH.Substring(11,1)
                If($Typ -eq "e"){$Typ="Etagendrucker"}#etg
                elseif ($Typ -eq "p"){$Typ="Plotter"}#plt
                elseif($Typ -eq "m"){$Typ="Vorzimmerdrucker"}#mfp
                elseif($Typ -eq "c"){$Typ="Reservedrucker"}#c
                elseif($Typ -eq $null){$Typ="Abteilungsdrucker"}#für bro-dr-w118 //Abt. T

                $ResultTDr = New-DBCommand -Connection $Connection -Command "Select PID from t_Printer Where SN='$SnDr'"
                If(!$ResultTDr)
                {  
                    New-DBInsert -Connection $Connection -Insert "Insert into t_Printer (Hostname,Manufacturer,SN,Office,Type,PrintedPages,LastConnect) Values ('$HostnameDr','$HerstellerDr','$SnDr','$Office','$Typ','$PrintedPages','$date')"
                }
                else 
                {   
                    New-DBCommand -Connection $Connection -Command "Update t_printer Set Hostname='$HostnameDr',Office='$Office',PrintedPages='$PrintedPages',Type='$Typ', LastConnect='$date' Where SN='$SnDr'"
                }
                Clear-Variable Typ
        }
    }
    else {
        Write-Host $DrH ist nicht erreichbar.
    }
}

Clear-Variable DrH

foreach($DrH in $LexmarkHosts)
{
    If(Test-Connection $DrH -Quiet -Count 1)
    { 
        $ResultDNSQuery = Resolve-DnsName $DrH -ErrorAction SilentlyContinue
        If($ResultDNSQuery)
        {
                $IPDR = $ResultDNSQuery.IP4Address
                $HostnameDr = $DrH
                $SnDr = (Get-SnmpData -IP $IPDR -OID .1.3.6.1.2.1.43.5.1.1.17.1).Data
                $PrintedPages = (Get-SnmpData -IP $IPDR -OID .1.3.6.1.2.1.43.10.2.1.4.1.1).Data
                $HerstellerDr = (Get-SnmpData -IP $IPDR -OID .1.3.6.1.2.1.43.8.2.1.14.1.1).Data
                $Office = $DrH.Substring(8,3)
                try{$Typ = $DrH.Substring(11,1)}catch{$Typ = $null}
                If($Typ -eq "e"){$Typ="Etagendrucker"}#etg
                elseif ($Typ -eq "p"){$Typ="Plotter"}#plt
                elseif($Typ -eq "m"){$Typ="Vorzimmerdrucker"}#mfp
                elseif($Typ -eq "c"){$Typ="Reservedrucker"}#c
                elseif ($Typ -eq $null) {$Typ = "Abteilungsdrucker"}

                $ResultTDr = New-DBCommand -Connection $Connection -Command "Select PID from t_Printer Where SN='$SnDr'"
                If(!$ResultTDr)
                {  
                    New-DBInsert -Connection $Connection -Insert "Insert into t_Printer (Hostname,Manufacturer,SN,Office,Type,PrintedPages,LastConnect) Values ('$HostnameDr','$HerstellerDr','$SnDr','$Office','$Typ','$PrintedPages','$date')"
                }
                else
                {
                    New-DBCommand -Connection $Connection -Command "Update t_Printer Set Hostname='$HostnameDr',Office='$Office',PrintedPages='$PrintedPages',Type='$Typ',LastConnect='$date' Where SN='$SnDr'"
                }
        }
    }
}


try {
    $Connection.Close | Out-Null
  }
  catch {
    Write-Host "ERROR : Unable to stop DB-Connetion: $DBName on $DBH`n$Error[0]"
  }
  

  If($NewHostsPC -eq $null)
{
  Write-Host "Keine neuen PCs gefunden."
}
else {
  Write-Host "Diese(r) PC(s) wurde neu hinzugefügt:"
  Write-Host "---------------------------------------------"
  Write-Host $NewHostsPC
}

If($NewHostsPC -ne $null){Clear-Variable NewHostsPC}


If($NewHostsNB -eq $null)
{
  Write-Host "Keine neuen NBs gefunden."
}
else {
  Write-Host "Diese(s) Notebook(s) wurde neu hinzugefügt:"
  Write-Host "---------------------------------------------"
  Write-Host $NewHostsNB
}

If($NewHostsNB -ne $null){Clear-Variable NewHostsNB}


#Ausgabe der Eingefügten Werte
$x = Read-Host "Sollen die Tabelleninhalte angezeigt werden? (j)a (n)ein" 

If($x -eq "j"){
    New-DBCommand -Connection $Connection -Command "Select * from t_computer" | Format-Table -AutoSize
    New-DBCommand -Connection $Connection -Command "Select * from t_Monitor" | Format-Table -AutoSize
    New-DBCommand -Connection $Connection -Command "Select * from t_Notebook" | Format-Table -AutoSize
    New-DBCommand -Connection $Connection -Command "Select * from t_Printer" | Format-Table -AutoSize
}


