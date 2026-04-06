import 'package:bookia_store/app.dart';
import 'package:bookia_store/core/local/shared_pref.dart';
import 'package:bookia_store/core/service/Apis/dio_provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioProvider.init();

  await SharedPref.init();

  runApp(
    DevicePreview(enabled: !kDebugMode, builder: (context) => const MainApp()),
  );
}
