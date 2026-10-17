Start-Transcript -Outputdirectory "C:\Users\igystarmo\Documents"
#Instalacija modula Posh-ACME
Install-Module Posh-ACMEYy
#import modula Posh-ACME ako je instaliran
Import-Module Posh-ACME
#namjestiti testni server 
Set-PAServer LE_STAGE
#izlistati komande modula Posh-ACME
get-command -Module posh-acme
#izlkistati dostupne dns pluginove
Get-PaPlugin
#izlistati parametre za ClouDNS plugin
Get-PAPlugin ClouDNS -Params

$pArgs = @{
    CDUserType = 'auth-id'
    CDUsername = '70788'
    CDPassword = (Read-Host "MSNetwork14!" -AsSecureString)
}

New-PaCertificate -DnsPlugin ClouDNS -Domain igorpuhalo.from.hr -Name "igorpuhalo.from.hr" -Contact "igorpuhalo@hotmail.com" -FriendlyName "igorpuhalo.from.hr" -AcceptTOS -PluginArgs $pArgs