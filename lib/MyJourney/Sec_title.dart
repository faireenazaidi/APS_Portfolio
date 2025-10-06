import 'package:flutter/material.dart';
import 'package:portfolio/MyTextTheme.dart';
import '../Colors.dart';

class SectionTitle extends StatefulWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  State<SectionTitle> createState() => _SectionTitleState();
}

class _SectionTitleState extends State<SectionTitle> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _lineAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _lineAnimation = Tween<double>(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Column(
          children: [
            ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                  colors: [Colors.white, AppColors.primaryGold],
                ).createShader(bounds);
              },
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: MyTextTheme.normalWB
              ),
            ),
            const SizedBox(height: 16),
            AnimatedBuilder(
              animation: _lineAnimation,
              builder: (context, child) {
                return Container(
                  width: _lineAnimation.value,
                  height: 4,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.transparent,
                        AppColors.primaryGold,
                        Colors.transparent
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color:  AppColors.primaryGold.withOpacity(0.5),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}