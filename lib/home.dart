import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Home extends StatelessWidget {
  Home({super.key});

  Location lctn = Location();
  LocationData? locdata;

  Future<LocationData?> getLoct() async {
    locdata = await lctn.getLocation();
    return locdata;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Map"),
      ),
      body: FutureBuilder(
          future: getLoct(),
          builder: (context, Snapshot) {
            if (Snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return GoogleMap(
              initialCameraPosition: CameraPosition(
                  zoom: 15,
                  target: LatLng(
                      Snapshot.data!.latitude!, Snapshot.data!.longitude!)),
              mapToolbarEnabled: true,
              mapType: MapType.hybrid,
              compassEnabled: true,
              trafficEnabled: true,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
            );
          }),
    );
  }
}
// import the Google Map package frome pub.dev " flutter pub add google_maps_flutter"
//and chage the dependency from the build gradele

//android {
//     defaultConfig {
//         minSdkVersion 20
//     }
// }


// <manifest ...
// <application ...
// <meta-data android:name="com.google.android.geo.API_KEY"
// android:value="YOUR KEY HERE"/>

// after adding  the depndency serch  Cloud console in crome and go to teh
