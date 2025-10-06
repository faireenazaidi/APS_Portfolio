import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/MyTextTheme.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Colors.dart';
import 'Animated_button.dart';
import 'Contact_item.dart';

class HeroSection extends StatefulWidget {
  final AnimationController glowController;

  const HeroSection({super.key, required this.glowController});

  @override
  State<HeroSection> createState() => HeroSectionState();
}

class HeroSectionState extends State<HeroSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.7, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.7, curve: Curves.easeOut),
      ),
    );

    Future.delayed(const Duration(milliseconds: 300), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _downloadCV() async {
    final Uri url = Uri.parse(
      'https://raw.githubusercontent.com/faireenazaidi/portfolio/main/assets/cv/my_cv.pdf',
    );

    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        );
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      debugPrint('Error downloading CV: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Column(
            children: [
              AnimatedBuilder(
                animation: widget.glowController,
                builder: (context, child) {
                  return ShaderMask(
                    shaderCallback: (bounds) {
                      return  LinearGradient(
                        colors: [Colors.white, AppColors.primaryGold],
                      ).createShader(bounds);
                    },
                    child: Text(
                      'ANIMESH PRATAP SINGH',
                      textAlign: TextAlign.center,
                      style: MyTextTheme.veryLargeWB.copyWith(
                        shadows: [
                          Shadow(
                            color: AppColors.primaryGold.withOpacity(
                                0.5 + widget.glowController.value * 0.3),
                            blurRadius: 10 + widget.glowController.value * 20,
                          ),
                        ],
                      ),

                  ),
                  );
                },
              ),
              const SizedBox(height: 16),
              AnimatedBuilder(
                animation: widget.glowController,
                builder: (context, child) {
                  return Text('Android Developer | Java & Kotlin Expert',
                    style: MyTextTheme.mediumPrimaryGold.copyWith(
                      shadows: [
                        Shadow(
                          color:AppColors.primaryGold.withOpacity(0.3 + widget.glowController.value * 0.2),
                          blurRadius: 20,
                        ),
                      ],
                    )
                  );
                },
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 32,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: const [
                  ContactItem(icon: '📱', text: '9807039752'),
                  ContactItem(icon: '📧', text: 'Animesh.singh222@gmail.com'),
                  ContactItem(icon: '📍', text: 'Lucknow'),
                ],
              ),
              const SizedBox(height: 32),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text('Goal-oriented Android developer with 4+ years of experience building high-quality mobile applications.'
                      ' Specialized in clean architecture, modern Android development practices, and creating intuitive user experiences.',
                  textAlign: TextAlign.center,
                  style: MyTextTheme.normalMediumGray
                  ),
                ),

              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  AnimatedButton(text: 'View Projects', isPrimary: true),
                  SizedBox(width: 20),
                  InkWell(
                    onTap: (){
                    },
                      child: AnimatedButton(text: 'Download CV', isPrimary: false)
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
