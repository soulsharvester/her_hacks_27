import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'LOCATION',
                style: TextStyle(
                  fontFamily: 'CalSans',
                  fontSize: 64,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        _infoCard(
                          icon: Icons.location_on_outlined,
                          title: 'ADA, NATIONAL COLLEGE FOR DIGITAL SKILLS',
                          subtitle: 'VICTORIA, LONDON / MANCHESTER CAMPUS',
                        ),
                        const SizedBox(height: 20),
                        _infoCard(
                          icon: Icons.calendar_today_outlined,
                          title: 'FEBRUARY 2027',
                          subtitle: 'SATURDAY, 08:00 TO 20:00',
                        ),
                        const SizedBox(height: 20),
                        _countdownCard(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 40),
                  // Map placeholder box
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 340,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        border: Border.all(color: Colors.white12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Placeholder()
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _infoCard({required IconData icon, required String title, required String subtitle}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black45,
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.secondaryYellow, size: 28),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'CalSans',
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: 'GeistPixel',
                    color: AppColors.secondaryYellow,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  static Widget _countdownCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black45,
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        children: [
          const Text(
            'DAYS UNTIL HACKATHON',
            style: TextStyle(
              fontFamily: 'GeistPixel',
              color: AppColors.mutedText,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _timerUnit('180', 'DAYS'),
              _timerUnit('12', 'HOURS'),
              _timerUnit('45', 'MINS'),
              _timerUnit('00', 'SECS'),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _timerUnit(String val, String unit) {
    return Column(
      children: [
        Text(
          val,
          style: const TextStyle(
            fontFamily: 'CalSans',
            fontSize: 32,
            color: AppColors.secondaryYellow,
          ),
        ),
        Text(
          unit,
          style: const TextStyle(
            fontFamily: 'GeistPixel',
            fontSize: 10,
            color: AppColors.mutedText,
          ),
        ),
      ],
    );
  }
}