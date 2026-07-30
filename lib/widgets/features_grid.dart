import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class FeaturesGrid extends StatelessWidget {
  const FeaturesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      color: Colors.black.withOpacity(0.6),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          decoration: BoxDecoration(border: Border.all(color: Colors.white12, width: 1)),
          //Border.all(),
          child: Column(
            children: [
              Row(
                children: const [
                  Expanded(
                    child: _GridItem(
                      icon: Icons.memory,
                      title: 'COLLABORATE & BUILD',
                      description:
                      'Working in small teams of 1-4 people, you will scope a problem based on a theme, develop an innovative solution, and build a prototype.',
                    ),
                  ),
                  Expanded(
                    child: _GridItem(
                      icon: Icons.code,
                      title: 'DEVELOPMENT CYCLE',
                      description:
                      'Gain hands-on experience across the entire product development cycle before presenting your work to a panel of judges.',
                    ),
                  ),
                ],
              ),
              const Divider(height: 1, color: Colors.white12),
              Row(
                children: const [
                  Expanded(
                    child: _GridItem(
                      icon: Icons.people_outline,
                      title: 'MENTORSHIP',
                      description:
                      'Get direct access to industry professionals and technical mentors throughout the 12-hour building window.',
                    ),
                  ),
                  Expanded(
                    child: _GridItem(
                      icon: Icons.emoji_events_outlined,
                      title: 'PRIZES',
                      description:
                      'Compete for prizes across multiple categories. Every submission gets hands-on feedback from industry professionals.',
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
    return Container(
      padding: const EdgeInsets.all(40),
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
            style: const TextStyle(
              fontFamily: 'CalSans',
              fontSize: 22,
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