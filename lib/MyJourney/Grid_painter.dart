import 'package:flutter/material.dart';
import '../Widgets/Colors.dart';

class GridPainter extends CustomPainter {
  final double progress;

  GridPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primaryGold.withOpacity(0.03)
      ..strokeWidth = 1;

    final offset = progress * 50;

    for (double i = -50; i < size.width + 50; i += 50) {
      canvas.drawLine(
        Offset(i + offset, 0),
        Offset(i + offset, size.height),
        paint,
      );
    }

    for (double i = -50; i < size.height + 50; i += 50) {
      canvas.drawLine(
        Offset(0, i + offset),
        Offset(size.width, i + offset),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(GridPainter oldDelegate) => true;
}