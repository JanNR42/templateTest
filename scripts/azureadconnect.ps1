$AADConnectDLUrl = "https://download.microsoft.com/download/B/0/0/B00291D0-5A83-4DE7-86F5-980BC00DE05A/AzureADConnect.msi"
$tempfile = [System.IO.Path]::GetTempFileName()
$folder = [System.IO.Path]::GetDirectoryName($tempfile)
$webclient = New-Object System.Net.WebClient
$webclient.DownloadFile($AADConnectDLUrl, $tempfile)
Rename-Item -Path $tempfile -NewName "AzureADConnect.msi"
$MSIPath = $folder + "\AzureADConnect.msi"
Copy-Item -Path $MSIPath -Destination "C:\Users\Public\Desktop"
if ((Test-Path "C:\Users\Public\Desktop") -eq $true){
    Restart-Computer -Force
}
