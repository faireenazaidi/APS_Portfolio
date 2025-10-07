import 'package:flutter/material.dart';
import 'package:portfolio/Widgets/MyTextTheme.dart';
import '../Widgets/Colors.dart';
import 'Hover_button.dart';
import 'Nav_Button.dart';

class HeaderBar extends StatefulWidget {
  final AnimationController glowController;
  final VoidCallback onAboutTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onEducationTap;
  final VoidCallback onContactTap;

  const HeaderBar({
    super.key,
    required this.glowController,
    required this.onAboutTap,
    required this.onExperienceTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onEducationTap,
    required this.onContactTap,
  });

  @override
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {
  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.backgroundDark.withOpacity(0.8),
        border: Border(
          bottom: BorderSide(
            color: AppColors.primaryGold.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: isSmallScreen
          ? Column(
        children: [
          _buildLogo(),
          const SizedBox(height: 20),
          _buildMobileNav(),
        ],
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLogo(),
          _buildDesktopNav(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return AnimatedBuilder(
      animation: widget.glowController,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [AppColors.primaryGold, AppColors.lightGold],
            ).createShader(bounds);
          },
          child: Text('APS',
            style: MyTextTheme.largeWB.copyWith(
              shadows: [
                Shadow(
                  color: AppColors.primaryGold.withOpacity(
                    0.5 + widget.glowController.value * 0.5,
                  ),
                  blurRadius: 5 + widget.glowController.value * 15,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDesktopNav() {
    return Row(
      children: [
        NavButton(text: 'About', onTap: widget.onAboutTap),
        const SizedBox(width: 40),
        NavButton(text: 'Experience', onTap: widget.onExperienceTap),
        const SizedBox(width: 40),
        NavButton(text: 'Skills', onTap: widget.onSkillsTap),
        const SizedBox(width: 40),
        NavButton(text: 'Projects', onTap: widget.onProjectsTap),
        const SizedBox(width: 40),
        NavButton(text: 'Education', onTap: widget.onEducationTap),
        const SizedBox(width: 40),
        NavButton(text: 'Contact', onTap: widget.onContactTap),
      ],
    );
  }

  Widget _buildMobileNav() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: [
        NavButton(text: 'About', onTap: widget.onAboutTap),
        NavButton(text: 'Experience', onTap: widget.onExperienceTap),
        NavButton(text: 'Skills', onTap: widget.onSkillsTap),
        NavButton(text: 'Projects', onTap: widget.onProjectsTap),
        NavButton(text: 'Education', onTap: widget.onEducationTap),
        NavButton(text: 'Contact', onTap: widget.onContactTap),
      ],
    );
  }
}

