import 'package:flutter/material.dart';
import 'package:portfolio/Widgets/MyTextTheme.dart';
import '../Widgets/Colors.dart';

class AnimatedBulletPoint extends StatefulWidget {
  final String text;

  const AnimatedBulletPoint({super.key, required this.text});

  @override
  State<AnimatedBulletPoint> createState() => _AnimatedBulletPointState();
}

class _AnimatedBulletPointState extends State<AnimatedBulletPoint>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedBuilder(
            animation: _pulseAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _pulseAnimation.value,
                child: const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text('⚡', style: TextStyle(fontSize: 20),),
                ),
              );
            },
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(widget.text, style:  MyTextTheme.mediumGrayS),
          ),
        ],
      ),
    );
  }
}
