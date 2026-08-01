import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
// At top of lib/widgets/sponsors_section.dart
import 'package:flutter/foundation.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';

class SponsorsSection extends StatelessWidget {
  const SponsorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 900;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 80,
        horizontal: isMobile ? 20 : 40,
      ),
      color: Colors.black,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // Header Layout (Responsive Stack)
              Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isMobile ? 'OUR SPONSORS & PARTNERS.' : 'OUR SPONSORS\n& PARTNERS.',
                    style: TextStyle(
                      fontFamily: 'CalSans',
                      fontSize: isMobile ? 36 : 56,
                      color: Colors.white,
                      height: 1.0,
                    ),
                  ),
                  SizedBox(
                    height: isMobile ? 16 : 0,
                    width: isMobile ? 0 : 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'OUR SPONSORS',
                        style: TextStyle(
                          fontFamily: 'GeistPixel',
                          color: AppColors.secondaryYellow,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Empowering the next generation of innovators.\nBecome a partner to reach top student talent.',
                        style: TextStyle(
                          fontFamily: 'GeistPixel',
                          color: AppColors.mutedText,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: isMobile ? 32 : 60),

              // Sponsor callout banner
              Container(
                padding: EdgeInsets.all(isMobile ? 24 : 40),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white12),
                ),
                child: Flex(
                  direction: isMobile ? Axis.vertical : Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: isMobile ? 0 : 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'BECOME A SPONSOR',
                            style: TextStyle(
                              fontFamily: 'GeistPixel',
                              color: AppColors.secondaryYellow,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'YOUR BRAND, IN FRONT OF 200+ AMBITIOUS FEMALE STUDENTS.',
                            style: TextStyle(
                              fontFamily: 'CalSans',
                              fontSize: isMobile ? 22 : 28,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: isMobile ? 24 : 0,
                      width: isMobile ? 0 : 20,
                    ),
                    Expanded(
                      flex: isMobile ? 0 : 1,
                      child: Row(
                        mainAxisAlignment: isMobile
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: isMobile ? 1 : 0,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondaryYellow,
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 20,
                                ),
                              ),
                              onPressed: () async {
                                const String pdfPath = 'assets/assets/docs/prosp.pdf';

                                if (kIsWeb) {
                                  html.window.open(pdfPath, '_blank');
                                } else {
                                  final Uri pdfUri = Uri.parse(pdfPath);
                                  if (await canLaunchUrl(pdfUri)) {
                                    await launchUrl(pdfUri, mode: LaunchMode.externalApplication);
                                  }
                                }
                              },
                              child: const Text(
                                'VIEW PROSPECTUS ↗',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'GeistPixel',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}