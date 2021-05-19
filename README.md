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


## When Jenkins installed via
2020-12-03 17:03:03,893 INFO  AppiumManager                      :(97  ) - Killed Existing Node Instances
2020-12-03 17:03:03,894 INFO  CommandPrompt                      :(28  ) - Mac OS X
2020-12-03 17:03:03,894 INFO  CommandPrompt                      :(39  ) - Identified Mac - Running Command on Mac 
2020-12-03 17:03:03,894 INFO  CommandPrompt                      :(40  ) - Command = appium --session-override
**java.io.IOException: Cannot run program "appium": error=2, No such file or directory
	at java.lang.ProcessBuilder.start(ProcessBuilder.java:1048)**
	
Solution: - 
Start jenkins using below command as given in the link

```jenkins-lts```

To have launchd start jenkins-lts now and restart at login:

  brew services start jenkins-lts
  
Or, if you don't want/need a background service you can just run: - jenkins-lts

https://www.macminivault.com/installing-jenkins-on-macos/


### Jenkins Environment Varialbles
http://localhost:8080/env-vars.html/





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

### Exclude specific element from List of elements
xpath = "//a[.!='Click Here for Broken Link']"


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
`sudo killall -STOP -c usbd`
This pauses the troublesome process instead of killing it altogether like other answers suggest. The difference is that macOS won't try to reopen it automatically and cause the issue again.

Running `sudo killall -CONT usbd` will resume the process, should anything require it.

Tested on: iPhone 7 (iOS 11) + MacBook Pro Late 2013 (10.13.6)




### Restart iPhone via terminal connected to computer
idevicediagnostics is a Linux tool which can help here. It is also available for macOS according to http://krypted.com/mac-os-x/use-libimobiledevice-to-view-ios-logs/

Once installed you can use

idevicediagnostics restart

to restart your device.

To Restart the iOS devices connected more than one devices by

idevicediagnostics -u udidnumber restart







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



### iOS: Uninstall app

ios-deploy --uninstall_only --bundle_id <bundle id>


### iOS Appium Setup


### Homebrew Permissions Denied Issues Solution

https://gist.github.com/irazasyed/7732946

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`

or

`sudo chown -R $(whoami) $(brew --prefix)/*`





**Install Xcode or Upgrade**

```
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew --version

brew install carthage
```
Optional need to check below
Install JAVA

`java -version`

If the version is less than 1.8 or the command is not recognized you need to install java.

If the version is 1.8 or greater then go to Ruby install.

`\curl -sSL https://get.rvm.io | bash -s stable --ruby`

Optional need to check above
```
brew install node

npm --version

node -v

npm install -g update-node

npm install -g appium-doctor

appium-doctor --ios

npm install -g appium

appium -v
```



### Update Carthage
`brew upgrade carthage`

### Uninstall Node
`sudo rm -rf /usr/local/lib/node_modules`

`sudo rm -rf ~/.npm`

`brew uninstall node`

`brew install node --without-npm`

### Update Node
`npm install -g update-node`

### Xcode
Remove unused simulator to gain storage space back
Execute this on terminal: - xcrun simctl delete unavailable

xcode-select: error: tool 'xcodebuild' requires Xcode, but active developer directory '/Library/Developer/CommandLineTools' is a command line tools instance

Point xcode-select to the Xcode app Developer directory using the following command:
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer


https://stackoverflow.com/questions/17980759/xcode-select-active-developer-directory-error



### Jenkins
Sample commands:
Install the latest LTS version: brew install jenkins-lts

Install a specific LTS version: brew install jenkins-lts@YOUR_VERSION

Start the Jenkins service: brew services start jenkins-lts

Restart the Jenkins service: brew services restart jenkins-lts

Update the Jenkins version: brew upgrade jenkins-lts


Server starts at http://localhost:8080  
But you can change the port by editing the file at /usr/local/Cellar/jenkins/2.167/homebrew.mxcl.jenkins.plist


### When jenkins started by service we get following error: -
2021-02-28 18:40:48,183 INFO  CommandPrompt                      :(40  ) - Command = appium --session-override
java.io.IOException: Cannot run program "appium": error=2, No such file or directory


*Solutoin: -* 
Jenkins -> Manage Jenkins -> Configure System -> Global properties -> Environment variables I added:

Name: Path

Value: /bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin


### How to open apps from unidentified developers on Mac in macOS Catalina
https://www.imore.com/how-open-apps-anywhere-macos-catalina-and-mojave

`sudo spctl --master-disable` (To Allow)
`sudo spctl --master-enable` (Default)

### VS Code Shortcuts
https://medium.com/better-programming/20-vs-code-shortcuts-for-fast-coding-cheatsheet-10b0e72fd5d

The code formatting is available in Visual Studio Code through the following shortcuts:

On Windows Shift + Alt + F.

On Mac Shift + Option + F.

On Linux Ctrl + Shift + I.

Multiline Commment 
On Mac Cmd + /


### Finding other computers on network over command line

Use `arp -a` to see your computer's current arp table. It will show only those IP addresses your computer has interacted with. Output like this (obscured a little to hide MAC addresses on my network)


### Remote login via ssh

`ssh username@ip-address`



### Enabling Remote Login from the Command Line
If you’re setting up your Mac with scripts, you can enable Remote Login from the command line. On a terminal window, type:

`sudo systemsetup -setremotelogin on`

If you want to disable it, you can do so with:

`sudo systemsetup -setremotelogin off`





### Restart mac via ssh

`sudo /sbin/shutdown -r now`

or

`ssh username@ip-address sudo /sbin/shutdown -r now`



	
	
	
### Set up an SSH key	Bitbucket
https://support.atlassian.com/bitbucket-cloud/docs/set-up-an-ssh-key/	
	

This command will create a new SSH key using the email as a label: - 	

	ssh-keygen -t rsa -b 4096 -C <your email id> 	

To start the agent, run the following: -

	eval `ssh-agent`

Enter ssh-add followed by the path to the private key file: -

	ssh-add -K ~/.ssh/id_rsa
	
On macOS, the following command copies the output to the clipboard: - 

	pbcopy < ~/.ssh/id_rsa.pub
			  
Add this copied public key to bitbucket profile
		
Return to the terminal window and verify your configuration and username by entering the following command: - 			  

				  ssh -T git@bitbucket.org
