import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:quick_attendance/utils/utils.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String location = 'Null, Press Button';

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
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
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classroom'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            width: screenSize.width * 1.0,
            decoration: BoxDecoration(border: Border.all(width: 2.0)),
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        child: const Text(
                          'New question: Are you present in the OS Class?',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  // Text(
                  //   location,
                  //   style: const TextStyle(color: Colors.black, fontSize: 16),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        Position position = await _determinePosition();
                        location =
                            'Lat: ${position.latitude} , Long: ${position.longitude}';
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Center(
                                child: Text(
                                  location,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              );
                            });
                      },
                      child: const Text('Mark Present'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
