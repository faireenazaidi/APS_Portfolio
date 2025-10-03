import 'package:flutter/material.dart';

class MyJourneyHomePage extends StatefulWidget{
  const MyJourneyHomePage({super.key});

  @override
  State<MyJourneyHomePage> createState() => _MyJourneyHomePageState();

}
class _MyJourneyHomePageState extends State<MyJourneyHomePage> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  Stack(
          children: [
            Column(
              children: [

              ],
            )
          ],
        ),
      ),
    );
  }

}