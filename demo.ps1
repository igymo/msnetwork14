Start-Transcript -Outputdirectory "C:\Users\igystarmo\Documents"
#Instalacija modula Posh-ACME
Install-Module Posh-ACMEYy
#import modula Posh-ACME ako je instaliran
Import-Module Posh-ACME
#namjestiti testni server 
Set-PAServer LE_STAGE
#izlistati komande modula Posh-ACME
get-command -Module posh-acme
help New-PACertificate 
#izlkistati dostupne dns pluginove
Get-PaPlugin
#izlistati parametre za ClouDNS plugin
Get-PAPlugin Cloudflare -Params

$pArgs = @{
    CFToken = (''| ConvertTo-SecureString -AsPlainText -Force)
}
New-PaCertificate -DnsPlugin Cloudflare -Domain igorpuhalo.from.hr -Name "igorpuhalo.from.hr" -Contact "igorpuhalo@hotmail.com" -FriendlyName "igorpuhalo.from.hr" -AcceptTOS -PluginArgs $pArgs -Verbose
get-pacertificate -Name "igorpuhalo.from.hr" -Verbose | fl
submit-renewal -Name "igorpuhalo.from.hr" -Verbose -Force
