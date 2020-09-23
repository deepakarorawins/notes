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

https://stackoverflow.com/questions/28237694/xpath-get-parent-node-from-child-node

__Parent Element (../)__
@FindBy(xpath = "//XCUIElementTypeStaticText[@name='MyElementName']/../following-sibling::XCUIElementTypeOther")
private MobileElement myElement;

Xpath=//*[@id='rt-feature']//parent::div

### What is the difference between .// and //* in XPath?
https://stackoverflow.com/questions/35606708/what-is-the-difference-between-and-in-xpath

### Path separator in properties file
The Java properties file format dictates that the backslash character ("\") escapes the character that follow it, so to get a literal windows path you must have:
C:\\Users\\Maurice\\Desktop\\Logs

However, Java will convert path separator characters for you automatically to suit the runtime platform, so you can avoid this nuisance by always using forward slashes:
C:/Users/Maurice/Desktop/Logs


### If checked in blank folder (src/main/java or src/test/resources) in git those empty folder will be removed from project as git ignore empty folder 

https://www.topjavatutorial.com/struts/missing-srcmainjava-maven-project-eclipse/

When you create a Web application using Maven and import it in Eclipse, you may not see src/main/java folder in the Project or Package Explorer.
You can fix it using the following steps :
Step 1: Right click on the Maven Project, select Build Path and then Configure Build Path
Step 2: In Order and Export tab, you can see the message like ‘2 build path entries are missing’
Step 3: Select ‘JRE System Library’ and ‘Maven Dependencies’ checkbox and click OK.
Now you should see src/main/java and src/test/java folders in Package Explorer or Project Explorer.

### iphone charging sign keeps alternating
https://apple.stackexchange.com/questions/191239/my-iphone-keeps-switching-on-and-off-charge-whilst-charging-how-do-i-fix-it
Running this in terminal worked for me: (it will ask for your user's password)
sudo killall -STOP -c usbd
This pauses the troublesome process instead of killing it altogether like other answers suggest. The difference is that macOS won't try to reopen it automatically and cause the issue again.

Running sudo killall -CONT usbd will resume the process, should anything require it.

Tested on: iPhone 7 (iOS 11) + MacBook Pro Late 2013 (10.13.6)


### Maven 3 warnings about build.plugins.plugin.version
https://stackoverflow.com/questions/4123044/maven-3-warnings-about-build-plugins-plugin-version

Add a ``` <version> ``` element after the <plugin> <artifactId> in your pom.xml file. Find the following text:
``` 
<plugin>
  <artifactId>maven-compiler-plugin</artifactId>
  <version>2.3.2</version> 
```


### java.lang.NoClassDefFoundError: org/openqa/selenium/remote/internal/JsonToWebElementConverter
This was due to different version of cucumber


### get iPhone udid

https://stackoverflow.com/questions/17237354/how-can-i-find-the-device-uuids-of-all-connected-devices-through-a-command-line

install ideviceinstaller on Mac OS X via brew command: brew install ideviceinstaller
then ``` idevice_id -l ``` will work from terminal
or
If you have Xcode installed, you can use Instruments to get all known devices also. With
``` instruments -s devices ```

https://www.wikihow.com/Obtain-the-Identifier-Number-(UDID)-for-an-iPhone,-iPod-or-iPad

### Get bundleid of installed app on iOS using itunes
https://youtu.be/Iq6Dt0rz7Uw?t=883

### Kill avd device
adb -s emulator-5554 emu kill


### Undo Last Git Commit with reset
https://devconnected.com/how-to-undo-last-git-commit/#:~:text=Conclusion-,Undo%20Last%20Git%20Commit%20with%20reset,removed%20from%20your%20Git%20history.

The easiest way to undo the last Git commit is to execute the “git reset” command with the “–soft” option that will preserve changes done to your files. You have to specify the commit to undo which is “HEAD~1” in this case.

The last commit will be removed from your Git history.

$ git reset --soft HEAD~1




### iOS: Changing Device Language or Region
https://developers.perfectomobile.com/display/TT/iOS%3A+Changing+Device+Language+or+Region
https://developers.perfectomobile.com/display/TT/Test+your+app+for+specific+language+and+region+settings


### Update Carthage
brew upgrade carthage

### Uninstall Node
sudo rm -rf /usr/local/lib/node_modules
sudo rm -rf ~/.npm
brew uninstall node
brew install node --without-npm

