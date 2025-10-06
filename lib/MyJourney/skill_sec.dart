import 'package:flutter/material.dart';
import '../Colors.dart';
import 'Animatedcard.dart';
import 'Sec_title.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Column(
        children: [
          const SectionTitle(title: 'TECHNICAL SKILLS'),
          const SizedBox(height: 64),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.start,
            children: const [
              SkillCategory(
                title: 'Languages & Frameworks',
                skills: ['Android', 'Java', 'Kotlin', 'Dart', 'Flutter'],
              ),
              SkillCategory(
                title: 'Development Tools',
                skills: ['Android Studio', 'Git', 'REST APIs', 'JSON'],
              ),
              SkillCategory(
                title: 'Backend & Cloud',
                skills: ['Firebase', 'MongoDB', 'SQLite','Cloud Messaging'],
              ),
              SkillCategory(
                title: 'APIs & Integration',
                skills: ['YouTube API','Google Maps', 'FCM', 'Facebook SDK','Twitter SDK','LinkedIn Sdk','AdMob','Google Play Services'],
              ),
              SkillCategory(
                title: 'Web Technologies',
                skills: ['HTML5','CSS', 'Bootstrap 4'],
              ),
              SkillCategory(
                title: 'Design & Architecture',
                skills: ['Material Design','UI/UX Design', 'OOP Concepts', 'Clean Code',],
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

  const SkillCategory({super.key, required this.title, required this.skills});

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      child: SizedBox(
        width: 380,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
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
            child: Transform.scale(
              scale: 1.0 + 0.1 * _controller.value,
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
                      color:  AppColors.primaryGold.withOpacity(0.2 * _controller.value),
                      blurRadius: 25 * _controller.value,
                    ),
                  ],
                ),
                child: Text(
                  widget.skill,
                  style: TextStyle(
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
            ),
          );
        },
      ),
    );
  }
}