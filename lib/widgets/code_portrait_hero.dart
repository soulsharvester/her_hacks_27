import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Add url_launcher to pubspec.yaml
import '../constants/app_colors.dart';

import 'package:flutter/foundation.dart'; // Imports kIsWeb
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class CodePortraitHero extends StatelessWidget {
  final VoidCallback? onGetInvolvedPressed;
  final VoidCallback? onDownloadProspectusPressed;

  const CodePortraitHero({
    super.key,
    this.onGetInvolvedPressed,
    this.onDownloadProspectusPressed,
  });

  // Helper method to trigger PDF download / open link
  Future<void> _downloadProspectus() async {
    const String pdfPath = 'assets/assets/docs/prosp.pdf';

    if (kIsWeb) {
      // Direct web trigger to open/download local asset PDF
      html.window.open(pdfPath, '_blank');
    } else {
      final Uri pdfUri = Uri.parse(pdfPath);
      if (await canLaunchUrl(pdfUri)) {
        await launchUrl(pdfUri, mode: LaunchMode.externalApplication);
      }
    }
  }

  final String sampleCode = '''
class HerHacks27 extends LEAFPathways {
  final int participants = 200;
  final String location = "University of Manchester (TBC)";
  final String date = "February 2027";

  void inspireNextGen() {
    buildTechnicalSkills();
    fosterPeerMentorship();
    empowerWomenInSTEM();
  }
}
''';

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 900;

    return Container(
      width: double.infinity,
      color: AppColors.darkBackground.withOpacity(0.7),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 40 : 60,
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Hero Call to Action
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: isMobile
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Badge Container
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.darkBackground,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 8,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: SizedBox(
                        height: isMobile ? 50 : 60,
                        child: Image.asset(
                          "assets/images/leafNoBg.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Inspiring the Next Generation of Women in STEM.',
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile ? 32 : 48,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '12 hours of innovation, collaboration, and problem-solving connecting 200 female students across college and university levels.',
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                      style: TextStyle(
                        color: AppColors.mutedText,
                        fontSize: isMobile ? 15 : 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Buttons: Stacked on Mobile, Row on Desktop
                    Flex(
                      direction: isMobile ? Axis.vertical : Axis.horizontal,
                      mainAxisSize:
                      isMobile ? MainAxisSize.max : MainAxisSize.min,
                      crossAxisAlignment: isMobile
                          ? CrossAxisAlignment.stretch
                          : CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryPurple,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 20,
                            ),
                          ),
                          onPressed: onGetInvolvedPressed,
                          child: const Text('Get Involved'),
                        ),
                        SizedBox(
                          height: isMobile ? 12 : 0,
                          width: isMobile ? 0 : 16,
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColors.neutralGrey),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 20,
                            ),
                          ),
                          onPressed: onDownloadProspectusPressed ?? _downloadProspectus,
                          child: const Text(
                            'Download Prospectus',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Hide Code Box on Mobile screens
              if (!isMobile) ...[
                const SizedBox(width: 40),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 450,
                    decoration: BoxDecoration(
                      color: AppColors.cardPurple.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.primaryPurple,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryPurple.withOpacity(0.4),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        margin: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.secondaryYellow,
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 6,
                                  backgroundColor: Colors.red[400],
                                ),
                                const SizedBox(width: 8),
                                CircleAvatar(
                                  radius: 6,
                                  backgroundColor: Colors.yellow[400],
                                ),
                                const SizedBox(width: 8),
                                CircleAvatar(
                                  radius: 6,
                                  backgroundColor: Colors.green[400],
                                ),
                              ],
                            ),
                            const Divider(
                              color: AppColors.neutralGrey,
                              height: 24,
                            ),
                            SelectableText(
                              sampleCode,
                              style: const TextStyle(
                                fontFamily: 'GeistPixel',
                                color: AppColors.secondaryYellow,
                                fontSize: 14,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}