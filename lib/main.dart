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

class HerHacksLandingPage extends StatefulWidget {
  const HerHacksLandingPage({super.key});

  @override
  State<HerHacksLandingPage> createState() => _HerHacksLandingPageState();
}

class _HerHacksLandingPageState extends State<HerHacksLandingPage> {
  late final ScrollController _scrollController;

  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _timelineKey = GlobalKey();
  final GlobalKey _locationKey = GlobalKey();
  final GlobalKey _highlightsKey = GlobalKey();
  final GlobalKey _sponsorsKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  // Smooth scroll to target GlobalKey with Navbar height offset
  void _scrollToSection(GlobalKey key) {
    final targetContext = key.currentContext;
    if (targetContext != null) {
      final RenderBox renderBox = targetContext.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);

      final double currentScrollOffset = _scrollController.offset;
      final bool isMobile = MediaQuery.of(context).size.width < 900;

      // Fixed height clearance for sticky navbar (120px mobile / 90px desktop)
      final double navbarOffset = isMobile ? 120.0 : 90.0;
      final double targetOffset = currentScrollOffset + position.dy - navbarOffset;

      _scrollController.animateTo(
        targetOffset.clamp(0.0, _scrollController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 900;

    return Scaffold(
      body: Stack(
        children: [
          CodeMatrixBackground(
            scrollController: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Column(
                children: [
                  SizedBox(height: isMobile ? 120 : 80),
                  CodePortraitHero(key: _aboutKey),
                  FeaturesGrid(key: _highlightsKey),
                  EventTimeline(key: _timelineKey),
                  LocationSection(key: _locationKey),
                  SponsorsSection(key: _sponsorsKey),
                  const Footer(),
                ],
              ),
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              onAboutPressed: () => _scrollToSection(_aboutKey),
              onTimelinePressed: () => _scrollToSection(_timelineKey),
              onLocationPressed: () => _scrollToSection(_locationKey),
              onHighlightsPressed: () => _scrollToSection(_highlightsKey),
              onSponsorsPressed: () => _scrollToSection(_sponsorsKey),
              onSponsorPressed: () => _scrollToSection(_sponsorsKey),
              onRegisterPressed: () {
                _scrollToSection(_aboutKey);
              },
            ),
          ),
        ],
      ),
    );
  }
}