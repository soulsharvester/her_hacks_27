import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class EventSummary extends StatelessWidget {
  const EventSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkBackground,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // Statistics Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _statWidget('200', 'Female Students'),
                  _statWidget('12 Hrs', 'Innovation & Hack'),
                  _statWidget('50/50', 'College / Uni Duo Teams'),
                  _statWidget('Feb \'27', 'Event Target Date'),
                ],
              ),
              const SizedBox(height: 80),

              // Photo Gallery Placeholder Grid
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Moments from Past Hacks',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 24),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: List.generate(3, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.cardPurple,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.neutralGrey.withOpacity(0.3)),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.photo_library, color: AppColors.secondaryYellow, size: 40),
                          SizedBox(height: 8),
                          Text(
                            'Drive Photo Placeholder',
                            style: TextStyle(color: AppColors.mutedText, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statWidget(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            color: AppColors.secondaryYellow,
            fontSize: 42,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: AppColors.mutedText, fontSize: 16),
        ),
      ],
    );
  }
}