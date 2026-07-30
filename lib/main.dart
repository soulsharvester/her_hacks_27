import 'package:flutter/material.dart';
import 'constants/app_colors.dart';
import 'widgets/navbar.dart';
import 'widgets/code_portrait_hero.dart';
import 'widgets/mission_section.dart';
import 'widgets/event_summary.dart';
import 'widgets/sponsorship_tiers.dart';
import 'widgets/footer.dart';

void main() {
  runApp(const HerHacksApp());
}

class HerHacksApp extends StatelessWidget {
  const HerHacksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Her Hacks \'27',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'sans-serif',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBackground,
      ),
      home: const HerHacksLandingPage(),
    );
  }
}

class HerHacksLandingPage extends StatelessWidget {
  const HerHacksLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Navbar(),
            CodePortraitHero(),
            MissionSection(),
            EventSummary(),
            SponsorshipTiers(),
            Footer(),
          ],
        ),
      ),
    );
  }
}