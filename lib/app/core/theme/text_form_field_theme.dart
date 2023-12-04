import 'package:flutter/material.dart';

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  contentPadding: const EdgeInsets.all(20),
  enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(15)),
  focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(15)),
  labelStyle: const TextStyle(color: Colors.white),
  hintStyle: TextStyle(
    color: Colors.white.withOpacity(.5),
  ),
  filled: true,
  fillColor: const Color(0xff534F84),
);
