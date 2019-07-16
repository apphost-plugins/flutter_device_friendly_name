import 'package:flutter/material.dart';
import 'package:flutter_device_friendly_name/flutter_device_friendly_name.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _friendlyName = 'Loading...';

  @override
  void initState() {
    super.initState();
    FlutterDeviceFriendlyName.friendlyName.then((x) {
      setState(() {
        _friendlyName = x; 
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Device name: $_friendlyName\n'),
        ),
      ),
    );
  }
}
