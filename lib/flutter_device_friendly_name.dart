import 'dart:async';

import 'package:flutter/services.dart';

class FlutterDeviceFriendlyName {
  static const MethodChannel _channel =
      const MethodChannel('flutter_device_friendly_name');

  static Future<String> get friendlyName async {
    final String version = await _channel.invokeMethod('getDeviceFriendlyName');
    return version;
  }
}
