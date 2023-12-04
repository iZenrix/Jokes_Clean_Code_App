import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jokes_app/joke_app.dart';

void main() async {
  await GetStorage.init();
  runApp(
    const JokeApp()
  );
}
