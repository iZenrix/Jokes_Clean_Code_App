import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.text, this.color = Colors.white,});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Title(
      color: color,
      title: text.capitalizeFirst!,
      child: Text(
        text.capitalizeFirst!,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      ),
    );
  }
}
