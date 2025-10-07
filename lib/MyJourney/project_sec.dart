import 'package:flutter/material.dart';
import '../Widgets/Colors.dart';
import 'Animatedcard.dart';
import 'Hover_Link.dart';
import 'Sec_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
          const SectionTitle(title: 'FEATURED PROJECTS'),
          const SizedBox(height: 64),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: const [
              ProjectCard(
                title: 'Digi Doctor',
                techStack: 'Android Studio | Team Project',
                description:
                'Comprehensive healthcare app for patients to manage medical records, medications, investigations, drug allergies, admission records, and health documents. Features include online appointment booking, video consultations, online pharmacy, and health testing.',
                link: 'https://play.google.com/store/apps/details?id=com.digidoctor.android',
                delay: 100,
              ),
              ProjectCard(
                title: 'Nutrition Today',
                techStack: 'Android Studio | Team Project',
                description:
                'Nutrition information app providing detailed data about nutrients and compounds found in foods. Helps users find foods commonly consumed in their daily meals and understand their nutritional content.',
                link: 'https://play.google.com/store/apps/details?id=com.nutritiontoday.android',
                delay: 200,
              ),
              ProjectCard(
                title: 'NutriAnalyser',
                techStack: 'Android Studio | Team Project',
                description:
                'Diet management app that tracks diet records and nutritional information. Features automated notifications for nutrient deficiencies and toxicity warnings to help users maintain optimal nutrition.',
                delay: 300,
              ),
              ProjectCard(
                title: 'ERP System',
                techStack: 'Android Studio | Team of 4',
                description:
                'Enterprise resource planning solution combining employee management system with comprehensive ERP functionality for business operations.',
                delay: 400,
              ),
              ProjectCard(
                title: 'Know Med Clinical',
                techStack: 'Android Studio | Solo Project',
                description:
                'Clinical information app featuring disease-related data, body part information, symptoms, lab reports, medicine studies, diet information, disease-specific diets, medication interactions, and symptom checker.',
                delay: 500,
              ),
              ProjectCard(
                title: 'KnowmedPrep',
                techStack: 'Android Studio | Team of 2',
                description:
                'Online exam preparation platform for medical students with hundreds of practice questions and comprehensive video tutorials.',
                delay: 600,
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
  final String? link;
  final int delay;

  const ProjectCard({
    super.key,
    required this.title,
    required this.techStack,
    required this.description,
    this.link,
    this.delay = 0,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      delay: delay,
      child: SizedBox(
        width: 320,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryGold,
              ),
            ),
            const SizedBox(height: 12),
            Text(techStack, style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.darkGold,
              ),
            ),
            const SizedBox(height: 16),
            Text(description, style: const TextStyle(
                fontSize: 16,
                color: AppColors.textGray,
                height: 1.7,
              ),
            ),
            if (link != null) ...[
              const SizedBox(height: 20),
              HoverLink(
                text: 'View on Play Store →',
                onTap: () {
                  debugPrint('Opening: $link');
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}