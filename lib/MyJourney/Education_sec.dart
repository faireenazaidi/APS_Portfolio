import 'package:flutter/material.dart';

import '../Colors.dart';
import 'Animatedcard.dart';
import 'Sec_title.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Column(
        children: [
          const SectionTitle(title: 'EDUCATION'),
          const SizedBox(height: 64),
          Container(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedCard(
                  delay: 100,
                  child: const EducationCard(
                    degree: 'GNIIT',
                    institution: 'NIIT',
                    year: '2020',
                    percentage: '95%',
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedCard(
                  delay: 200,
                  child: const EducationCard(
                    degree: 'B.Com',
                    institution: 'Avadh University',
                    year: '2020',
                    percentage: '60%',
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedCard(
                  delay: 300,
                  child: const EducationCard(
                    degree: '10+2',
                    institution: 'C.B.S.E',
                    year: '2016',
                    percentage: '62.5%',
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedCard(
                  delay: 400,
                  child: const EducationCard(
                    degree: '10th',
                    institution: 'C.B.S.E',
                    year: '2014',
                    percentage: '8.6 CGPA',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EducationCard extends StatelessWidget {
  final String degree;
  final String institution;
  final String year;
  final String percentage;

  const EducationCard({
    Key? key,
    required this.degree,
    required this.institution,
    required this.year,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(degree, style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryGold,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(institution, style:  TextStyle(
                fontSize: 16,
                color: AppColors.mediumGray,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(year,
              style: const TextStyle(fontSize: 16, color: AppColors.mediumGray,),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(percentage, style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryGold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
