import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neumorphic_compass/style_guide.dart';
import 'package:compasstools/compasstools.dart';
import 'neumorphic_compass.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NeumorphicCompass(),
    );
  }
}

class NeumorphicCompass extends StatefulWidget {
  @override
  _NeumorphicCompassState createState() => _NeumorphicCompassState();
}

class _NeumorphicCompassState extends State<NeumorphicCompass> {
  int _haveSensor;
  String sensorType;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkDeviceSensors();
  }

  Future<void> checkDeviceSensors() async {
    int sensors;
    try {
      sensors = await Compasstools.checkSensors;
      switch (sensors) {
        case 0:
          sensorType = "No sensors found";
          break;
        case 1:
          sensorType = "Accelerometer + Magnetometer";
          break;
        case 2:
          sensorType = "Gyroscope";
          break;
        default:
          sensorType = "Error";
          break;
      }
    } on Exception {}
    if (!mounted) return;
    setState(() {
      _haveSensor = sensors;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        child: StreamBuilder(
          stream: Compasstools.azimuthStream,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasData) {
              return RotationTransition(
                turns: AlwaysStoppedAnimation(-snapshot.data / 360),
                child: compass,
              );
            } else
              return Text('Error');
          },
        ),
      ),
    );
  }
}
