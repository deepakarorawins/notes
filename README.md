# notes
Useful commands and notes

<b>To kill all instance of any program on mac terminal: - </b>
pkill -f <name of program>
e.g. "pkill -f chromedriver-mac-64bit"
or "pkill -f Google Chrome Helper"
	
<b> Stop teamviewer service at Mac machine </b>
	sudo launchctl stop com.teamviewer.service
	
	
	
# The port is occupied by another process - mac
Quick and easier solution:

For killing single port:
```kill -9 $(lsof -ti:3000)```
#3000 is the port to be freed

For killing multiple ports:
```kill -9 $(lsof -ti:3000,3001)```
#3000 and #3001 are the port to be freed


Kill multiple ports with single line command:
```kill -9 $(lsof -ti:3000,3001)```
#here multiple ports 3000 and 3001 are the ports to be freed

```lsof -ti:3000```
82500 (Process ID)

```lsof -ti:3001```
82499 (Process ID)

```lsof -ti:3001,3000```
82499 82500

```kill -9 $(lsof -ti:3001,3000)```
Terminates both 82499 and 82500 processes in a single command.

For using this in package.json scripts:

```
"scripts": {
   "start": "kill -9 $(lsof -ti:3000,3001) && npm start"
}
```	
	
	


# Start Genymotion Emulator via terminal

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

	
# fatal: unable to access 'https://git.libimobiledevice.org/libimobiledevice.git/': SSL certificate problem: certificate has expired

One more option. You can run this command to disable the requiring of SSL for repositories.
```git config --global http.sslVerify false```

Installing a repository without HTTPS can be not secure.
I did it on my dev machine, so it works for me. Then run:
	
```brew install libimobiledevice --HEAD``` // or another repo which has expired SSL cert

and enable SSL requiring after
	
```git config --global http.sslVerify true```





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

### Xcode doesn't see my iOS device but iTunes does
	
