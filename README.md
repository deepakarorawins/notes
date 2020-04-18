# notes
Useful commands and notes

<b>To kill all instance of any program on mac terminal: - </b>
pkill -f <name of program>
e.g. "pkill -f chromedriver-mac-64bit"
or "pkill -f Google Chrome Helper"

### Start Genymotion Emulator via terminal

<b>To get all emulator's name and id: -</b> "VBoxManage list vms"

<b>To start emulator using name:</b> - "open -a /Applications/Genymotion.app/Contents/MacOS/player.app/ --args --vm-name 'Samsung Galaxy S9'"

<b>To start emulator using id: -</b> "open -a /Applications/Genymotion.app/Contents/MacOS/player.app/ --args --vm-name 'd219161e-00b1-41d9-954b-aeeab7bd8e0d'"








### Find appPackage and appActivity name of your App

<b>To get all connected device's name and id: -</b> "adb devices"

Now run <b>"adb shell"</b>

Now in your mobile phone, open the app for which you want to find the appPackage and appActivity.

Now run this command: dumpsys window windows | grep -E 'mCurrentFocus'

or 

dumpsys window windows | grep -E 'mFocusedApp'

appPackage starts with com. and ends before backshash (/) and then comes activity name.



### Jenkins Troubleshoot

Issue: - java.lang.NoSuchMethodError: No such DSL method 'httpRequest'

Solution: - Install "HTTP Request Plugin"


Issue: - java.lang.IllegalStateException: Authentication 'Nexus' doesn't exist anymore
Solution: - Create a new Credential in Jenkins named Nexus with username <nexusupload> and password <Password1>.
  
Issue: - java.lang.NoSuchMethodError: No such DSL method 'findFiles' found among steps 
Solution: - Install "Pipeline Utility Steps" plugin

Issue: - ERROR: Could not find credentials entry with ID 'Nexus'
Solution: - Jenkins --> Credentials --> System --> Global Credentials (little down arrow) --> Add Credentials --> Fill in User Name, Password, id

.
.
.
.


## Maven
Issue: - [WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
Solution: - This or a similar warning is emitted by a plugin that processes plain text files but has not been configured to use a specific file encoding. So eliminating the warning is simply a matter of finding out which plugin emits it and how to configure the file encoding for it. This is as easy as adding the following property to your POM (or one of its parent POMs):
```xml
<properties>
	<project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
	<project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
</properties>
```
Then we don't need encoding entries in the plugin configurations <encoding>${encoding}</encoding>



