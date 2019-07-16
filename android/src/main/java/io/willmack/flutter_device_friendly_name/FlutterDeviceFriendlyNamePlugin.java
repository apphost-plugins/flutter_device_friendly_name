package io.willmack.flutter_device_friendly_name;

import android.provider.Settings;
import android.content.Context;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterDeviceFriendlyNamePlugin */
public class FlutterDeviceFriendlyNamePlugin implements MethodCallHandler {
  private final Context context;

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_device_friendly_name");
    channel.setMethodCallHandler(new FlutterDeviceFriendlyNamePlugin(registrar.context()));
  }

  /** (From device_info) Do not allow direct instantiation. */
  private FlutterDeviceFriendlyNamePlugin(Context context) {
    this.context = context;
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getDeviceFriendlyName")) {
      if (android.os.Build.VERSION.SDK_INT < 17) {
        return;
      }
      String friendlyName = Settings.Secure.getString(context.getContentResolver(), "bluetooth_name");
      if ((friendlyName == null) || friendlyName.isEmpty()) {
        friendlyName = Settings.Global.getString(context.getContentResolver(), "device_name");
      }
      result.success(friendlyName);
    } else {
      result.notImplemented();
    }
  }
}
