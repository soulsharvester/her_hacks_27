import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class SponsorsSection extends StatelessWidget {
  const SponsorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      color: Colors.black,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'OUR SPONSORS\n& PARTNERS.',
                    style: TextStyle(
                      fontFamily: 'CalSans',
                      fontSize: 56,
                      color: Colors.white,
                      height: 1.0,
                    ),
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
              const SizedBox(height: 60),

              // Sponsor callout banner
              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'BECOME A SPONSOR',
                            style: TextStyle(
                              fontFamily: 'GeistPixel',
                              color: AppColors.secondaryYellow,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'YOUR BRAND, IN FRONT OF 200+ AMBITIOUS FEMALE STUDENTS.',
                            style: TextStyle(
                              fontFamily: 'CalSans',
                              fontSize: 28,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.secondaryYellow,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'VIEW PROSPECTUS ↗',
                              style: TextStyle(
                                fontFamily: 'GeistPixel',
                                fontWeight: FontWeight.bold,
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