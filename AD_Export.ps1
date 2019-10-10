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


[String] $Searchbase_User = "OU=Hochbau,OU=Benutzer W10,OU=StBA-Rosenheim, OU=STAATSBAUVERWALTUNG ,DC=stmi ,DC=bayern, DC=de"
$date = (Get-Date).ToString("yyyy-MM-dd")
$users = Get-ADUser -Filter * -Properties office, StreetAddress, SamAccountName,OfficePhone,MobilePhone,GivenName,Surname,department,Sid -Searchbase $Searchbase_User | Select-Object office, StreetAddress, SamAccountName,OfficePhone,MobilePhone,GivenName,Surname,department,Sid
$User_Backup = New-DBCommand -Connection $Connection -Command "Select * from t_user"

    Start-Sleep 3

    foreach($user in $users)
    {
        $GivenName = $user.GivenName #Vorname
        $Surname = $user.Surname #Nachname
        $Office = ($user.office).Substring(4,3) #Büronummer
        $AccountName = $user.SamAccountName
        [String] $TelephoneNr = $user.OfficePhone
        [String] $MobilphoneNr = $user.MobilePhone
        $Department = $user.department
        $DepartmentNr = (New-DBCommand -Connection $Connection -Command "Select DID from t_department where Description = '$department'").DID
        $Sector = $user.StreetAddress
        $SectorNr = (New-DBCommand -Connection $Connection -Command "Select SID from t_sector where StreetAddress = '$Sector'").SID
        $ObjectSID = ($user.Sid).Value

        $AccountResult = (New-DBCommand -Connection $Connection -Command "Select ObjectSID from t_user Where ObjectSID = '$ObjectSID'").ObjectSID

        If($AccountResult -eq $null){
          If($MobilphoneNr -eq $null){
            New-DBInsert -Connection $Connection -Insert "Insert into t_user (GivenName,Surname,Office,Department,Sector,Account,TelephoneNr,ObjectSID,LastRefresh) Values ('$GivenName','$Surname','$Office','$DepartmentNr','$SectorNr','$AccountName','$TelephoneNr','$ObjectSID','$date')"
          }
          else{
            New-DBInsert -Connection $Connection -Insert "Insert into t_user (GivenName,Surname,Office,Department,Sector,Account,TelephoneNr,MobilephoneNr,ObjectSID,LastRefresh) Values ('$GivenName','$Surname','$Office','$DepartmentNr','$SectorNr','$AccountName','$TelephoneNr','$MobilphoneNr','$ObjectSID','$date')"
          }
        }
        else {
        New-DBCommand -Connection $Connection -Command "Update t_user Set Office='$Office', Department='$DepartmentNr',TelephoneNr='$TelephoneNr',MobilephoneNr='$MobilphoneNr', Sector='$SectorNr', LastRefresh = '$date' Where ObjectSid = '$ObjectSid'"
        }

        If($AccountResult){
        Clear-Variable AccountResult
        }

        Start-Sleep -Milliseconds 500
    } 

    $User_New = New-DBCommand -Connection $Connection -Command "Select * from t_user"

    $x = Read-Host "Sollen die Tabelleninhalte angezeigt werden? (j)a (n)ein" 

    If($x -eq "j"){
      $User_New | ft
    }
    
#Aus AD gelöscht Check
foreach($UserN in $User_New)
{
  $Acc = $UserN.Account
  $SID = $UserN.ObjectSid

    $ChangeResult = $users | Where-Object SID -eq "$SID" 
    If($ChangeResult -eq $null){
      $r = Read-Host "Soll der Account $Acc aus der IVS Datenbank gelöscht werden? (j)a (n)ein"
        If($r -eq "j"){
          New-DBCommand -Connection $Connection -Command "Delete from t_user Where ObjectSid = '$SID'"
        }
    }
    If($ChangeResult -ne $null){Clear-Variable ChangeResult}
       
}

If($Acc -ne $null){Clear-Variable Acc}
If($SID -ne $null){Clear-Variable SID}


#Neu im AD
foreach($user in $users)
{
  $Acc = $user.SamAccountName
  $SID = $user.Sid

  $NewResult = $User_Backup | Where-Object ObjectSID -eq "$SID"
  If($NewResult -eq $null){
  [Array]$NewUser += $Acc
  }

  If($NewResult -ne $null){Clear-Variable NewResult}  
}

If($NewUser -eq $null)
{
  Write-Host "Keine neuen Benutzer gefunden."
}
else {
  Write-Host "Diese Benutzer sind neu hinzugefügt worden:"
  Write-Host "---------------------------------------------"
  Write-Host $NewUser
}

If($NewUser -ne $null){Clear-Variable NewUser}



