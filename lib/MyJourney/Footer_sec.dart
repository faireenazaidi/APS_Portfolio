import 'package:flutter/material.dart';
import '../Colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 80),
      padding: const EdgeInsets.symmetric(vertical: 48),
      decoration: BoxDecoration(
        color: AppColors.veryDarkGray.withOpacity(0.8),
        border: const Border(
          top: BorderSide(
            color: AppColors.primaryGold,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 16, color: AppColors.mediumGray,),
              children: [

                TextSpan(text: '© 2025 '),
                TextSpan(
                  text: 'Animesh Pratap Singh',
                  style: TextStyle(
                    color: AppColors.primaryGold,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(text: '. All rights reserved.'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 16,
                color: AppColors.mediumGray,
              ),
              children: [
                TextSpan(text: 'Crafted with '),
                TextSpan(
                  text: 'passion',
                  style: TextStyle(
                    color: AppColors.primaryGold,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(text: ' for mobile innovation ⚡'),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
