## Short script for acquiring an ip address
## The powershell alias system is absolutely ridiculous imo

$(Invoke-WebRequest ident.me).Content
