import 'package:flutter/material.dart';
import 'Colors.dart';
import 'MyJourney/Portfolio_View.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animesh Pratap Singh',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.backgroundDark,
        primaryColor: AppColors.primaryGold,
      ),
      home: MyJourneyHomePage(),
    );

  }
}
