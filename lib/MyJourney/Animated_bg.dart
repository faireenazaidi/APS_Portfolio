import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../Colors.dart';
import 'Grid_painter.dart';

class AnimatedBackground extends StatelessWidget {
  final AnimationController particleController;
  final AnimationController orbController;
  final AnimationController gridController;

  const AnimatedBackground({
    super.key,
    required this.particleController,
    required this.orbController,
    required this.gridController,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: gridController,
          builder: (context, child) {
            return CustomPaint(
              painter: GridPainter(gridController.value),
              child: Container(),
            );
          },
        ),

        ...List.generate(9, (index) {
          return AnimatedBuilder(
            animation: particleController,
            builder: (context, child) {
              final progress = (particleController.value + (index * 0.1)) % 1.0;
              final curvedProgress = Curves.easeInOut.transform(progress);

              return Positioned(
                left: MediaQuery.of(context).size.width * ((index + 1) / 10),
                bottom: -20 + (curvedProgress * (MediaQuery.of(context).size.height + 120)),
                child: Opacity(
                  opacity: curvedProgress < 0.1 ? curvedProgress * 10 : (curvedProgress > 0.9 ? (1 - curvedProgress) * 10 : 1),
                  child: Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.primaryGold.withOpacity(0.3),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryGold.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }),

        AnimatedBuilder(
          animation: orbController,
          builder: (context, child) {
            final angle = orbController.value * 2 * math.pi;
            return Stack(
              children: [
                Positioned(
                  top: -200 + math.sin(angle) * 100,
                  left: -200 + math.cos(angle) * 100,
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          AppColors.primaryGold.withOpacity(0.4),
                          AppColors.primaryGold.withOpacity(0.2),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -150 + math.cos(angle) * 100,
                  right: -150 + math.sin(angle) * 100,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          AppColors.warmGolden.withOpacity(0.4),
                          AppColors.warmGolden.withOpacity(0.2),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
