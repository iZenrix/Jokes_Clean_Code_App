import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jokes_app/joke_app.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  runApp(const JokeApp());
}
