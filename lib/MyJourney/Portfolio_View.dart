import 'package:flutter/material.dart';
import 'package:portfolio/MyJourney/project_sec.dart';
import 'package:portfolio/MyJourney/skill_sec.dart';
import 'Animated_bg.dart';
import 'AppBar_Section.dart';
import 'Education_sec.dart';
import 'Experience_Sec.dart';
import 'Footer_sec.dart';
import 'Hero_sec.dart';

class MyJourneyHomePage extends StatefulWidget{
  const MyJourneyHomePage({super.key});

  @override
  State<MyJourneyHomePage> createState() => _MyJourneyHomePageState();

}
class _MyJourneyHomePageState extends State<MyJourneyHomePage> with TickerProviderStateMixin{
  late AnimationController _particleController;
  late AnimationController _orbController;
  late AnimationController _glowController;
  late AnimationController _gridController;

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
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  Stack(
          children: [
            Positioned.fill(
              child: AnimatedBackground(
                particleController: _particleController,
                orbController: _orbController,
                gridController: _gridController,
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  HeaderBar(glowController: _glowController,),
                  HeroSection(glowController: _glowController),
                  ExperienceSection(),
                  SkillsSection(),
                  ProjectsSection(),
                  EducationSection(),
                  FooterSection(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
