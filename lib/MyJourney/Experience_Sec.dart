import 'package:flutter/material.dart';
import '../Widgets/Colors.dart';
import '../Widgets/MyTextTheme.dart';
import 'Animatedcard.dart';
import 'Sec_title.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
          const SectionTitle(title: 'PROFESSIONAL EXPERIENCE'),
          const SizedBox(height: 64),
          AnimatedCard(
            delay: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text('Android Developer',
                  style: MyTextTheme.primaryGoldM
                ),
                const SizedBox(height: 8),
                 Text(
                  'Criterion Tech Pvt Ltd, Lucknow | December 2020 - Present',
                  style: MyTextTheme.primaryGoldM.copyWith(fontWeight: FontWeight.w600,fontSize: 18)
                ),
                const SizedBox(height: 24),
                _buildBulletPoint(
                    'Involved in entire Software Development Life Cycle including analysis, requirement specification, design, coding, testing, client approval, deployment, and maintenance'),
                const SizedBox(height: 12),
                _buildBulletPoint(
                    'Monitor and optimize application performance, fix bugs, and ensure seamless user experience'),
                const SizedBox(height: 12),
                _buildBulletPoint(
                    'Build apps that communicate with RESTful web services and integrate third-party APIs'),
                const SizedBox(height: 12),
                _buildBulletPoint(
                    'Analyze, design, and implement new features while ensuring compatibility across different Android versions'),
                const SizedBox(height: 12),
                _buildBulletPoint(
                    'Develop customized UI components for various screen resolutions and device types'),
              ],
            ),
          ),
          const SizedBox(height: 32),
          AnimatedCard(
            delay: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text('Java Training',
                  style: MyTextTheme.primaryGoldM
                ),
                const SizedBox(height: 8),
                 Text('NIIT, Lucknow',
                  style: MyTextTheme.textGraySmallNM
                ),
                const SizedBox(height: 24),
                _buildBulletPoint(
                    'Completed GNIIT (Cloud Software Engineering Diploma) with comprehensive Java training'),
                const SizedBox(height: 12),
                _buildBulletPoint(
                    'Gained expertise in core Java concepts, OOP principles, and software engineering fundamentals'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text('⚡', style: MyTextTheme.primaryGoldNor.copyWith(fontWeight: FontWeight.normal)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(text, style: MyTextTheme.textGraySmallN.copyWith(height: 1.6),
          ),
        ),
      ],
    );
  }
}
