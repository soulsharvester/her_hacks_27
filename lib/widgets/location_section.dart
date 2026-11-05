import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';
import '../constants/app_colors.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:web/web.dart' as web;
import 'dart:ui_web' as ui_web;

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
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: _openMap,
                          child: _infoCard(
                            icon: Icons.location_on_outlined,
                            title: 'ADA, NATIONAL COLLEGE FOR DIGITAL SKILLS',
                            subtitle: 'VICTORIA, LONDON',
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
                    child: Container(
                      height: isMobile ? 240 : 340,
                      width: double.infinity,
                      decoration: BoxDecoration(
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: const InteractiveMapWidget(),
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
              debugPrint("Event has already occured in Earths Timeline");
            },
          ),
        ],
      ),
    );
  }
}

class InteractiveMapWidget extends StatelessWidget {
  const InteractiveMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      const String viewId = 'google-maps-iframe-view';

      ui_web.platformViewRegistry.registerViewFactory(
        viewId,
            (int id) {
          final iframe = web.HTMLIFrameElement()
            ..width = '100%'
            ..height = '100%'
            ..src = 'https://maps.google.com/maps?q=Ada+National+College+for+Digital+Skills+London&t=&z=14&ie=UTF8&iwloc=&output=embed';
          iframe.style.border = 'none';
          return iframe;
        },
      );

      return const HtmlElementView(viewType: viewId);
    } else {
      return Container(
        color: Colors.black54,
        child: const Center(
          child: Text(
            'Im unsure of how you ended up getting this message. Email me at hamzasaifworking@gmail.com to fix',
            style: TextStyle(color: AppColors.mutedText),
          ),
        ),
      );
    }
  }
}