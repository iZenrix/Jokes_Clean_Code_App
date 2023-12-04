import 'package:flutter/material.dart';

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,
    padding: const EdgeInsets.symmetric(
        horizontal: 16, vertical: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    disabledBackgroundColor:
    const Color(0xff5C5C5C).withAlpha(100),
    backgroundColor:
    const Color.fromARGB(255, 59, 60, 128),
  ),
);