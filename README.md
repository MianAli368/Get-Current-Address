# This project will get long and lat of current position of user and convert it into current address. User don't need to enter the address manually. Address will be calculated automatically after pressing the button.



Step 1
// Add Package
geolocator: ^9.0.2


// Import it
import 'package:geolocator/geolocator.dart';

Step 2
// Add Package
geocoding: ^2.0.5



// Import it
import 'package:geocoding/geocoding.dart';


Step 3
// Android Settings
// Check gradle.properties for below two lines if they are available or not for Geolocator. If not available then add them
android.useAndroidX=true
android.enableJetifier=true


Step 4
// Set Compile sdk version to 31 in build.gradle of app
android {
  compileSdkVersion 33

  ...
}


Step 5
// Add following permissions in Android.Manifest file before <application /> tag
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />


Step 6
// IOS Settings
// Go to IOS>Runner>Info.plist
// Add following lines in Info.plist file after "<string>Main</string>" line
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app needs access to location when open.</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>This app needs access to location when in the background.</string>


