import 'package:flutter/material.dart';
import '../Widgets/Colors.dart';

class HoverLink extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const HoverLink({super.key, required this.text, required this.onTap});

  @override
  State<HoverLink> createState() => _HoverLinkState();
}

class _HoverLinkState extends State<HoverLink>
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
              offset: Offset(5 * _controller.value, 0),
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color.lerp(
                    AppColors.primaryGold,
                    AppColors.lightGold,
                    _controller.value,
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