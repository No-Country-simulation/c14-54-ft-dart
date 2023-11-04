import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

class DevicePreviewHelper {
  static Widget buildWithDevicePreview(
      {required Widget myApp, bool enabled = true}) {
    return DevicePreview(
      enabled: enabled,
      builder: (context) => myApp,
    );
  }
}
