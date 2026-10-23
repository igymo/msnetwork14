Start-Transcript -Outputdirectory "C:\Users\igystarmo\Documents"
#Instalacija modula Posh-ACME
Install-Module Posh-ACME
#import modula Posh-ACME ako je instaliran
Import-Module Posh-ACME
#namjestiti testni server 
Set-PAServer LE_STAGE
#izlistati komande modula Posh-ACME
get-command -Module posh-acme
get-help New-PACertificate
#izlkistati dostupne dns pluginove
Get-PaPlugin
#izlistati parametre za ClouDNS plugin
#pogledati parameter plugina
Get-PAPlugin Cloudflare -Params
#token cloudFlare-a
$pArgs = @{
    CFToken = (''| ConvertTo-SecureString -AsPlainText -Force)
}
#izdavanje novog certifikata
New-PaCertificate -DnsPlugin Cloudflare -Domain naziv.domene -Name "bilokoje ime" -Contact "email@domena.com" -FriendlyName "friendly name domene" -AcceptTOS -PluginArgs $pArgs -Verbose
#izlistati dobiveni certifikat i njegove parameter
get-pacertificate -Name "nazivdomene" -Verbose | fl
#renewal certifikata
submit-renewal -Name "igorpuhalo.from.hr" -Verbose -Force
