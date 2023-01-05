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



Step 7
// Re Run the Project



Step 8
// Create a View and declare following variables
add this required things

  double? lat;

  double? long;

  String address = "";



Step 9
// Add following function to grant access and determines current position of the user.

Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }




Step 10
// Add following function to get lat, long and current address of user
  getLatLong() {
    Future<Position> data = _determinePosition();
    data.then((value) {
      print("value $value");
      setState(() {
        lat = value.latitude;
        long = value.longitude;
      });

      getAddress(value.latitude, value.longitude);
    }).catchError((error) {
      print("Error $error");
    });
  }



Step 11
// Add following function based on Geocoding Package. This function is used to convert lat and long into Address.
  getAddress(lat, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    setState(() {
      address = placemarks[0].street! + " " + placemarks[0].country!;
    });

    for (int i = 0; i < placemarks.length; i++) {
      print("INDEX $i ${placemarks[i]}");
    }
  }




Step 12
// ADD UI Code
Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D39F2),
        centerTitle: true,
        title: const Text("Get Location"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Lat : $lat"),
            Text("Long : $long"),
            Text("Address : $address "),
            ElevatedButton(
              onPressed: getLatLong,
              child: const Text("Get Location"),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF0D39F2),
              ),
            ),
          ],
        ),
      ),
    );




