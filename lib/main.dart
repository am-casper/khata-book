import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khata_book/data/services/local/local_storage_service.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:khata_book/presentation/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await LocalStorageService.init();
  runApp(const KhataBookApp());
}
