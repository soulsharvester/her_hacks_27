import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class Navbar extends StatelessWidget {
  final VoidCallback? onAboutPressed;
  final VoidCallback? onTimelinePressed;
  final VoidCallback? onLocationPressed;
  final VoidCallback? onHighlightsPressed;
  final VoidCallback? onSponsorsPressed;
  final VoidCallback? onRegisterPressed;
  final VoidCallback? onSponsorPressed;

  const Navbar({
    super.key,
    this.onAboutPressed,
    this.onTimelinePressed,
    this.onLocationPressed,
    this.onHighlightsPressed,
    this.onSponsorsPressed,
    this.onRegisterPressed,
    this.onSponsorPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 900;

    return Container(
      color: AppColors.darkBackground.withOpacity(0.95),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 40,
        vertical: isMobile ? 14 : 16, // Slightly taller height allowance for mobile
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isMobile
              ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Row 1: Brand Logo & Primary Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 36,
                    child: Image.asset(
                      "assets/images/herLeafIcon.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Row(
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.secondaryYellow),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        ),
                        onPressed: onSponsorPressed,
                        child: const Text(
                          'SPONSOR',
                          style: TextStyle(
                            fontFamily: 'GeistPixel',
                            color: AppColors.secondaryYellow,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryPurple,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                        onPressed: onRegisterPressed,
                        child: const Text(
                          'REGISTER NOW',
                          style: TextStyle(
                            fontFamily: 'CalSans',
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Row 2: Responsive Wrap layout fitting all links without scrollbars
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 4,
                runSpacing: 6,
                children: [
                  _navLink('About', onTap: onAboutPressed),
                  _navLink('Timeline', onTap: onTimelinePressed),
                  _navLink('Location', onTap: onLocationPressed),
                  _navLink('Highlights', onTap: onHighlightsPressed),
                  _navLink('Sponsors', onTap: onSponsorsPressed),
                ],
              ),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Brand Logo
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: SizedBox(
                      height: 50,
                      child: Image.asset("assets/images/herLeafIcon.png"),
                    ),
                  ),
                ],
              ),

              // Nav Links
              Row(
                children: [
                  _navLink('About', onTap: onAboutPressed),
                  _navLink('Timeline', onTap: onTimelinePressed),
                  _navLink('Location', onTap: onLocationPressed),
                  _navLink('Highlights', onTap: onHighlightsPressed),
                  _navLink('Sponsors', onTap: onSponsorsPressed),
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

  static Widget _navLink(String title, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Text(
          title.toUpperCase(),
          style: const TextStyle(
            fontFamily: 'GeistPixel',
            color: AppColors.mutedText,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}