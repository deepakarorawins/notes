@echo off
@break off
@title Start Jenkins
@color 0a
@cls

cd "C:\Program Files\Jinkins 2.121.3\"
start java -jar jenkins.war --httpPort=8080
start http://localhost:8080

exit
