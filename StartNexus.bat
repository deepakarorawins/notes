@echo off
@break off
@title Start Nexus Server
@color 0a
@cls

cd "C:\nexus-3.14.0-04-win64\nexus-3.14.0-04\bin\"
nexus.exe /run
start http://localhost:8081

exit
