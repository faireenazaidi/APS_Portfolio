import 'package:flutter/material.dart';
import '../Widgets/Colors.dart';

class NavButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const NavButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton>
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
              offset: Offset(0, -2 * _controller.value),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.text,
                    style: TextStyle(
                      color: Color.lerp(
                        AppColors.textWhite,
                        AppColors.primaryGold,
                        _controller.value,
                      ),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 2,
                    width: 60 * _controller.value,
                    decoration: BoxDecoration(
                      color: AppColors.primaryGold,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryGold
                              .withOpacity(0.5 * _controller.value),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}