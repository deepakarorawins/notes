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

Issue: - In pom.xml
Plugin execution not covered by lifecycle configuration: com.github.webdriverextensions:webdriverextensions-maven-plugin:3.2.0:install-drivers (execution: default, phase: generate-sources)
Solution: - A new syntax has been introduced to simplify lifecycle mapping metadata for plugin executions, using processing instructions within plugin/executions/execution nodes.
__e.g.__: - 
``` xml
<execution>
	<?m2e execute onConfiguration?>
	<goals>
		<goal>install-drivers</goal>
	</goals>
</execution>
```

Supported syntax:

* ``` <?m2e ignore?> ``` this execution will be ignored;
* ``` <?m2e execute?> ``` this execution will be executed once on project import;
* ``` <?m2e execute onConfiguration?> ``` this execution will be executed on every Project Configuration update;
* ``` <?m2e execute onIncremental?> ``` this execution will be executed on every incremental build;
* ``` <?m2e execute onConfiguration,onIncremental?> ``` this execution will be executed on every Project Configuration update and every incremental build;
* ``` <?m2e configurator configuratorId?> ``` this execution will be delegated to the matching m2e configurator.
Each instruction can be placed in the <execution> node, this way it applies on this exact execution or on any execution of the same plugin with the same executionId in child pom. It can also be placed in a <plugin> node, this way it acts the same as a dedicated <pluginManagement> section which lists all goals of this plugin.

Please be aware there are currently no Quick Fixes available to automatically inject these new instructions when a “Plugin Execution Not Covered” error marker is found.

### Chrome Driver
Issue: - “chromedriver” cannot be opened because the developer cannot be verified.

Solution: - This trick will work with any other file also
* Ctrl + Click the chromdriver file.
* Select Open on shortcut menu.
* Click Open on the dialog.

### XPATH

__Parent Element (../)__
@FindBy(xpath = "//XCUIElementTypeStaticText[@name='MyElementName']/../following-sibling::XCUIElementTypeOther")
private MobileElement myElement;

