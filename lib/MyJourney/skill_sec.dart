import 'package:flutter/material.dart';
import '../Widgets/Colors.dart';
import 'Animatedcard.dart';
import 'Sec_title.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 20 : 40,
        vertical: 80,
      ),
      child: Column(
        children: [
          const SectionTitle(title: 'TECHNICAL SKILLS'),
          const SizedBox(height: 64),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: const [
              SkillCategory(
                title: 'Languages & Frameworks',
                skills: ['Android', 'Java', 'Kotlin', 'Dart', 'Flutter'],
                delay: 100,
              ),
              SkillCategory(
                title: 'Development Tools',
                skills: ['Android Studio', 'Git', 'REST APIs', 'JSON'],
                delay: 200,
              ),
              SkillCategory(
                title: 'Backend & Cloud',
                skills: ['Firebase', 'MongoDB', 'SQLite', 'Cloud Messaging'],
                delay: 300,
              ),
              SkillCategory(
                title: 'APIs & Integration',
                skills: ['Google Play Services', 'YouTube API', 'Google Maps', 'Facebook SDK', 'FCM', 'AdMob'],
                delay: 400,
              ),
              SkillCategory(
                title: 'Web Technologies',
                skills: ['HTML5', 'CSS', 'Bootstrap 4'],
                delay: 500,
              ),
              SkillCategory(
                title: 'Design & Architecture',
                skills: [
                  'Material Design',
                  'UI/UX Design',
                  'OOP Concepts',
                  'Clean Code'
                ],
                delay: 600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SkillCategory extends StatelessWidget {
  final String title;
  final List<String> skills;
  final int delay;

  const SkillCategory({
    super.key,
    required this.title,
    required this.skills,
    this.delay = 0,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      delay: delay,
      child: SizedBox(
        width: 280,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryGold,
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: skills.map((skill) => SkillTag(skill: skill)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class SkillTag extends StatefulWidget {
  final String skill;

  const SkillTag({super.key, required this.skill});

  @override
  State<SkillTag> createState() => _SkillTagState();
}

class _SkillTagState extends State<SkillTag>
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
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, -3 * _controller.value),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Color.lerp(
                  AppColors.primaryGold.withOpacity(0.1),
                  AppColors.primaryGold,
                  _controller.value,
                ),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Color.lerp(
                    AppColors.primaryGold.withOpacity(0.3),
                    AppColors.primaryGold,
                    _controller.value,
                  )!,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryGold
                        .withOpacity(0.2 * _controller.value),
                    blurRadius: 25 * _controller.value,
                  ),
                ],
              ),
              child: Text(widget.skill, style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color.lerp(
                    AppColors.primaryGold,
                    AppColors.backgroundDark,
                    _controller.value,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}