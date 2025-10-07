import 'package:flutter/material.dart';
import 'package:portfolio/Widgets/MyTextTheme.dart';
import '../Widgets/Colors.dart';
import 'Animated_bulletpoints.dart';

class ExperienceCard extends StatelessWidget {
  final String title;
  final String company;
  final List<String> points;

  const ExperienceCard({
    super.key,
    required this.title,
    required this.company,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: MyTextTheme.primaryGoldNorBold
        ),
        const SizedBox(height: 8),
        Text(company, style: MyTextTheme.mediumGrayS.copyWith(fontWeight: FontWeight.w600)
        ),
        const SizedBox(height: 24),
        ...points.map((point) => AnimatedBulletPoint(text: point)),
      ],
    );
  }
}
