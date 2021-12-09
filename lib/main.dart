import 'package:flutter/material.dart';
import 'dashboard.dart';

void main() {
  runApp(const GlassyWeatherApp());
}

class GlassyWeatherApp extends StatelessWidget {
  const GlassyWeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Schyler"),
      home: const Dashboard(),
    );
  }
}
