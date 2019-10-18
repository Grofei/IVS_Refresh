###Funktionen zum DB Zugriff###############################################################################################################################
function New-DBCommand()
{ 
Param(
  [Parameter(Mandatory = $true)][MySql.Data.MySqlClient.MySqlConnection]$Connection,
  [Parameter(Mandatory = $true)][string]$Command
  )
Try {
  $CommandObj = New-Object MySql.Data.MySqlClient.MySqlCommand($Command, $Connection)
  $DataAdapter = New-Object MySql.Data.MySqlClient.MySqlDataAdapter($CommandObj)
  $DataSet = New-Object System.Data.DataSet
  $RecordCount = $dataAdapter.Fill($dataSet, "data")
  $DataSet.Tables[0]
  }
Catch {
  Write-Host "ERROR : Unable to run Command : $Command `n$Error[0]"
 }
}

function New-DBInsert()
{ 
Param(
  [Parameter(Mandatory = $true)][MySql.Data.MySqlClient.MySqlConnection]$Connection,
  [Parameter(Mandatory = $true)][string]$Insert
  )
Try {
  $Command = New-Object MySql.Data.MySqlClient.MySqlCommand($Insert, $Connection)
  $Command.ExecuteNonQuery() | Out-Null
  }
Catch {
  Write-Host "ERROR : Unable to run Insert : $Insert `n$Error[0]"
 }
}