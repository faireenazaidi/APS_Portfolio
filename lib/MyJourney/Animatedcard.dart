import 'package:flutter/material.dart';
import '../Widgets/Colors.dart';

class AnimatedCard extends StatefulWidget {
  final Widget child;
  final int delay;

  const AnimatedCard({super.key, required this.child, this.delay = 0});

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _hoverController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-0.3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _hoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: MouseRegion(
            onEnter: (_) => _hoverController.forward(),
            onExit: (_) => _hoverController.reverse(),
            child: AnimatedBuilder(
              animation: _hoverController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, -10 * _hoverController.value),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      color: AppColors.veryDarkGray,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color.lerp(
                          AppColors.primaryGold.withOpacity(0.1),
                          AppColors.primaryGold,
                          _hoverController.value,
                        )!,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryGold
                              .withOpacity(0.1 + 0.2 * _hoverController.value),
                          blurRadius: 20 + 40 * _hoverController.value,
                        ),
                      ],
                    ),
                    child: widget.child,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
