import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class SponsorshipTiers extends StatelessWidget {
  const SponsorshipTiers({super.key});

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
                'SPONSORSHIP PACKAGES',
                style: TextStyle(
                  color: AppColors.secondaryYellow,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Partner With Her Hacks \'27',
                style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 48),

              // Sponsorship Tier Cards
              Row(
                children: [
                  _tierCard('Silver', '£1,000', [
                    'Sponsor Table & CV Access',
                    'Logo on Website & Event Materials',
                    'Mentors & Workshop Host',
                  ]),
                  const SizedBox(width: 16),
                  _tierCard('Gold', '£2,000', [
                    'Sponsor Challenge & Prize',
                    '5 min Opening Speech',
                    'Logo on Signage & Materials',
                  ]),
                  const SizedBox(width: 16),
                  _tierCard(
                    'Platinum',
                    '£4,000',
                    [
                      '10 min Opening Speech',
                      'Branded Merchandise Rights',
                      'Full Event & Signage Branding',
                    ],
                    isFeatured: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tierCard(String name, String price, List<String> highlights, {bool isFeatured = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: isFeatured ? AppColors.cardPurple : AppColors.darkBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isFeatured ? AppColors.secondaryYellow : AppColors.primaryPurple,
            width: isFeatured ? 2.5 : 1.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isFeatured)
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.secondaryYellow,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'MOST POPULAR',
                  style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            Text(name, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(price, style: const TextStyle(color: AppColors.secondaryYellow, fontSize: 32, fontWeight: FontWeight.bold)),
            const Divider(color: AppColors.neutralGrey, height: 32),
            ...highlights.map((h) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: AppColors.secondaryYellow, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(h, style: const TextStyle(color: AppColors.mutedText, fontSize: 14)),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}