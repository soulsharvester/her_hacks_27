import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkBackground,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'HER HACKS \'27',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Let\'s change the world together.',
                    style: TextStyle(color: AppColors.mutedText, fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Contact: partnerships@leafpathways.com',
                    style: TextStyle(color: AppColors.secondaryYellow, fontSize: 14),
                  ),
                ],
              ),
              const Text(
                '© 2027 LEAF Pathways. All rights reserved.',
                style: TextStyle(color: AppColors.neutralGrey, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}