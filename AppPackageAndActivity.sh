#! /bin/bash
echo "Find appPackage and appActivity name of your App"
echo "Open app and navigate to desired screen on android phone"
echo "First execute - adb shell"
echo "Then execute - dumpsys window windows | grep -E 'mCurrentFocus'"
echo "appPackage starts with com. and ends before backshash (/). So from the above image, appPackage name is – com.android.vending

appActivity starts after the backslash (/) and goes till the end. From the above image, appActivity name is – com.google.android.finsky.activities.MainActivity"
