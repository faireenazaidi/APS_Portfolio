import 'package:flutter/material.dart';

import '../Colors.dart';
import 'Animatedcard.dart';
import 'Sec_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Column(
        children: [
          const SectionTitle(title: 'FEATURED PROJECTS'),
          const SizedBox(height: 64),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: const [
              ProjectCard(
                title: 'Digi Doctor',
                techStack: 'Android Studio | Team',
                description: 'Comprehensive healthcare app for patients to manage medical records, medications, investigations, drug allergies, admission records, and health documents. Features include online appointment booking, video consultations, online pharmacy, and health testing',
              ),
              ProjectCard(
                title: 'Nutrition Today',
                techStack: 'Android Studio | Team',
                description: 'Nutrition information app providing detailed data about nutrients and compounds found in foods. Helps users find foods commonly consumed in their daily meals and understand their nutritional content.',
              ),
              ProjectCard(
                title: 'NutriAnalyser',
                techStack: 'Android Studio | Team',
                description: 'Diet management app that tracks diet records and nutritional information. Features automated notifications for nutrient deficiencies and toxicity warnings to help users maintain optimal nutrition.',
              ),
              ProjectCard(
                title: 'NutriAnalyser',
                techStack: 'Android Studio | Team',
                description: 'Diet management app that tracks diet records and nutritional information. Features automated notifications for nutrient deficiencies and toxicity warnings to help users maintain optimal nutrition.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String techStack;
  final String description;

  const ProjectCard({
    Key? key,
    required this.title,
    required this.techStack,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      child: SizedBox(
        width: 320,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryGold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              techStack,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.warmGolden,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.mediumGray,
                height: 1.7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
