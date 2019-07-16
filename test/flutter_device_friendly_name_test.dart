import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_device_friendly_name/flutter_device_friendly_name.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_device_friendly_name');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterDeviceFriendlyName.platformVersion, '42');
  });
}
