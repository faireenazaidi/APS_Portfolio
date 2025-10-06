import 'package:flutter/material.dart';
import 'Animatedcard.dart';
import 'Experience_card.dart';
import 'Sec_title.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: Column(
        children: [
          SectionTitle(title: 'PROFESSIONAL EXPERIENCE'),
          const SizedBox(height: 64),
          AnimatedCard(
            delay: 100,
            child: const ExperienceCard(
              title: 'Android Developer',
              company: 'Criterion Tech Pvt Ltd, Lucknow | December 2020 - Present',
              points: [
                'Involved in entire Software Development Life Cycle including analysis, requirement specification, design, coding, testing, client approval, deployment, and maintenance',
                'Monitor and optimize application performance, fix bugs, and ensure seamless user experience',
                'Build apps that communicate with RESTful web services and integrate third-party APIs',
                'Analyze, design, and implement new features while ensuring compatibility across different Android versions',
                'Develop customized UI components for various screen resolutions and device types'
              ],
            ),
          ),
          const SizedBox(height: 32),
          AnimatedCard(
            delay: 300,
            child: const ExperienceCard(
              title: 'Java Training',
              company: 'NIIT, Lucknow',
              points: [
                'Completed GNIIT (Cloud Software Engineering Diploma) with comprehensive Java training',
                'Gained expertise in core Java concepts, OOP principles, and software engineering fundamentals',
            ],
            ),
          ),
        ],
      ),
    );
  }
}
