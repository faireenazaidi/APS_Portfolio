import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'appbar.dart';

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({Key? key}) : super(key: key);

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> with TickerProviderStateMixin {
  // late AnimationController _particleController;
  // late AnimationController _orbController;
  late AnimationController _glowController;
  //late AnimationController _gridController;

  @override
  void initState() {
    super.initState();

    // _particleController = AnimationController(
    //   duration: const Duration(seconds: 15),
    //   vsync: this,
    // )..repeat();
    //
    // _orbController = AnimationController(
    //   duration: const Duration(seconds: 20),
    //   vsync: this,
    // )..repeat();

    _glowController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    // _gridController = AnimationController(
    //   duration: const Duration(seconds: 20),
    //   vsync: this,
    // )..repeat();
  }

  @override
  void dispose() {
    // _particleController.dispose();
    // _orbController.dispose();
     _glowController.dispose();
    // _gridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Positioned.fill(
            //   child: AnimatedBackground(
            //     particleController: _particleController,
            //     orbController: _orbController,
            //     gridController: _gridController,
            //   ),
            // ),

            // Content Layer
            SingleChildScrollView(
              physics:  BouncingScrollPhysics(),
              child: Column(
                children: [
                  AppBarSection(glowController: _glowController),
                  // _HeroSection(glowController: _glowController),
                  // ExperienceSection(),
                  // SkillsSection(),
                  // ProjectsSection(),
                  // EducationSection(),
                  // FooterSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
// class ExperienceSection extends StatelessWidget {
//   const ExperienceSection({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
//       child: Column(
//         children: [
//           SectionTitle(title: 'PROFESSIONAL EXPERIENCE'),
//           const SizedBox(height: 64),
//           AnimatedCard(
//             delay: 100,
//             child: const ExperienceCard(
//               title: 'Android Developer',
//               company: 'Criterion Tech Pvt Ltd, Lucknow | December 2020 - Present',
//               points: [
//                 'Involved in entire Software Development Life Cycle',
//                 'Monitor and optimize application performance',
//                 'Build apps with RESTful web services',
//                 'Develop customized UI components',
//               ],
//             ),
//           ),
//           const SizedBox(height: 32),
//           AnimatedCard(
//             delay: 300,
//             child: const ExperienceCard(
//               title: 'Java Training',
//               company: 'NIIT, Lucknow',
//               points: [
//                 'Completed GNIIT with comprehensive Java training',
//                 'Gained expertise in core Java and OOP principles',
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class AnimatedBulletPoint extends StatefulWidget {
//   final String text;
//
//   const AnimatedBulletPoint({Key? key, required this.text}) : super(key: key);
//
//   @override
//   State<AnimatedBulletPoint> createState() => _AnimatedBulletPointState();
// }
//
// class _AnimatedBulletPointState extends State<AnimatedBulletPoint>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _pulseAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )..repeat(reverse: true);
//
//     _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           AnimatedBuilder(
//             animation: _pulseAnimation,
//             builder: (context, child) {
//               return Transform.scale(
//                 scale: _pulseAnimation.value,
//                 child: const Padding(
//                   padding: EdgeInsets.only(top: 4),
//                   child: Text(
//                     '⚡',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//               );
//             },
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Text(
//               widget.text,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Color(0xFFA3A3A3),
//                 height: 1.6,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class ExperienceCard extends StatelessWidget {
//   final String title;
//   final String company;
//   final List<String> points;
//
//   const ExperienceCard({
//     Key? key,
//     required this.title,
//     required this.company,
//     required this.points,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 28,
//             fontWeight: FontWeight.w700,
//             color: Color(0xFFFBBF24),
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           company,
//           style: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//             color: Color(0xFFA3A3A3),
//           ),
//         ),
//         const SizedBox(height: 24),
//         // Use AnimatedBulletPoint instead of simple Row
//         ...points.map((point) => AnimatedBulletPoint(text: point)),
//       ],
//     );
//   }
// }
//
//
// class SkillsSection extends StatelessWidget {
//   const SkillsSection({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
//       child: Column(
//         children: [
//           const SectionTitle(title: 'TECHNICAL SKILLS'),
//           const SizedBox(height: 64),
//           Wrap(
//             spacing: 32,
//             runSpacing: 32,
//             alignment: WrapAlignment.center,
//             children: const [
//               SkillCategory(
//                 title: 'Languages',
//                 skills: ['Android', 'Java', 'Kotlin', 'Dart', 'Flutter'],
//               ),
//               SkillCategory(
//                 title: 'Tools',
//                 skills: ['Android Studio', 'Git', 'REST APIs', 'JSON'],
//               ),
//               SkillCategory(
//                 title: 'Backend',
//                 skills: ['Firebase', 'MongoDB', 'SQLite'],
//               ),
//               SkillCategory(
//                 title: 'APIs',
//                 skills: ['Google Maps', 'FCM', 'AdMob'],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class SkillCategory extends StatelessWidget {
//   final String title;
//   final List<String> skills;
//
//   const SkillCategory({Key? key, required this.title, required this.skills}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedCard(
//       child: SizedBox(
//         width: 250,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.w700,
//                 color: Color(0xFFFBBF24),
//               ),
//             ),
//             const SizedBox(height: 24),
//             Wrap(
//               spacing: 12,
//               runSpacing: 12,
//               children: skills.map((skill) => SkillTag(skill: skill)).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class SkillTag extends StatefulWidget {
//   final String skill;
//
//   const SkillTag({Key? key, required this.skill}) : super(key: key);
//
//   @override
//   State<SkillTag> createState() => _SkillTagState();
// }
//
// class _SkillTagState extends State<SkillTag>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => _controller.forward(),
//       onExit: (_) => _controller.reverse(),
//       child: AnimatedBuilder(
//         animation: _controller,
//         builder: (context, child) {
//           return Transform.translate(
//             offset: Offset(0, -3 * _controller.value),
//             child: Transform.scale(
//               scale: 1.0 + 0.1 * _controller.value,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 decoration: BoxDecoration(
//                   color: Color.lerp(
//                     const Color(0xFFFBBF24).withOpacity(0.1),
//                     const Color(0xFFFBBF24),
//                     _controller.value,
//                   ),
//                   borderRadius: BorderRadius.circular(50),
//                   border: Border.all(
//                     color: Color.lerp(
//                       const Color(0xFFFBBF24).withOpacity(0.3),
//                       const Color(0xFFFBBF24),
//                       _controller.value,
//                     )!,
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: const Color(0xFFFBBF24)
//                           .withOpacity(0.2 * _controller.value),
//                       blurRadius: 25 * _controller.value,
//                     ),
//                   ],
//                 ),
//                 child: Text(
//                   widget.skill,
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w600,
//                     color: Color.lerp(
//                       const Color(0xFFFBBF24),
//                       const Color(0xFF0A0A0A),
//                       _controller.value,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class ProjectsSection extends StatelessWidget {
//   const ProjectsSection({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
//       child: Column(
//         children: [
//           const SectionTitle(title: 'FEATURED PROJECTS'),
//           const SizedBox(height: 64),
//           Wrap(
//             spacing: 40,
//             runSpacing: 40,
//             alignment: WrapAlignment.center,
//             children: const [
//               ProjectCard(
//                 title: 'Digi Doctor',
//                 techStack: 'Android Studio | Team',
//                 description: 'Healthcare app for medical records and appointments',
//               ),
//               ProjectCard(
//                 title: 'Nutrition Today',
//                 techStack: 'Android Studio | Team',
//                 description: 'Nutrition information and food tracking app',
//               ),
//               ProjectCard(
//                 title: 'NutriAnalyser',
//                 techStack: 'Android Studio | Team',
//                 description: 'Diet management with deficiency notifications',
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ProjectCard extends StatelessWidget {
//   final String title;
//   final String techStack;
//   final String description;
//
//   const ProjectCard({
//     Key? key,
//     required this.title,
//     required this.techStack,
//     required this.description,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedCard(
//       child: SizedBox(
//         width: 320,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.w700,
//                 color: Color(0xFFFBBF24),
//               ),
//             ),
//             const SizedBox(height: 12),
//             Text(
//               techStack,
//               style: const TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xFFF59E0B),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               description,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Color(0xFFA3A3A3),
//                 height: 1.7,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// class EducationSection extends StatelessWidget {
//   const EducationSection({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
//       child: Column(
//         children: [
//           const SectionTitle(title: 'EDUCATION'),
//           const SizedBox(height: 64),
//           Container(
//             constraints: const BoxConstraints(maxWidth: 900),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 AnimatedCard(
//                   delay: 100,
//                   child: const EducationCard(
//                     degree: 'GNIIT',
//                     institution: 'NIIT',
//                     year: '2020',
//                     percentage: '95%',
//                   ),
//                 ),
//                 const SizedBox(height: 32),
//                 AnimatedCard(
//                   delay: 200,
//                   child: const EducationCard(
//                     degree: 'B.Com',
//                     institution: 'Avadh University',
//                     year: '2020',
//                     percentage: '60%',
//                   ),
//                 ),
//                 const SizedBox(height: 32),
//                 AnimatedCard(
//                   delay: 300,
//                   child: const EducationCard(
//                     degree: '10+2',
//                     institution: 'C.B.S.E',
//                     year: '2016',
//                     percentage: '62.5%',
//                   ),
//                 ),
//                 const SizedBox(height: 32),
//                 AnimatedCard(
//                   delay: 400,
//                   child: const EducationCard(
//                     degree: '10th',
//                     institution: 'C.B.S.E',
//                     year: '2014',
//                     percentage: '8.6 CGPA',
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class EducationCard extends StatelessWidget {
//   final String degree;
//   final String institution;
//   final String year;
//   final String percentage;
//
//   const EducationCard({
//     Key? key,
//     required this.degree,
//     required this.institution,
//     required this.year,
//     required this.percentage,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 2,
//             child: Text(
//               degree,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w700,
//                 color: Color(0xFFFBBF24),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: Text(
//               institution,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Color(0xFFA3A3A3),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 2,
//             child: Text(
//               year,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Color(0xFFA3A3A3),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 2,
//             child: Text(
//               percentage,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xFFFBBF24),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class FooterSection extends StatelessWidget {
//   const FooterSection({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 80),
//       padding: const EdgeInsets.symmetric(vertical: 48),
//       decoration: BoxDecoration(
//         color: const Color(0xFF1A1A1A).withOpacity(0.8),
//         border: const Border(
//           top: BorderSide(
//             color: Color(0xFFFBBF24),
//             width: 1,
//           ),
//         ),
//       ),
//       child: Column(
//         children: [
//           RichText(
//             text: const TextSpan(
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Color(0xFFA3A3A3),
//               ),
//               children: [
//                 TextSpan(text: '© 2025 '),
//                 TextSpan(
//                   text: 'Animesh Pratap Singh',
//                   style: TextStyle(
//                     color: Color(0xFFFBBF24),
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 TextSpan(text: '. All rights reserved.'),
//               ],
//             ),
//           ),
//           const SizedBox(height: 16),
//           RichText(
//             text: const TextSpan(
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Color(0xFFA3A3A3),
//               ),
//               children: [
//                 TextSpan(text: 'Crafted with '),
//                 TextSpan(
//                   text: 'passion',
//                   style: TextStyle(
//                     color: Color(0xFFFBBF24),
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 TextSpan(text: ' for mobile innovation ⚡'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class AnimatedCard extends StatefulWidget {
//   final Widget child;
//   final int delay;
//
//   const AnimatedCard({Key? key, required this.child, this.delay = 0}) : super(key: key);
//
//   @override
//   State<AnimatedCard> createState() => _AnimatedCardState();
// }
//
// class _AnimatedCardState extends State<AnimatedCard> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;
//   bool _isHovered = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 800),
//       vsync: this,
//     );
//
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeOut),
//     );
//
//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(-0.3, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
//
//     Future.delayed(Duration(milliseconds: widget.delay), () {
//       if (mounted) _controller.forward();
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FadeTransition(
//       opacity: _fadeAnimation,
//       child: SlideTransition(
//         position: _slideAnimation,
//         child: MouseRegion(
//           onEnter: (_) => setState(() => _isHovered = true),
//           onExit: (_) => setState(() => _isHovered = false),
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 400),
//             padding: const EdgeInsets.all(40),
//             decoration: BoxDecoration(
//               color: const Color(0xFF1A1A1A),
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(
//                 color: const Color(0xFFFBBF24).withOpacity(_isHovered ? 1.0 : 0.1),
//               ),
//               boxShadow: _isHovered
//                   ? [
//                 BoxShadow(
//                   color: const Color(0xFFFBBF24).withOpacity(0.3),
//                   blurRadius: 60,
//                 ),
//               ]
//                   : [],
//             ),
//             transform: Matrix4.translationValues(0, _isHovered ? -10 : 0, 0),
//             child: widget.child,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
// // ==================== ANIMATED BACKGROUND ====================
// class AnimatedBackground extends StatelessWidget {
//   final AnimationController particleController;
//   final AnimationController orbController;
//   final AnimationController gridController;
//
//   const AnimatedBackground({
//     Key? key,
//     required this.particleController,
//     required this.orbController,
//     required this.gridController,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // Animated Grid
//         AnimatedBuilder(
//           animation: gridController,
//           builder: (context, child) {
//             return CustomPaint(
//               painter: GridPainter(gridController.value),
//               child: Container(),
//             );
//           },
//         ),
//
//         // Floating Particles
//         ...List.generate(9, (index) {
//           return AnimatedBuilder(
//             animation: particleController,
//             builder: (context, child) {
//               final progress = (particleController.value + (index * 0.1)) % 1.0;
//               return Positioned(
//                 left: MediaQuery.of(context).size.width * ((index + 1) / 10),
//                 bottom: -20 + (progress * (MediaQuery.of(context).size.height + 120)),
//                 child: Opacity(
//                   opacity: progress < 0.1 ? progress * 10 : (progress > 0.9 ? (1 - progress) * 10 : 1),
//                   child: Container(
//                     width: 4,
//                     height: 4,
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFFBBF24),
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: const Color(0xFFFBBF24).withOpacity(0.8),
//                           blurRadius: 10,
//                           spreadRadius: 2,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         }),
//
//         // Glowing Orbs
//         AnimatedBuilder(
//           animation: orbController,
//           builder: (context, child) {
//             final angle = orbController.value * 2 * math.pi;
//             return Stack(
//               children: [
//                 // Orb 1
//                 Positioned(
//                   top: -200 + math.sin(angle) * 100,
//                   left: -200 + math.cos(angle) * 100,
//                   child: Container(
//                     width: 400,
//                     height: 400,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       gradient: RadialGradient(
//                         colors: [
//                           const Color(0xFFFBBF24).withOpacity(0.4),
//                           const Color(0xFFFBBF24).withOpacity(0.2),
//                           Colors.transparent,
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Orb 2
//                 Positioned(
//                   bottom: -150 + math.cos(angle) * 100,
//                   right: -150 + math.sin(angle) * 100,
//                   child: Container(
//                     width: 300,
//                     height: 300,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       gradient: RadialGradient(
//                         colors: [
//                           const Color(0xFFF59E0B).withOpacity(0.4),
//                           const Color(0xFFF59E0B).withOpacity(0.2),
//                           Colors.transparent,
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
//
// class GridPainter extends CustomPainter {
//   final double progress;
//
//   GridPainter(this.progress);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = const Color(0xFFFBBF24).withOpacity(0.03)
//       ..strokeWidth = 1;
//
//     final offset = progress * 50;
//
//     for (double i = -50; i < size.width + 50; i += 50) {
//       canvas.drawLine(
//         Offset(i + offset, 0),
//         Offset(i + offset, size.height),
//         paint,
//       );
//     }
//
//     for (double i = -50; i < size.height + 50; i += 50) {
//       canvas.drawLine(
//         Offset(0, i + offset),
//         Offset(size.width, i + offset),
//         paint,
//       );
//     }
//   }
//
//   @override
//   bool shouldRepaint(GridPainter oldDelegate) => true;
// }
//
//
// class HoverNavButton extends StatefulWidget {
//   final String text;
//
//   const HoverNavButton({required this.text});
//
//   @override
//   State<HoverNavButton> createState() => HoverNavButtonState();
// }
//
// class HoverNavButtonState extends State<HoverNavButton>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => _controller.forward(),
//       onExit: (_) => _controller.reverse(),
//       child: AnimatedBuilder(
//         animation: _animation,
//         builder: (context, child) {
//           return Transform.translate(
//             offset: Offset(0, -2 * _animation.value),
//             child: Stack(
//               children: [
//                 Text(
//                   widget.text,
//                   style: TextStyle(
//                     color: Color.lerp(
//                       Colors.white,
//                       const Color(0xFFFBBF24),
//                       _animation.value,
//                     ),
//                     fontWeight: FontWeight.w600,
//                     fontSize: 16,
//                   ),
//                 ),
//                 Positioned(
//                   bottom: -5,
//                   left: 0,
//                   right: 0,
//                   child: Container(
//                     height: 2,
//                     width: 100 * _animation.value,
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFFBBF24),
//                       boxShadow: [
//                         BoxShadow(
//                           color: const Color(0xFFFBBF24)
//                               .withOpacity(0.5 * _animation.value),
//                           blurRadius: 10,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// // ==================== HERO SECTION ====================
// class _HeroSection extends StatefulWidget {
//   final AnimationController glowController;
//
//   const _HeroSection({required this.glowController});
//
//   @override
//   State<_HeroSection> createState() => _HeroSectionState();
// }
//
// class _HeroSectionState extends State<_HeroSection>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 1200),
//       vsync: this,
//     );
//
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: const Interval(0, 0.7, curve: Curves.easeOut),
//       ),
//     );
//
//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0, 0.5),
//       end: Offset.zero,
//     ).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: const Interval(0, 0.7, curve: Curves.easeOut),
//       ),
//     );
//
//     Future.delayed(const Duration(milliseconds: 300), () {
//       _controller.forward();
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
//       child: FadeTransition(
//         opacity: _fadeAnimation,
//         child: SlideTransition(
//           position: _slideAnimation,
//           child: Column(
//             children: [
//               AnimatedBuilder(
//                 animation: widget.glowController,
//                 builder: (context, child) {
//                   return ShaderMask(
//                     shaderCallback: (bounds) {
//                       return const LinearGradient(
//                         colors: [Colors.white, Color(0xFFFBBF24)],
//                       ).createShader(bounds);
//                     },
//                     child: Text(
//                       'ANIMESH PRATAP SINGH',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 50,
//                         fontWeight: FontWeight.w900,
//                         color: Colors.white,
//                         letterSpacing: -2,
//                         shadows: [
//                           Shadow(
//                             color: const Color(0xFFFBBF24).withOpacity(
//                                 0.5 + widget.glowController.value * 0.3),
//                             blurRadius: 10 + widget.glowController.value * 20,
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(height: 16),
//               AnimatedBuilder(
//                 animation: widget.glowController,
//                 builder: (context, child) {
//                   return Text(
//                     'Android Developer | Java & Kotlin Expert',
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: const Color(0xFFFBBF24),
//                       fontWeight: FontWeight.w600,
//                       shadows: [
//                         Shadow(
//                           color: const Color(0xFFFBBF24)
//                               .withOpacity(0.3 + widget.glowController.value * 0.2),
//                           blurRadius: 20,
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(height: 32),
//               Wrap(
//                 spacing: 32,
//                 runSpacing: 16,
//                 alignment: WrapAlignment.center,
//                 children: const [
//                   _ContactItem(icon: '📱', text: '9807039752'),
//                   _ContactItem(icon: '📧', text: 'Animesh.singh222@gmail.com'),
//                   _ContactItem(icon: '📍', text: 'Lucknow'),
//                 ],
//               ),
//               const SizedBox(height: 32),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 40),
//                 child: Text(
//                   'Goal-oriented Android developer with 4+ years of experience building high-quality mobile applications. Specialized in clean architecture, modern Android development practices, and creating intuitive user experiences.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Color(0xFFA3A3A3),
//                     height: 1.8,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 48),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: const [
//                   _AnimatedButton(text: 'View Projects', isPrimary: true),
//                   SizedBox(height: 20),
//                   _AnimatedButton(text: 'Experience', isPrimary: false),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // ==================== CONTACT ITEM ====================
// class _ContactItem extends StatefulWidget {
//   final String icon;
//   final String text;
//
//   const _ContactItem({required this.icon, required this.text});
//
//   @override
//   State<_ContactItem> createState() => _ContactItemState();
// }
//
// class _ContactItemState extends State<_ContactItem>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _glowAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//
//     _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeOut),
//     );
//
//     _glowAnimation = Tween<double>(begin: 0.1, end: 0.2).animate(_controller);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => _controller.forward(),
//       onExit: (_) => _controller.reverse(),
//       child: AnimatedBuilder(
//         animation: _controller,
//         builder: (context, child) {
//           return Transform.scale(
//             scale: _scaleAnimation.value,
//             child: Transform.translate(
//               offset: Offset(0, -3 * _controller.value),
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                 decoration: BoxDecoration(
//                   color: Color.lerp(
//                     const Color(0xFFFBBF24).withOpacity(0.1),
//                     const Color(0xFFFBBF24).withOpacity(0.2),
//                     _controller.value,
//                   ),
//                   borderRadius: BorderRadius.circular(50),
//                   border: Border.all(
//                     color: Color.lerp(
//                       const Color(0xFFFBBF24).withOpacity(0.3),
//                       const Color(0xFFFBBF24),
//                       _controller.value,
//                     )!,
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: const Color(0xFFFBBF24)
//                           .withOpacity(0.1 + 0.2 * _controller.value),
//                       blurRadius: 10 + 20 * _controller.value,
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(widget.icon, style: const TextStyle(fontSize: 20)),
//                     const SizedBox(width: 8),
//                     Text(
//                       widget.text,
//                       style: const TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// // ==================== ANIMATED BUTTON ====================
// class _AnimatedButton extends StatefulWidget {
//   final String text;
//   final bool isPrimary;
//
//   const _AnimatedButton({required this.text, required this.isPrimary});
//
//   @override
//   State<_AnimatedButton> createState() => _AnimatedButtonState();
// }
//
// class _AnimatedButtonState extends State<_AnimatedButton>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => _controller.forward(),
//       onExit: (_) => _controller.reverse(),
//       child: GestureDetector(
//         onTap: () {},
//         child: AnimatedBuilder(
//           animation: _controller,
//           builder: (context, child) {
//             return Transform.translate(
//               offset: Offset(0, -5 * _controller.value),
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 18),
//                 decoration: BoxDecoration(
//                   gradient: widget.isPrimary
//                       ? const LinearGradient(
//                     colors: [Color(0xFFFBBF24), Color(0xFFF59E0B)],
//                   )
//                       : null,
//                   color: widget.isPrimary ? null : Colors.transparent,
//                   borderRadius: BorderRadius.circular(50),
//                   border: widget.isPrimary
//                       ? null
//                       : Border.all(color: const Color(0xFFFBBF24), width: 2),
//                   boxShadow: [
//                     BoxShadow(
//                       color: const Color(0xFFFBBF24)
//                           .withOpacity(widget.isPrimary ? 0.4 : 0.2)
//                           .withOpacity((widget.isPrimary ? 0.4 : 0.2) +
//                           0.2 * _controller.value),
//                       blurRadius: 40 + 20 * _controller.value,
//                     ),
//                   ],
//                 ),
//                 child: Text(
//                   widget.text,
//                   style: TextStyle(
//                     color: widget.isPrimary
//                         ? const Color(0xFF0A0A0A)
//                         : Color.lerp(
//                       const Color(0xFFFBBF24),
//                       const Color(0xFF0A0A0A),
//                       _controller.value,
//                     ),
//                     fontSize: 18,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
// // ==================== SECTION TITLE ====================
// class SectionTitle extends StatefulWidget {
//   final String title;
//
//   const SectionTitle({Key? key, required this.title}) : super(key: key);
//
//   @override
//   State<SectionTitle> createState() => _SectionTitleState();
// }
//
// class _SectionTitleState extends State<SectionTitle>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _lineAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 800),
//       vsync: this,
//     );
//
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0, 0.3),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
//     _lineAnimation = Tween<double>(begin: 0.0, end: 100.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeOut),
//     );
//
//     Future.delayed(const Duration(milliseconds: 100), () {
//       if (mounted) _controller.forward();
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FadeTransition(
//       opacity: _fadeAnimation,
//       child: SlideTransition(
//         position: _slideAnimation,
//         child: Column(
//           children: [
//             ShaderMask(
//               shaderCallback: (bounds) {
//                 return const LinearGradient(
//                   colors: [Colors.white, Color(0xFFFBBF24)],
//                 ).createShader(bounds);
//               },
//               child: Text(
//                 widget.title,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   fontSize: 48,
//                   fontWeight: FontWeight.w900,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             AnimatedBuilder(
//               animation: _lineAnimation,
//               builder: (context, child) {
//                 return Container(
//                   width: _lineAnimation.value,
//                   height: 4,
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [
//                         Colors.transparent,
//                         Color(0xFFFBBF24),
//                         Colors.transparent
//                       ],
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: const Color(0xFFFBBF24).withOpacity(0.5),
//                         blurRadius: 20,
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // ==================== ANIMATED CARD ====================
// class _AnimatedCard extends StatefulWidget {
//   final Widget child;
//   final int delay;
//
//   const _AnimatedCard({required this.child, this.delay = 0});
//
//   @override
//   State<_AnimatedCard> createState() => AnimatedCardState();
// }
//
// class AnimatedCardState extends State<_AnimatedCard>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late AnimationController _hoverController;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _scaleAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 800),
//       vsync: this,
//     );
//
//     _hoverController = AnimationController(
//       duration: const Duration(milliseconds: 400),
//       vsync: this,
//     );
//
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeOut),
//     );
//
//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(-0.3, 0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
//
//     _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeOut),
//     );
//
//     Future.delayed(Duration(milliseconds: widget.delay), () {
//       if (mounted) _controller.forward();
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     _hoverController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FadeTransition(
//         opacity: _fadeAnimation,
//         child: SlideTransition(
//             position: _slideAnimation,
//             child: ScaleTransition(
//                 scale: _scaleAnimation,
//                 child: MouseRegion(
//                     onEnter: (_) => _hoverController.forward(),
//                     onExit: (_) => _hoverController.reverse(),
//                     child: AnimatedBuilder(
//                         animation: _hoverController,
//                         builder: (context, child) {
//                           return Transform.translate(
//                             offset: Offset(0, -10 * _hoverController.value),
//                             child: Container(
//                               padding: const EdgeInsets.all(40),
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFF1A1A1A),
//                                 borderRadius: BorderRadius.circular(20),
//                                 border: Border.all(
//                                   color: Color.lerp(
//                                     const Color(0xFFFBBF24).withOpacity(0.1),
//                                     const Color(0xFFFBBF24),
//                                     _hoverController.value,
//                                   )!,
//                                 ),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: const Color(0xFFFBBF24)
//                                         .withOpacity(
//                                         0.1 + 0.2 * _hoverController.value),
//                                     blurRadius: 20 + 40 * _hoverController.value,
//                                   ),
//                                 ],
//                               ),
//                               child: widget.child,
//                             ),
//                           );
//                         }
//                     )
//                 )
//             )
//         )
//     );
//   }
//}