In some circumstances, Xcode will not recognise (won't even see) a connected device that was previously recognised, even though there were no changes in Mac OS/iOS/Xcode versions. This seems to happen if you connect the device while the Mac and/or the device are locked when you connect them. The device will ask if you want to trust the computer even though you already did so, but the device will still not be visible in Xcode.

Restarting Xcode or the device do not seem to have any effect. One solution is to reboot the Mac. Another much quicker solution is to restart usbmuxd:

	First try only step 3.
		
1. Quit Xcode
2. Disconnect the device
3. In a terminal window, type: sudo pkill usbmuxd (it will be restarted again automatically)
4. Restart Xcode
5. Connect the device
Your device should now be visible again in Xcode!	
		
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


### Updatge appium-device-farm plugin  
```appium plugin update device-farm```  
or  
```appium plugin update device-farm --unsafe```



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


#xcode-select active developer directory error
	
This problem happens when xcode-select developer directory was pointing to /Library/Developer/CommandLineTools when a full regular Xcode was required (happens when CommandLineTools are installed after Xcode)

Solution:

1. Install Xcode (get it from https://appstore.com/mac/apple/xcode) if you don't have it yet.
	
2. Accept the Terms and Conditions.
	
3. Ensure Xcode app is in the /Applications directory (NOT /Users/{user}/Applications).
	
4. Point xcode-select to the Xcode app Developer directory using the following command:
	
```sudo xcode-select -s /Applications/Xcode.app/Contents/Developer```
	
Note: Make sure your Xcode app path is correct.

Xcode: ```/Applications/Xcode.app/Contents/Developer```
	
Xcode-beta: ```/Applications/Xcode-beta.app/Contents/Developer```
	
	

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
				  
				  
				  
### My .bash_profile

echo Hello from .bash_profile 
# export JAVA_HOME=$(/usr/libexec/java_home)

# Setting default JDK to version 1.8.
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_181`

# Setting default JDK to version 1.8.
#export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Setting default JDK to version 13.0.2.
#export JAVA_HOME=`/usr/libexec/java_home -v 13.0.2`

# Setting default JDK to version 14.0.1.
#export JAVA_HOME=`/usr/libexec/java_home -v 14.0.1`

export PATH=$JAVA_HOME/bin:$PATH
export M2_HOME=/Users/deepakarora/soft/apache-maven-3.6.3
export PATH=$PATH:$M2_HOME/bin

# Setting ANDROID HOME
export ANDROID_HOME="/Users/deepakarora/Library/Android/sdk"
export PATH=${PATH}:/$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin





# Setting alisas
alias c="clear"
alias j8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_181`; java -version"
alias j13="export JAVA_HOME=`/usr/libexec/java_home -v 13.0.2`; java -version"
alias j14="export JAVA_HOME=`/usr/libexec/java_home -v 14.0.1`; java -version"
alias graph='git log --all --decorate --oneline --graph'

				  
				  
### Undo git add . (Moving files back to Working area from Staging area)

				  git rm --cached -r
				  
				  
				  
### Appium Studio stuck at Non-instrumental mode, and 

Open Appium studio and from the menu click on Tools-> iOS Provisioning Profile Selection or
	
Open Appium studio and from the menu click on Tools->iOS Provisioning Profile Management

Dialogs do not appear.
	
Solution: - Open Appium studio and from the menu click on Open Logs Folder.
	
Open Error.log file and search for "Duplicate key" now try to delete these key/s from the following location - /Users/radmila.petrovic/Library/MobileDevice/Provisioning Profiles/6db32701-45b0-4066-8e2f-5f3005a5e65c.mobileprovision and see if that fixes the issue
	
https://appium.experitest.com/t/cant-access-ios-provisioning-profile-selection-management-from-the-menu/2150

	
	
# Mac with M1 chip
## Jenkins - Issue
Issue 1: - 
```
+ /Users/Jenkinslab/Build/tools/hudson.tasks.Maven_MavenInstallation/M3/bin/mvn -Dmaven.test.failure.ignore clean test -Dtest=Runner -Dcustomdata=n -Dplatform=ios-devices -Dtoolcat=Build_Sanity -Denvironment=test -Dinstall=y -Dgroup=functional -Dbrowser=headless -Dcredentials=nasanitytest@mailinator.com -Dretry=0 -DfailIfNoTests=false -Dcom.sun.security.enableAIAcaIssuers=true
The JAVA_HOME environment variable is not defined correctly
This environment variable is needed to run this program
NB: JAVA_HOME should point to a JDK not a JRE
```
![image](https://user-images.githubusercontent.com/30565176/133909183-e4c40274-b29f-4ac8-a324-c564d47681cc.png)

	
Solution: - Add following into Jenkins -> Node Properties -> Environment Variables (respective values): - 
```	
	Name=JAVA_HOME
	Value=/Library/Java/JavaVirtualMachines/jdk1.8.0_301.jdk/Contents/Home
```
![image](https://user-images.githubusercontent.com/30565176/133909004-df18dbfa-d4d9-40b4-ad55-079602057311.png)

	
	
	
	
Issue 2: - 
```
2021-09-18 07:13:03,575 INFO  CommandPrompt                      :(40  ) - Command = appium --session-override
java.io.IOException: Cannot run program "appium": error=2, No such file or directory
	at java.lang.ProcessBuilder.start(ProcessBuilder.java:1048)
```
![image](https://user-images.githubusercontent.com/30565176/133909253-7dbc97af-dd7c-4744-b301-b717ddb698ff.png)

	
Solution: - Add following into Jenkins -> Node Properties -> Environment Variables (with other values): - 
```
	Name=PATH
	Value=/opt/homebrew/bin
```
![image](https://user-images.githubusercontent.com/30565176/133909015-d343d970-7aed-4d97-a431-4dcadbd75511.png)


	
# To check Jenkins node environment: - 
Dashboard → New Item → Enter any name → Select Pipeline → OK
Navigate to Pipeline → Definition=Pipeline script → Use Groovy Sandbox
use below script: - 
```
echo 'hello from Pipeline'
node ("brkiosbuild15") {
	sh "which java"
    	sh "java -version"
    	sh "which node"
    	sh "node -v"
    	sh "which appium"
    	sh "appium -v"
	def mvnHome = tool 'M3'
  	sh "${mvnHome}/bin/mvn -v"
}
```
	
### Above solution was not working I spent almost 3 days to get it fixed.
	
Solution: - In my master jenkins server in "Manage Jenkins --> System Configuration --> Configuration --> Global Properties --> Environment variables" was checked and Java_HOME was given there which was causing issue on slave nodes. I unchecked that Environment variable checkbox which deleted the entries of JAVA_HOME and PATH also. 
# Now above solution is working fine on slave nodes ![image](https://user-images.githubusercontent.com/30565176/142961118-7161eae0-12da-4cba-8021-a24b987aa703.png)
	
# And to give JAVA_HOME for master node use this. ![image](https://user-images.githubusercontent.com/30565176/142962254-9e0e91cb-1485-474a-a556-13b44ef80670.png)


	
	
	
	
	
	
# "'instruments'" requires Xcode, but active developer directory '/Library/Developer/CommandLineTools' is a command line tools instance
	and if we change the path then it asks to install the "xcode command line tool" and after installation it kees asking to install the same.
	
Sol.: - Deprecations The deprecated instruments command-line tool has been removed; instead, use xctrace.
	Instruments will be deprecated in Xcode 12 as below. Previously, instruments command was used.
	
	https://developer.apple.com/forums/thread/690889
	https://kazucocoa.wordpress.com/2020/08/15/ios-instruments-template-and-xctrace-templates/
	
use ```xcrun xctrace list devices | grep -i OKAUTO | grep -v Simulator``` 

instead of 

```instruments -s devices | grep -i OKAUTO | grep -v Simulator```
	
	
use ```xcrun xctrace list devices | grep "iPhone 8 (" | grep -i Simulator | sort -r | grep -v + | awk -F "(" '{print $2}' | awk -F ")" '{print $1}'```

instead of

```instruments -s devices | grep "iPhone 8 (" | grep -i Simulator | sort -r | grep -v + | awk -F "(" '{print $2}' | awk -F ")" '{print $1}'```
	
### Error running xcrun simctl

Sol.: - Xcode > Preferences > Locations
	Click on dropdown, and selecte the given location/xcode
	
	
### iPhone-Appium desired capability
```
{
  "platformName": "iOS",
  "appium:deviceName": "iPhone 6s OKAUTO",
  "appium:platformVersion": "15.1",
  "appium:bundleId": "com.milwaukeetool.mymilwaukee",
  "appium:udid": "00008101-001959382678001E",
  "appium:useNewWDA": "true",
  "appium:unlockType": "null"
}
```
	
### Java Naming Convention
	Class or Interface name: - MyClass (start with capital letter)
	final constant values: - MYVALUE or MY_VALUE
	methodName: - myMethod (camel case)
	packagename: - packagename (all small letters)
	
	
	
### Appium failures on video recording start (iPhone X, 11 ffmpeg issue)
https://github.com/appium/appium/issues/12856
https://github.com/appium/appium-dotnet-driver/issues/404

https://discuss.appium.io/t/ios-ffmpeg-died-unexpectedly/35668/4

https://github.com/3b1b/manim/issues/55

.withVideoScale("1280:720");



https://discuss.appium.io/t/i-can-not-take-screen-shoot-or-record-video-by-appium-1-22-and-real-device-ios-15/35100/7

https://www.reddit.com/r/linux4noobs/comments/671z6b/width_not_divisible_by_2_error_when_using_ffmpeg/
	
	
### In Appium Server logs: - [ffmpeg] [libx264 @ 0x7f9ed3804600] width not divisible by 2 (1125x2436)	
Solution is to use .withVideoScale("trunc(iw/2)*2:trunc(ih/2)*2"); as given in https://github.com/appium/appium-dotnet-driver/issues/404 by KazuCocoa, also see https://ffmpeg.org/ffmpeg-filters.html: - 
```
	@BeforeMethod
	public void beforeMethod() {
		IOSStartScreenRecordingOptions o1 = new IOSStartScreenRecordingOptions()
				.withVideoQuality(VideoQuality.MEDIUM)
				.withVideoType("h264")
				.withVideoScale("trunc(iw/2)*2:trunc(ih/2)*2"); // To fix width not divisible by 2 error for Some iPhones like iPhone12 mini, iPhone13 mini and iPhoneX
		
		((CanRecordScreen) getDriver()).startRecordingScreen(o1);
		setRecording(true);
	}
```
	
### InteliJ shorcuts: 
	Load Maven changes -> Shift+Command+I (Ctrl+Shift+0 win/linux)
	
	Multiline edit -> 
	drage while holding Option button
	
	Ctrl+G for selection
	
	
	
	
### Various actions on web or mobile
scrollToBottomDirect
scrollToBottomInParts


### Docker
docker run --rm --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts-jdk11

docker volume inspect jenkins_home

docker exec -it jenkins /bin/bash

docker cp /Users/deepakarora/FULL-2022-11-20_10-23 jenkins:/var/jenkins_home/backup




Finding the Jenkins Data in the Container
docker exec -ti <container name>
To Exit from above: To detach the tty without exiting the shell, use the escape sequence CTRL+P followed by CTRL+Q. https://serverfault.com/questions/1025688/how-to-exit-docker-exec-after-container-has-exited

https://www.cloudbees.com/blog/how-to-install-and-run-jenkins-with-docker-compose
https://www.youtube.com/watch?v=6KEERS6nZjM




https://stackoverflow.com/questions/22907231/how-to-copy-files-from-host-to-docker-container
The cp command can be used to copy files.

One specific file can be copied TO the container like:

docker cp foo.txt container_id:/foo.txt
One specific file can be copied FROM the container like:

docker cp container_id:/foo.txt foo.txt
For emphasis, container_id is a container ID, not an image ID. (Use docker ps to view listing which includes container_ids.)

Multiple files contained by the folder src can be copied into the target folder using:

docker cp src/. container_id:/target
docker cp container_id:/src/. target
Reference: Docker CLI docs for cp

In Docker versions prior to 1.8 it was only possible to copy files from a container to the host. Not from the host to a container.

https://adamtheautomator.com/jenkins-docker/#Finding_the_Jenkins_Data_on_the_Docker_Host
https://octopus.com/blog/jenkins-docker-install-guide


### Backup and Restore Jenkins Data
https://medium.com/clarusway/disaster-recovery-guide-for-jenkins-46f3a7030481
	
	
### VBA for reading aloud outlook email sender and subject on arrival (Windows only)
https://www.datanumen.com/blogs/let-outlook-auto-read-subject-sender-incoming-email/
https://apple.stackexchange.com/questions/335607/is-there-something-like-macros-in-outlook-2016-on-mac
	
	
### Open image full screen with "open -a Preview" Mac OS
https://apple.stackexchange.com/questions/133311/open-image-full-screen-with-open-a-preview
	
Execute below command in terminal:  
```open -a Preview somefile.png ; /usr/bin/osascript -e 'tell application "Preview"' -e "activate" -e 'tell application "System Events"' -e 'keystroke "f" using {control down, command down}' -e "end tell" -e "end tell"```


### Is there a way to make Preview not open all previously opened files?
https://apple.stackexchange.com/questions/54854/is-there-a-way-to-make-preview-not-open-all-previously-opened-files  

**Undo resume for a specific application**  
Type the following command in the Terminal. Then restart the specific application.

In general the syntax is:  
```defaults write com."producer"."program-name" ApplePersistenceIgnoreState YES```  

Thus, in your case (Preview.app) it is:  
```defaults write com.apple.Preview ApplePersistenceIgnoreState YES```


### IOS Error Domain=kCLErrorDomain Code=0 "(null)"  
https://stackoverflow.com/questions/32543754/ios-9-error-domain-kclerrordomain-code-0-null   
<img width="770" alt="image" src="https://github.com/deepakarorawins/notes/assets/30565176/41f7fcbb-6f98-45b4-8441-a291de272700">



### zrok - to share localhost/local machine on publick internet
Reserved Shares:   
zrok shares are ephemeral unless you specifically create a "reserved" share.
A reserved share can be re-used multiple times; it will survive termination of the zrok share command, allowing for longer-lasting semi-permanent access to shared resources.

The first step is to create the reserved share:  
```$ zrok reserve public --backend-mode proxy 8080 --unique-name abcjenkins```

If we do nothing else, and then point a web browser at the frontend endpoint, we get:
This is the 404 error message returned by the zrok frontend. We're getting this because we haven't yet started up a zrok share for the service. Let's do that with:

This command:
```zrok share reserved abcjenkins```


Now when we navigate below url we get our page
"https://**abcjenkins**.share.zrok.io/"




### To update your master branch with the latest code from the develop branch, you can follow these steps. The idea is to reset the master branch to match the develop branch, which effectively makes master identical to develop.

**Step 1: Ensure Your Local Repository is Up-to-Date**

```git fetch origin```

**Step 2: Switch to the develop Branch**

```git checkout develop```

**Step 3: Make Sure develop is Up-to-Date**

```git pull origin develop```

**Step 4: Delete the master Branch Locally**
First, ensure you are not currently on the master branch:

```git branch -D master```

**Step 5: Create a New master Branch from develop**

```git checkout -b master```

**Step 6: Force Push the New master to Remote**
This will overwrite the remote master branch with the new one from develop:

```git push origin master --force```

**Step 7: Set the master Branch as the Default (Optional)**
If needed, you may want to set master as the default branch on your remote repository (e.g., GitHub or GitLab). This can typically be done in the repository settings under "Branches."

Important Notes:
Force pushing can overwrite history on the remote master branch. Make sure that this is what you intend to do, and that no one else is relying on the current state of master.
It's generally a good idea to communicate this change to your team to avoid any confusion.
This will result in your master branch having the same code as develop, essentially making it the new "master" branch.



### Start Appium
``` public void startAppium() {
        try {
            String ipAddress = getLocalIpAddress();
            utils.setAppiumPort(String.valueOf(findFreePort()));
            //utils.setAppiumPort("4723");
            Runtime rt = Runtime.getRuntime();
            rt.exec("appium --address 127.0.0.1 --port "+utils.getAppiumPort()+" --log ServerLogs/server.log");
            //rt.exec("appium --address 127.0.0.1 --port "+utils.getAppiumPort()+" --log ServerLogs/server.log --use-plugin=appium-dashboard");
            //rt.exec("appium server -ka 800 --use-plugins=appium-dashboard --log ServerLogs/server.log");
            //rt.exec("appium server -ka 800 --use-plugins=appium-dashboard --plugin-device-farm-platform=ios --address 127.0.0.1 --port 4723 --log ServerLogs/server.log");
            //rt.exec("appium server -ka 800 --use-plugins=appium-dashboard --address 127.0.0.1 --port 4723 --log ServerLogs/server.log");
            //rt.exec("appium server -ka 800 --use-plugins=element-wait,device-farm,appium-dashboard --plugin-device-farm-platform=ios --plugin-device-farm-device-types=real");
            //wait for appium server to finish booting
            //Thread.sleep(5000);
            // Wait for the server to be available
            waitForServer(30,"http://127.0.0.1:" + utils.getAppiumPort() + "/status");
            utils.log().debug("Started Appium Server on port "+utils.getAppiumPort());
            utils.log().info("\uD83D\uDCE3\uD83D\uDCE3\uD83D\uDCE3 Dashboard Plugin will be served (if available) on node machine at \uD83D\uDD17 http://localhost:"+utils.getAppiumPort()+"/dashboard");
            // Open the dashboard URL in the default web browser



        } catch (Exception e) {
            utils.log().error("Failed While Starting Appium Server");
        }
    }

    public void stopAppium() {
        try {
            Runtime rt = Runtime.getRuntime();
            //Process proc = rt.exec("appium --address 127.0.0.1 --port 4723");
            Process proc = rt.exec("pkill -f appium");
            proc.waitFor();
            utils.log().debug("Stopped Appium Server");

        } catch (Exception e) {
            utils.log().error("Failed While Stopping Appium Server");
        }
    }

    private void waitForServer(int maxTry, String url) throws InterruptedException {
        int attempts = 0;
        int maxAttempts = maxTry; // Maximum number of attempts
        int waitTime = 1000; // Wait time between attempts in milliseconds

        while (attempts < maxAttempts) {
            try {
                HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
                connection.setRequestMethod("GET");
                connection.connect();
                int responseCode = connection.getResponseCode();
                if (responseCode == 200) {
                    System.out.println("Appium server is up and running!");
                    return;
                }
            } catch (IOException e) {
                // Server is not up yet
            }
            System.out.println("Waiting for Appium server... "+attempts);
            Thread.sleep(waitTime);
            attempts++;
        }
        utils.log().debug("Waited "+ attempts+ " seconds for appium server to start.");
        //throw new RuntimeException("Appium server did not start within the expected time.");
    }

    private String getLocalIpAddress() {
        try {
            InetAddress localHost = InetAddress.getLocalHost();
            return localHost.getHostAddress();
        } catch (UnknownHostException e) {
            e.printStackTrace();
            return "127.0.0.1"; // Fallback to localhost in case of an error
        }
    }

private void openBrowser(String url) {
        if (Desktop.isDesktopSupported()) {
            try {
                Desktop desktop = Desktop.getDesktop();
                desktop.browse(new URI(url));
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.err.println("Desktop is not supported on this platform");
        }
    }

```

### Read java parameter from console
```
String env = Optional.ofNullable(System.getProperty("environment")).orElse("test");
Optional<String> appVersion = Optional.ofNullable(System.getProperty("appVersion"));
```


### codesign repeatedly asks for access to System Keychain or Codesign wants to access key "access" in your keychain, I put in my login password but keeps asking me

**Solution**: For me the issue that the certificate was installed under "system", rather than "login". All I had to do was remove it from system, then open "login" and drag the certificate into Keychain.


### No such command issue: https://docs.digital.ai/bundle/TDB/page/seetestautomation_-_generate_device_enablement_file_def_using_xdef.html

When you're in the folder containing the executable, you need to explicitly tell the shell to run the command from the current directory. By default, the shell doesn’t search in the current directory for executables.

This example will use the command 'teams' without the account parameters:
Try running it like this:```./xdef teams```
The user is required to insert Apple ID and password.

Note: after 10 failures in logging in, your developer account will be locked. Go to https://developer.apple.com/ in order to re-open it.  

The devices file is a text file, containing udids and names.
Create a text file like this, it can have multiple phones...


```00008030-001A20AE36F9402E,ios_app:OKAUTO_iPhone_SE_12```


Details:
SeeTestAutomation - Generate Device Enablement File (DEF) Using XDEF
The motivation of this tool is to enable distribution of apple provisioning profile, without sharing your apple developer account username and password.

XDef CLI Utility helps you to generate a Device Enablement file (.DEF) using your own iOS Developer profile account credentials.

Device Enablement Files will contain your developer certificate and mobile provision file and they will allow you to work with your iOS device and install applications on the device.
Prerequisites
Installed SeeTestAutomation or Appium Studio (version10.3 and above).
To be assigned to valid Apple Developer Account.
Commands Description


**help**	none	Prints help messages to the console
**version**	none	Prints the product version
**teams**	Prints the developer teams list for Apple ID
[-appleId <appleId>]	Apple Id of the account
[-password <password>]	Password of the Apple Id
[-json]	Prints the data in JSON format
[-v]	Verbose (print log to console)



**def** 	Creating def file from developer team
[-appleId <appleId>]	Apple Id of the account
[-password <password>]	Password of the Apple Id
[-teamId <teamId>]	Team Id of the account (obtained from teams command)
-devicesPath <devicesPath>	Path to details of devices to be added to profile (the format is udid,deviceName)
-p12Pwd <p12Pwd>  	Password for saving the p12 file / reloading it
[-v]	Verbose (print log to console)

**log** 	Path to log file
[-v]	Verbose (print log to console)

This example will use the 'def' command  the account parameters and the team ID:
1. The devices file is a text file, containing udids and names. Example:

   Create a text file like this, it can have multiple phones...
```00008030-001A20AE36F9402E,ios_app:OKAUTO_iPhone_SE_12```
The tool will cross this device list with the devices that are already on account. Only new devices will be added to the account.
The generated profile will contain all the devices that were on the account and the new ones.

```./xdef def -appleId abc@gmail.com -password <App Specific password> -teamId NX6RR6GSKK -devicesPath /Users/jenkins/devicefile.txt -p12Pwd miP4cvma```

The def command will generate a .p12 file on your computer. The .p12 file is a new development certificate on your apple account. The file can be located on \xdef\apple-accounts\<Apple ID>\<team ID\keys

The def file is located on \xdef\apple-accounts\<Apple ID>\<team ID\def


Note: This will create a wild card app id in apple dev account
Experitest WildCard = * (wildcard)





### launchAppWithArgs
```public void launchAppWithArgs() {
        StopWatch stopwatch = new StopWatch();
        stopwatch.start();

        try {
            // Check the platform name (iOS or Android)
            String platformName = getDriver().getCapabilities().getCapability("platformName").toString();

            if ("iOS".equalsIgnoreCase(platformName) && !(getEnvironment().equals("prod"))  ) {
                // Get app information
                String appPath = getDriver().getCapabilities().getCapability("app").toString();
                // iOS specific steps
                String bundleId = getDriver().getCapabilities().getCapability("bundleId").toString();
                String[] arguments = {"--qamode"};

                Map<String, Object> args = new HashMap<>();
                args.put("bundleId", bundleId);
                args.put("app", appPath);
                args.put("arguments", arguments);
                getDriver().executeScript("mobile: removeApp", args);
                getDriver().executeScript("mobile: installApp", args);
                getDriver().executeScript("mobile: launchApp", args);
            }
            else if ("iOS".equalsIgnoreCase(platformName) && (getEnvironment().equals("prod"))  ) {
                String bundleId = getDriver().getCapabilities().getCapability("bundleId").toString();
                Map<String, Object> args = new HashMap<>();
                args.put("bundleId", bundleId);
                getDriver().executeScript("mobile: launchApp", args);
            }

            else if ("Android".equalsIgnoreCase(platformName)) {
            	
            } else {
                // Handle other platforms (if needed)
                // For unsupported platforms
                throw new UnsupportedOperationException("Unsupported platform: " + platformName);
            }
        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail("Exception occurred while launching the app");
        }

        stopwatch.stop(); // Optional
        long timeElapsed = stopwatch.getTime(TimeUnit.SECONDS);
        utils.logInfo(String.format("########################################### Total Execution time to removeApp, installApp, and launchApp in seconds: %d", timeElapsed));
    }
```



