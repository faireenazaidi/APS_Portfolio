import 'package:flutter/material.dart';
import '../Colors.dart';
import 'Hover_button.dart';

class HeaderBar extends StatefulWidget{
  final AnimationController glowController;
  const HeaderBar({super.key, required this.glowController});
  @override
  State<HeaderBar> createState()=> _HeaderBarState();

}
class _HeaderBarState extends State<HeaderBar> with TickerProviderStateMixin{
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  @override

  void initState() {
    super.initState();
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOut,
    ));

    _slideController.forward();
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      return const SizedBox.shrink();
    }

    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.backgroundDark.withOpacity(0.8),
          border: Border(
            bottom: BorderSide(
              color: AppColors.primaryGold.withOpacity(0.1),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedBuilder(
              animation: widget.glowController,
              builder: (context, child) {
                return ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      colors: [AppColors.primaryGold, AppColors.secondaryGold],
                    ).createShader(bounds);
                  },
                  child: Text('APS',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: AppColors.primaryGold.withOpacity(
                            0.3 + widget.glowController.value * 0.5,
                          ),
                          blurRadius: 5 + widget.glowController.value * 15,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Wrap(
              spacing: 20,
              children: [
                _NavButton('About'),
                _NavButton('Experience'),
                _NavButton('Skills'),
                _NavButton('Projects'),
                _NavButton('Education'),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _NavButton(String text) {
    return HoverNavButton(text: text);
  }

}

