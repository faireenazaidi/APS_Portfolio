import 'package:flutter/material.dart';
import '../Widgets/Colors.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final bool isPrimary;
  final VoidCallback? onTap;
  final bool fullWidth;

  const AnimatedButton({
    super.key,
    required this.text,
    required this.isPrimary,
    this.onTap,
    this.fullWidth = false,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
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
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -5 * _controller.value),
              child: Container(
                width: widget.fullWidth ? double.infinity : null,
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 18),
                decoration: BoxDecoration(
                  gradient: widget.isPrimary
                      ? const LinearGradient(
                    colors: [AppColors.primaryGold, AppColors.darkGold],
                  )
                      : null,
                  color: widget.isPrimary ? null : Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                  border: widget.isPrimary
                      ? null
                      : Border.all(
                    color: Color.lerp(
                      AppColors.primaryGold,
                      AppColors.backgroundDark,
                      _controller.value * 0.3,
                    )!,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryGold
                          .withOpacity((widget.isPrimary ? 0.4 : 0.2) +
                          0.2 * _controller.value),
                      blurRadius: 40 + 20 * _controller.value,
                    ),
                  ],
                ),
                child: Text(widget.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: widget.isPrimary ? AppColors.backgroundDark : Color.lerp(
                      AppColors.primaryGold,
                      AppColors.backgroundDark,
                      _controller.value,),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
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


