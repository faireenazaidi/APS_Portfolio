import 'package:flutter/material.dart';
import '../Colors.dart';
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
        Text(title, style:  TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: AppColors.primaryGold,),
        ),
        const SizedBox(height: 8),
        Text(company, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color:AppColors.mediumGray,),
        ),
        const SizedBox(height: 24),
        ...points.map((point) => AnimatedBulletPoint(text: point)),
      ],
    );
  }
}
