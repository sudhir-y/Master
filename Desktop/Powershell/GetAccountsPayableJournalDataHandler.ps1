. "E:\BonusReportsPS\WriteLog.ps1"
Write-Log -Message "GetAccountsPayableJournalData"

$ClientId = "cccwebserviceworker"
$ClientSecret = "JHAS83*3+=s8f5^jf8JH$59shd"

$Headers = BasicAuth($ClientId, $ClientSecret)

$url = "https://skprod-ccc-webserviceworker-southcentralus-api.serviceking.com/GetAccountsPayableJournalData"
$Date = "{0:yyyy-MM-dd}T00:00:00+00:00" -f (get-date)

$GetAccountsPayableJournalData = '{
    "AccountingGroupID": "7312",
    "LastTransactionDate": "'+$Date+'",
    "AccountingSessionID": ""
}'

Write-Log -Message $GetAccountsPayableJournalData

try {
    [System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $True }
                
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    Write-Log -Message "Invoke Post Method GetAccountsPayableJournalData"         

    $response = Invoke-WebRequest -Uri $url -Method Post -Body $GetAccountsPayableJournalData -ContentType 'application/json' -Headers $Headers

    Write-Log -Message $response
}
catch {
    Write-Log -Message "StatusCode:" $_ 
    Write-Log -Message "StatusDescription:" $_.Exception
}

