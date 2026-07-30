import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CodePortraitHero extends StatelessWidget {
  const CodePortraitHero({super.key});

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
//test
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      color: AppColors.darkBackground,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.primaryPurple.withOpacity(0.3),
                        border: Border.all(color: AppColors.secondaryYellow),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Organised by LEAF Pathways",
                        style: TextStyle(color: AppColors.secondaryYellow, fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Inspiring the Next Generation of Women in STEM.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '12 hours of innovation, collaboration, and problem-solving connecting 200 female students across college and university levels.',
                      style: TextStyle(
                        color: AppColors.mutedText,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryPurple,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                          ),
                          onPressed: () {},
                          child: const Text('Get Involved'),
                        ),
                        const SizedBox(width: 16),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColors.neutralGrey),
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                          ),
                          onPressed: () {},
                          child: const Text('Download Prospectus', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 40),

              // Code Effect Canvas Container
              Expanded(
                flex: 1,
                child: Container(
                  height: 450,
                  decoration: BoxDecoration(
                    color: AppColors.cardPurple,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.primaryPurple, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryPurple.withOpacity(0.4),
                        blurRadius: 20,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Simulated ASCII/Code Matrix overlay background
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: SingleChildScrollView(
                            child: Text(
                              List.generate(30, (_) => sampleCode).join('\n'),
                              style: TextStyle(
                                fontFamily: 'monospace',
                                color: AppColors.neutralGrey.withOpacity(0.25),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Foreground Code Box
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          margin: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.85),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.secondaryYellow, width: 1.5),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(radius: 6, backgroundColor: Colors.red[400]),
                                  const SizedBox(width: 8),
                                  CircleAvatar(radius: 6, backgroundColor: Colors.yellow[400]),
                                  const SizedBox(width: 8),
                                  CircleAvatar(radius: 6, backgroundColor: Colors.green[400]),
                                ],
                              ),
                              const Divider(color: AppColors.neutralGrey, height: 24),
                              SelectableText(
                                sampleCode,
                                style: const TextStyle(
                                  fontFamily: 'monospace',
                                  color: AppColors.secondaryYellow,
                                  fontSize: 14,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}