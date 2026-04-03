
import 'package:bookia_store/app.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //DioProvider.init();
  runApp(
    DevicePreview(enabled: !kDebugMode, builder: (context) => const MainApp()),
  );
}