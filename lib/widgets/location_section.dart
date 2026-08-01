import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 900;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 80,
        horizontal: isMobile ? 20 : 40,
      ),
      color: AppColors.neutralGrey.withOpacity(0.4),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LOCATION',
                style: TextStyle(
                  fontFamily: 'CalSans',
                  fontSize: isMobile ? 36 : 64,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: isMobile ? 24 : 40),
              Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Info Cards & Countdown
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: Column(
                      children: [
                        _infoCard(
                          icon: Icons.location_on_outlined,
                          title: 'ADA, NATIONAL COLLEGE FOR DIGITAL SKILLS',
                          subtitle: 'VICTORIA, LONDON / MANCHESTER CAMPUS',
                          isMobile: isMobile,
                        ),
                        const SizedBox(height: 16),
                        _infoCard(
                          icon: Icons.calendar_today_outlined,
                          title: 'FEBRUARY 2027',
                          subtitle: 'SATURDAY, 08:00 TO 20:00',
                          isMobile: isMobile,
                        ),
                        const SizedBox(height: 16),
                        _countdownCard(isMobile: isMobile),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: isMobile ? 0 : 40,
                    height: isMobile ? 24 : 0,
                  ),

                  // Map placeholder box
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: Container(
                      height: isMobile ? 240 : 340,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        border: Border.all(color: Colors.white12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Placeholder(),
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

  static Widget _infoCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isMobile,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: Colors.black45,
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.secondaryYellow, size: isMobile ? 22 : 28),
          SizedBox(width: isMobile ? 12 : 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'CalSans',
                    color: Colors.white,
                    fontSize: isMobile ? 15 : 18,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: 'GeistPixel',
                    color: AppColors.secondaryYellow,
                    fontSize: isMobile ? 11 : 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  static Widget _countdownCard({required bool isMobile}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 16 : 24),
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
              _timerUnit('180', 'DAYS', isMobile),
              _timerUnit('12', 'HOURS', isMobile),
              _timerUnit('45', 'MINS', isMobile),
              _timerUnit('00', 'SECS', isMobile),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _timerUnit(String val, String unit, bool isMobile) {
    return Column(
      children: [
        Text(
          val,
          style: TextStyle(
            fontFamily: 'CalSans',
            fontSize: isMobile ? 24 : 32,
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