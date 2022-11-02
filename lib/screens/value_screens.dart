import 'package:flutter/material.dart';

class ValueScreen extends StatelessWidget {
  final String latitude;
  final String longtitude;
  const ValueScreen(
      {super.key, required this.latitude, required this.longtitude});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        const Text("latitude"),
        Text(latitude),
        const Text("longtitude"),
        Text(longtitude),
      ]),
    );
  }
}
