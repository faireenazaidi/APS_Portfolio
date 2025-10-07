import 'package:flutter/material.dart';
import 'Widgets/Colors.dart';
import 'MyJourney/Portfolio_View.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animesh Pratap Singh - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundDark,
        fontFamily: 'Segoe UI',
      ),
      home: const PortfolioHomePage(),

    );

  }
}

