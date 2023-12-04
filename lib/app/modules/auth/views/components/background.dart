import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:jokes_app/app/core/value/assets_path.dart';

Widget bgTop(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Image.asset(
      AssetPath.backgroundAuth,
      fit: BoxFit.cover,
    ),
  );
}

Widget bgBottom(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationZ(math.pi),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          AssetPath.backgroundAuth,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
