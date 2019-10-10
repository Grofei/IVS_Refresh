#Requires –Modules ActiveDirectory
#.Requires –Modules MySqlCmdlets
#.Requires MySQL Connector https://dev.mysql.com/downloads/file/?id=485753

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

[String] $Searchbase_PC = "OU=Hochbau,OU=Computer W10,OU=StBA-ROSENHEIM,OU=STAATSBAUVERWALTUNG,DC=stmi,DC=bayern,DC=de"

$computers = Get-ADComputer -Filter * -Properties description,name -Searchbase $Searchbase_PC | Select-Object description, name

try{New-DBCommand -Connection $Connection -Command "Delete from t_user_computer"}catch{Write-Warning "Problem bei Bereinigung von t_user_computer"}

#evtl. erst alle Verknüpungen löschen dann neu anlegen?
foreach($computer in $computers)
{ 
    $Username = $computer.Description
    $PCHost =  $computer.name

    $UID = (New-DBCommand -Connection $Connection -Command "Select UID from t_user where Concat(Surname,' ',GivenName) like '%$Username%'" -ErrorVariable eu -ErrorAction SilentlyContinue).UID
    $CID = (New-DBCommand -Connection $Connection -Command "Select CID from t_computer where Hostname = '$PCHost'" -ErrorVariable ec -ErrorAction SilentlyContinue).CID

    If(($eu[0] -eq $null) -and ($ec[0] -eq $null)){
    New-DBInsert -Connection $Connection -Insert "Insert into t_user_computer (UID,CID) Values ('$UID','$CID')"
    }
    Clear-Variable UID,CID,ec,eu 

} 

#Ausgabe der Eingefügten Werte
New-DBCommand -Connection $Connection -Command "Select * from v_user_computer" | Format-Table
try {
  $Connection.Close | Out-Null
}
catch {
  Write-Host "ERROR : Unable to stop DB-Connetion: $DBName on $DBH`n$Error[0]"
}

