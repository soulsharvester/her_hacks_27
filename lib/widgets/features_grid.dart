import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class FeaturesGrid extends StatelessWidget {
  const FeaturesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 900;

    const items = [
      _GridItem(
        icon: Icons.memory,
        title: 'COLLABORATE & BUILD',
        description:
        'Working in small teams of 1-4 people, you will scope a problem based on a theme, develop an innovative solution, and build a prototype.',
      ),
      _GridItem(
        icon: Icons.code,
        title: 'DEVELOPMENT CYCLE',
        description:
        'Gain hands-on experience across the entire product development cycle before presenting your work to a panel of judges.',
      ),
      _GridItem(
        icon: Icons.people_outline,
        title: 'MENTORSHIP',
        description:
        'Get direct access to industry professionals and technical mentors throughout the 12-hour building window.',
      ),
      _GridItem(
        icon: Icons.emoji_events_outlined,
        title: 'PRIZES',
        description:
        'Compete for prizes across multiple categories. Every submission gets hands-on feedback from industry professionals.',
      ),
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 80,
        horizontal: isMobile ? 20 : 40,
      ),
      color: AppColors.neutralGrey.withOpacity(0.4),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white12, width: 1),
          ),
          child: isMobile
              ? Column(
            children: items.map((item) {
              return Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.white12, width: 1),
                  ),
                ),
                child: item,
              );
            }).toList(),
          )
              : Column(
            children: [
              Row(
                children: [
                  Expanded(child: items[0]),
                  Expanded(child: items[1]),
                ],
              ),
              const Divider(height: 1, color: Colors.white12),
              Row(
                children: [
                  Expanded(child: items[2]),
                  Expanded(child: items[3]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GridItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _GridItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 900;

    return Container(
      padding: EdgeInsets.all(isMobile ? 24 : 40),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white12, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.secondaryYellow, size: 32),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'CalSans',
              fontSize: isMobile ? 18 : 22,
              color: Colors.white,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: const TextStyle(
              fontFamily: 'GeistPixel',
              fontSize: 13,
              color: AppColors.mutedText,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}