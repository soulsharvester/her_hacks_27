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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column: Title, Subtitle & Image Asset
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'EVENT\nTIMELINE',
                      style: TextStyle(
                        fontFamily: 'CalSans',
                        fontSize: 64,
                        color: Colors.white,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      '12 HOURS OF BUILDING, FROM DOORS OPEN TO AWARDS CEREMONY.',
                      style: TextStyle(
                        fontFamily: 'GeistPixel',
                        color: AppColors.mutedText,
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Added Asset Image Container
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
                          'assets/images/womanExplainingLeaf.png', // Change to any preferred PNG
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 60),

              // Right Column: Timeline Items
              Expanded(
                flex: 1,
                child: Column(
                  children: schedule.map((item) {
                    final isHighlighted = item['time'] == '20:00';
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Row(
                        children: [
                          const Icon(Icons.circle, color: AppColors.secondaryYellow, size: 8),
                          const SizedBox(width: 24),
                          Text(
                            item['time']!,
                            style: const TextStyle(
                              fontFamily: 'GeistPixel',
                              color: AppColors.secondaryYellow,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 32),
                          Expanded(
                            child: Text(
                              item['event']!,
                              style: TextStyle(
                                fontFamily: 'GeistPixel',
                                color: isHighlighted ? AppColors.secondaryYellow : Colors.white,
                                fontSize: 16,
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