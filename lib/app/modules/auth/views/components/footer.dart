import 'package:flutter/material.dart';
import 'package:jokes_app/app/core/value/color.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.text,
    required this.textButton,
    this.onPressed,
  });

  final String text;
  final String textButton;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(textButton, style: TextStyle(color: CustomColor.primary),),
        )
      ],
    );
  }
}
