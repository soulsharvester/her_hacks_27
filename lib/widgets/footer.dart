import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 900;

    return Container(
      color: AppColors.darkBackground,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 40 : 60,
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: isMobile
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: isMobile
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: const [
                  Text(
                    'HER HACKS \'27',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Let\'s change the world together.',
                    style: TextStyle(
                      color: AppColors.mutedText,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Contact: partnerships@leafpathways.com',
                    style: TextStyle(
                      color: AppColors.secondaryYellow,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: isMobile ? 24 : 0),
              Text(
                '© 2027 LEAF Pathways. All rights reserved.',
                textAlign: isMobile ? TextAlign.center : TextAlign.right,
                style: const TextStyle(
                  color: AppColors.neutralGrey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}