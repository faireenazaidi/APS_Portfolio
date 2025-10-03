import 'package:flutter/material.dart';

class AppBarSection extends StatefulWidget {
  final AnimationController glowController;

  const AppBarSection({required this.glowController});

  @override
  State<AppBarSection> createState() => AppBarSectionState();
}

class AppBarSectionState extends State<AppBarSection> with SingleTickerProviderStateMixin {
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
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF0A0A0A).withOpacity(0.8),
          border: Border(
            bottom: BorderSide(
              color: const Color(0xFFFBBF24).withOpacity(0.1),
            ),
          ),
        ),
        child: Row(
          children: [
            AnimatedBuilder(
              animation: widget.glowController,
              builder: (context, child) {
                return ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      colors: [Color(0xFFFBBF24), Color(0xFFFDE047)],
                    ).createShader(bounds);
                  },
                  child: Text(
                    'APS',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: const Color(0xFFFBBF24).withOpacity(
                              0.3 + widget.glowController.value * 0.5),
                          blurRadius: 5 + widget.glowController.value * 15,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            // Wrap(
            //   spacing: 20,
            //   children: [
            //     _NavButton('About'),
            //     _NavButton('Experience'),
            //     _NavButton('Skills'),
            //     _NavButton('Projects'),
            //     _NavButton('Education'),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  // Widget _NavButton(String text) {
  // return HoverNavButton(text: text);
  // }
}