import 'package:flutter/material.dart';
import 'constants/app_colors.dart';
import 'widgets/navbar.dart';
import 'widgets/code_portrait_hero.dart';
import 'widgets/features_grid.dart';
import 'widgets/event_timeline.dart';
import 'widgets/location_section.dart';
import 'widgets/sponsors_section.dart';
import 'widgets/footer.dart';
import 'widgets/code_matrix_background.dart';

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
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBackground,
        fontFamily: 'GoogleSans',
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
      body: Stack(
        children: [
          // 1. Matrix Code Animated Background
          CodeMatrixBackground(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Column(
                children: const [
                  SizedBox(height: 80), // Buffer for top navbar
                  CodePortraitHero(),
                  FeaturesGrid(),
                  EventTimeline(),
                  LocationSection(),
                  SponsorsSection(),
                  Footer(),
                ],
              ),
            ),
          ),

          // 2. Fixed Sticky Navigation Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              onRegisterPressed: () {
                // Trigger Registration action
              },
              onSponsorPressed: () {
                // Trigger Sponsorship Prospectus action
              },
            ),
          ),
        ],
      ),
    );
  }
}