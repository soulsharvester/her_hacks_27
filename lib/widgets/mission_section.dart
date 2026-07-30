import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class MissionSection extends StatelessWidget {
  const MissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              const Text(
                'OUR MISSION',
                style: TextStyle(
                  fontFamily: 'CalSans',
                  color: AppColors.secondaryYellow,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Empowering Tomorrow\'s Innovators Today',
                style: TextStyle(color: Colors.white, fontFamily: 'CalSans', fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoCard(
                    title: 'Empowerment Platform',
                    description:
                    'Her Hacks \'27 gives female students a platform to build technical skills, confidence, and connections across STEM.',
                  ),
                  const SizedBox(width: 24),
                  _infoCard(
                    title: 'Proven Network',
                    description:
                    'Backed by LEAF Pathways, which has supported over 10,000 students nationwide through school talks, competitions, and hackathons.',
                  ),
                  const SizedBox(width: 24),
                  _infoCard(
                    title: 'Peer Mentorship Model',
                    description:
                    'Teams are formed by pairing sixth-form/college duos with university duos, creating built-in peer mentoring.',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoCard({required String title, required String description}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.cardPurple,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primaryPurple),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppColors.secondaryYellow,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(color: AppColors.mutedText, fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}