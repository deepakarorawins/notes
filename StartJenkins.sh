#! /bin/bash
echo "Hello World"
cd /Users/darora/soft
#java -jar jenkins.war --httpPort=8080

#to use office365 email below commond must be used
java -Dmail.smtp.starttls.enable=true  -jar jenkins.war --httpPort=8080



java -Djava.awt.headless=true -Dhudson.model.DirectoryBrowserSupport.CSP= -jar /usr/share/jenkins/jenkins.war --webroot=/var/cache/jenkins/war --httpPort=8080 --ajp13Port=-1

#or 
#java -Djava.awt.headless=true -Dhudson.model.DirectoryBrowserSupport.CSP=" " -jar /usr/share/jenkins/jenkins.war --webroot=/var/cache/jenkins/war --httpPort=8080 --ajp13Port=-1
