import 'package:flutter/material.dart';
import 'package:portfolio/Widgets/MyTextTheme.dart';
import '../Widgets/Colors.dart';
import 'Animatedcard.dart';
import 'Sec_title.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

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
          const SectionTitle(title: 'EDUCATION'),
          const SizedBox(height: 64),
          Container(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              children: [
                AnimatedCard(
                  delay: 100,
                  child: EducationCard(
                    degree: 'GNIIT',
                    institution: 'NIIT',
                    year: '2020',
                    percentage: '95%',
                    isSmallScreen: isSmallScreen,
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedCard(
                  delay: 200,
                  child: EducationCard(
                    degree: 'B.Com',
                    institution: 'Avadh University',
                    year: '2020',
                    percentage: '60%',
                    isSmallScreen: isSmallScreen,
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedCard(
                  delay: 300,
                  child: EducationCard(
                    degree: '10+2',
                    institution: 'C.B.S.E',
                    year: '2016',
                    percentage: '62.5%',
                    isSmallScreen: isSmallScreen,
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedCard(
                  delay: 400,
                  child: EducationCard(
                    degree: '10th',
                    institution: 'C.B.S.E',
                    year: '2014',
                    percentage: '8.6 CGPA',
                    isSmallScreen: isSmallScreen,
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
  final bool isSmallScreen;

  const EducationCard({
    super.key,
    required this.degree,
    required this.institution,
    required this.year,
    required this.percentage,
    required this.isSmallScreen,
  });

  @override
  Widget build(BuildContext context) {
    if (isSmallScreen) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(degree, style: MyTextTheme.primaryGoldNor),
          const SizedBox(height: 8),
          Text(institution, style: MyTextTheme.textGraySmallN
          ),
          const SizedBox(height: 8),
          Text(year, style:  MyTextTheme.textGraySmallN
          ),
          const SizedBox(height: 8),
          Text(percentage, style: MyTextTheme.primaryGoldNor.copyWith(fontWeight: FontWeight.w700)),
        ],
      );
    }

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(degree, style:MyTextTheme.primaryGoldNor
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(institution, style: MyTextTheme.textGraySmallN
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(year, style: MyTextTheme.textGraySmallN
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(percentage,
            style: MyTextTheme.primaryGoldNor.copyWith(fontWeight: FontWeight.w600,fontSize: 16)
          ),
        ),
      ],
    );
  }
}