#import "FlutterDeviceFriendlyNamePlugin.h"

@implementation FlutterDeviceFriendlyNamePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_device_friendly_name"
            binaryMessenger:[registrar messenger]];
  FlutterDeviceFriendlyNamePlugin* instance = [[FlutterDeviceFriendlyNamePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getDeviceFriendlyName" isEqualToString:call.method]) {
    result([[UIDevice currentDevice] name]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
