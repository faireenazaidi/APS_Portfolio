import 'package:flutter/material.dart';
import '../Colors.dart';

class HoverNavButton extends StatefulWidget {
  final String text;

  const HoverNavButton({super.key, required this.text});

  @override
  State<HoverNavButton> createState() => HoverNavButtonState();
}

class HoverNavButtonState extends State<HoverNavButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, -2 * _animation.value),
            child: Stack(
              children: [
                Text(
                  widget.text,
                  style: TextStyle(
                    color: Color.lerp(
                      Colors.white,
                       AppColors.primaryGold,
                      _animation.value,
                    ),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Positioned(
                  bottom: -5,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 2,
                    width: 100 * _animation.value,
                    decoration: BoxDecoration(
                      color:  AppColors.primaryGold,
                      boxShadow: [
                        BoxShadow(
                          color:  AppColors.primaryGold
                              .withOpacity(0.5 * _animation.value),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}