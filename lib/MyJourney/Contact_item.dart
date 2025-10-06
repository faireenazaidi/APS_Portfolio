import 'package:flutter/material.dart';

import '../Colors.dart';

class ContactItem extends StatefulWidget {
  final String icon;
  final String text;

  const ContactItem({super.key, required this.icon, required this.text});

  @override
  State<ContactItem> createState() => ContactItemState();
}

class ContactItemState extends State<ContactItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _glowAnimation = Tween<double>(begin: 0.1, end: 0.2).animate(_controller);
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
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Transform.translate(
              offset: Offset(0, -3 * _controller.value),
              child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: Color.lerp(
                     AppColors.primaryGold.withOpacity(0.1),
                     AppColors.primaryGold.withOpacity(0.2),
                    _controller.value,
                  ),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Color.lerp(
                       AppColors.primaryGold.withOpacity(0.3),
                       AppColors.primaryGold,
                      _controller.value,
                    )!,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color:  AppColors.primaryGold.withOpacity(0.1 + 0.2 * _controller.value),
                      blurRadius: 10 + 20 * _controller.value,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(widget.icon, style: const TextStyle(fontSize: 20)),
                    const SizedBox(width: 8),
                    Text(widget.text, style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}