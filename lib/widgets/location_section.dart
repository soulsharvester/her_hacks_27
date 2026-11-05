import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  Future<void> _openMap() async {
    final Uri googleMapsUrl = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=Ada+National+College+for+Digital+Skills+London',
    );
    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
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
                        InkWell(
                          onTap: _openMap,
                          child: _infoCard(
                            icon: Icons.location_on_outlined,
                            title: 'ADA, NATIONAL COLLEGE FOR DIGITAL SKILLS',
                            subtitle: 'VICTORIA, LONDON (CLICK TO VIEW MAP)',
                            isMobile: isMobile,
                            isInteractive: true,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _infoCard(
                          icon: Icons.calendar_today_outlined,
                          title: '6TH FEBRUARY 2027',
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
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: GestureDetector(
                      onTap: _openMap,
                      child: Container(
                        height: isMobile ? 240 : 340,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.cardPurple.withOpacity(0.5),
                          border: Border.all(color: AppColors.secondaryYellow
                              .withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Background styling to look like a map preview container
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    border: Border.all(color: Colors.white12),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.map_outlined,
                                      size: 64,
                                      color: AppColors.secondaryYellow,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Action prompt overlay
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: AppColors.secondaryYellow),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.open_in_new,
                                      color: AppColors.secondaryYellow,
                                      size: 16),
                                  SizedBox(width: 8),
                                  Text(
                                    'OPEN IN GOOGLE MAPS',
                                    style: TextStyle(
                                      fontFamily: 'GeistPixel',
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
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
    bool isInteractive = false,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: Colors.black45,
        border: Border.all(
          color: isInteractive
              ? AppColors.secondaryYellow.withOpacity(0.6)
              : Colors.white12,
        ),
      ),
      child: Row(
        children: [
          Icon(
              icon, color: AppColors.secondaryYellow, size: isMobile ? 22 : 28),
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
                    color: isInteractive ? Colors.white70 : AppColors
                        .secondaryYellow,
                    fontSize: isMobile ? 11 : 12,
                  ),
                ),
              ],
            ),
          ),
          if (isInteractive) ...[
            const SizedBox(width: 8),
            const Icon(
                Icons.arrow_forward_ios, color: AppColors.secondaryYellow,
                size: 14),
          ]
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


  static Widget _countdownCard({required bool isMobile}) {
    final DateTime targetDate = DateTime(2027, 2, 1, 8, 0, 0);

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
          TimerCountdown(
            format: CountDownTimerFormat.daysHoursMinutesSeconds,
            endTime: targetDate,
            enableDescriptions: true,
            daysDescription: "DAYS",
            hoursDescription: "HOURS",
            minutesDescription: "MINS",
            secondsDescription: "SECS",
            timeTextStyle: TextStyle(
              fontFamily: 'CalSans',
              fontSize: isMobile ? 24 : 32,
              color: AppColors.secondaryYellow,
            ),
            descriptionTextStyle: const TextStyle(
              fontFamily: 'GeistPixel',
              fontSize: 10,
              color: AppColors.mutedText,
            ),
            onEnd: () {
              debugPrint("Countdown ended!");
            },
          ),
        ],
      ),
    );
  }
}