import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _heading = 0;

  @override
  void initState() {
    super.initState();
    _initCompass();
  }

  void _initCompass() {
    FlutterCompass.events?.listen((CompassEvent event) {
      setState(() {
        _heading = event.heading ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 236, 180),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 246, 218),
        title: Text(
          'Compass Hero',
          style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 200, 95, 95),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Transform.rotate(
          angle: ((_heading ?? 0) * (3.1415927 / 180) * -1),
          child: Container(
              padding: const EdgeInsets.all(10),
              child: Image.asset('assets/images/compass.png')),
        ),
      ),
    );
  }
}
