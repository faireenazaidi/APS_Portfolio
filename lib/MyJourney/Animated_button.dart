import 'package:flutter/material.dart';
import '../Colors.dart';
import '../MyTextTheme.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final bool isPrimary;

  const AnimatedButton({super.key, required this.text, required this.isPrimary});

  @override
  State<AnimatedButton> createState() => AnimatedButtonState();
}

class AnimatedButtonState extends State<AnimatedButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
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
      child: GestureDetector(
        onTap: () {},
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -5 * _controller.value),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 18),
                decoration: BoxDecoration(
                  gradient: widget.isPrimary ?  LinearGradient(
                    colors: [AppColors.primaryGold,AppColors.warmGolden],

                  ) : null,
                  color: widget.isPrimary ? null : Colors.transparent,
                  borderRadius: BorderRadius.circular(50),

                  border: widget.isPrimary ? null : Border.all(color: AppColors.primaryGold, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryGold.withOpacity(widget.isPrimary ? 0.4 : 0.2)
                          .withOpacity((widget.isPrimary ? 0.4 : 0.2) + 0.2 * _controller.value),
                       blurRadius: 40 + 20 * _controller.value,
                    ),
                  ],
                ),
                child: Text(widget.text,
                  style: MyTextTheme.dynamicPrimaryGold(
                  isPrimary: widget.isPrimary,
                  controllerValue: _controller.value,
                ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
