import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class Navbar extends StatelessWidget {
  final VoidCallback? onRegisterPressed;
  final VoidCallback? onSponsorPressed;

  const Navbar({
    super.key,
    this.onRegisterPressed,
    this.onSponsorPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkBackground.withOpacity(0.95),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Brand Logo
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.secondaryYellow, width: 1.5),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'HER HACKS',
                      style: TextStyle(
                        fontFamily: 'CalSans',
                        fontSize: 18,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),

              // Registration-first Nav Links
              Row(
                children: [
                  _navLink('About'),
                  _navLink('Timeline'),
                  _navLink('Location'),
                  _navLink('Highlights'),
                  _navLink('Sponsors'),
                ],
              ),

              // Action Buttons
              Row(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.secondaryYellow),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    onPressed: onSponsorPressed,
                    child: const Text(
                      'SPONSOR',
                      style: TextStyle(
                        fontFamily: 'GeistPixel',
                        color: AppColors.secondaryYellow,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryPurple,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    onPressed: onRegisterPressed,
                    child: const Text(
                      'REGISTER NOW',
                      style: TextStyle(
                        fontFamily: 'CalSans',
                        color: Colors.white,
                        fontSize: 14,
                      ),
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

  static Widget _navLink(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontFamily: 'GeistPixel',
          color: AppColors.mutedText,
          fontSize: 13,
        ),
      ),
    );
  }
}