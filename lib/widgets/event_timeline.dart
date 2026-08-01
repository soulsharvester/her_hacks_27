import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class EventTimeline extends StatelessWidget {
  const EventTimeline({super.key});

  static const schedule = [
    {'time': '08:00', 'event': 'Doors Open & Registration'},
    {'time': '09:00', 'event': 'Opening Ceremony & Theme Reveal'},
    {'time': '10:00', 'event': 'Hacking Begins'},
    {'time': '13:00', 'event': 'Lunch Break'},
    {'time': '18:00', 'event': 'Hacking Ends, Submissions Close'},
    {'time': '19:00', 'event': 'Judging Period'},
    {'time': '20:00', 'event': 'Awards Ceremony & Closing'},
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 900;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 80,
        horizontal: isMobile ? 20 : 40,
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column / Header Section
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isMobile ? 'EVENT TIMELINE' : 'EVENT\nTIMELINE',
                      style: TextStyle(
                        fontFamily: 'CalSans',
                        fontSize: isMobile ? 36 : 64,
                        color: Colors.white,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '12 HOURS OF BUILDING, FROM DOORS OPEN TO AWARDS CEREMONY.',
                      style: TextStyle(
                        fontFamily: 'GeistPixel',
                        color: AppColors.mutedText,
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),

                    // Show image only on Desktop
                    if (!isMobile) ...[
                      const SizedBox(height: 32),
                      Container(
                        height: 240,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.white12, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryPurple.withOpacity(0.2),
                              blurRadius: 15,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/images/womanExplainingLeaf.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              SizedBox(
                width: isMobile ? 0 : 60,
                height: isMobile ? 32 : 0,
              ),

              // Right Column / Timeline Items
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Column(
                  children: schedule.map((item) {
                    final isHighlighted = item['time'] == '20:00';
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          const Icon(Icons.circle, color: AppColors.secondaryYellow, size: 8),
                          SizedBox(width: isMobile ? 12 : 24),
                          Text(
                            item['time']!,
                            style: const TextStyle(
                              fontFamily: 'GeistPixel',
                              color: AppColors.secondaryYellow,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(width: isMobile ? 16 : 32),
                          Expanded(
                            child: Text(
                              item['event']!,
                              style: TextStyle(
                                fontFamily: 'GeistPixel',
                                color: isHighlighted ? AppColors.secondaryYellow : Colors.white,
                                fontSize: isMobile ? 13 : 16,
                                fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}