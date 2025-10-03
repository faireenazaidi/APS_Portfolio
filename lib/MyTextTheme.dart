import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle glowingTitle({
    required double glowValue,
    double fontSize = 32,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      shadows: [
        Shadow(
          color: const Color(0xFFFBBF24).withOpacity(0.3 + glowValue * 0.5),
          blurRadius: 5 + glowValue * 15,
        ),
      ],
    );
  }
}
