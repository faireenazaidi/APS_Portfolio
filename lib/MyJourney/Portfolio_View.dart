import 'package:flutter/material.dart';
import 'package:portfolio/MyJourney/project_sec.dart';
import 'package:portfolio/MyJourney/skill_sec.dart';
import 'Animated_bg.dart';
import 'AppBar_Section.dart';
import 'Contact_item.dart';
import 'Education_sec.dart';
import 'Experience_Sec.dart';
import 'Footer_sec.dart' hide AnimatedBackground;
import 'Hero_sec.dart';

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> with TickerProviderStateMixin {
  late AnimationController _particleController;
  late AnimationController _orbController;
  late AnimationController _glowController;
  late AnimationController _gridController;

  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _particleController = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    )..repeat();

    _orbController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _glowController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _gridController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _particleController.dispose();
    _orbController.dispose();
    _glowController.dispose();
    _gridController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBackground(
              particleController: _particleController,
              orbController: _orbController,
              gridController: _gridController,
            ),
          ),

          SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                HeaderBar(
                  glowController: _glowController,
                  onAboutTap: () => _scrollToSection(_aboutKey),
                  onExperienceTap: () => _scrollToSection(_experienceKey),
                  onSkillsTap: () => _scrollToSection(_skillsKey),
                  onProjectsTap: () => _scrollToSection(_projectsKey),
                  onEducationTap: () => _scrollToSection(_educationKey),
                  onContactTap: () => _scrollToSection(_contactKey),
                ),

                Container(
                  key: _aboutKey,
                  child: HeroSection(
                    glowController: _glowController,
                    onProjectsTap: () => _scrollToSection(_projectsKey),
                    onExperienceTap: () => _scrollToSection(_experienceKey),
                  ),
                ),

                Container(
                  key: _experienceKey,
                  child: const ExperienceSection(),
                ),

                Container(
                  key: _skillsKey,
                  child: const SkillsSection(),
                ),

                Container(
                  key: _projectsKey,
                  child: const ProjectsSection(),
                ),

                Container(
                  key: _educationKey,
                  child: const EducationSection(),
                ),

                Container(
                  key: _contactKey,
                  child: const ContactSection(),
                ),

                const FooterSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
