import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../app/constants/app_colors.dart';
import '../app/constants/app_strings.dart';
import '../utils/responsive.dart';

class HobbiesSection extends StatelessWidget {
  const HobbiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);

    final hobbies = [
      {
        'title': 'Travel',
        'desc': 'Exploring new places, cultures, and gaining fresh perspectives on world design and lifestyle.',
        'iconWidget': const Icon(Icons.flight_takeoff_rounded, size: 24),
      },
      {
        'title': 'Motorcycling',
        'desc': 'Passion for riding open roads, focus, discipline, and enjoying the freedom of two wheels.',
        'iconWidget': const FaIcon(FontAwesomeIcons.motorcycle, size: 22),
      },
      {
        'title': 'Continuous Learning',
        'desc': 'Constantly discovering modern tech stacks, frameworks, design patterns, and engineering habits.',
        'iconWidget': const Icon(Icons.psychology_rounded, size: 24),
      },
      {
        'title': 'Entrepreneurship & Business',
        'desc': 'Fascinated by product strategy, turning ideas into scalable ventures, and user-centric business value.',
        'iconWidget': const Icon(Icons.storefront_rounded, size: 24),
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getHorizontalPadding(context),
        vertical: isMobile ? 20 : 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 32,
                height: 3,
                color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
              ),
              const SizedBox(width: 10),
              Text(
                'PERSONAL LIFE & PASSIONS',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Beyond Coding',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            AppStrings.beyondCodingText,
            style: TextStyle(
              fontSize: 14,
              height: 1.6,
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
            ),
          ),
          const SizedBox(height: 36),

          // 4 Visual Cards Grid
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 1024 ? 4 : (constraints.maxWidth > 600 ? 2 : 1);
              return Wrap(
                spacing: 16,
                runSpacing: 16,
                children: hobbies.map((h) {
                  final double width = crossAxisCount == 1
                      ? constraints.maxWidth
                      : (constraints.maxWidth - (crossAxisCount - 1) * 16) / crossAxisCount;
                  return SizedBox(
                    width: width,
                    child: _buildHobbyCard(h, isDark),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHobbyCard(Map<String, dynamic> hobby, bool isDark) {
    final Widget iconWidget = hobby['iconWidget'] as Widget;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCardBg : AppColors.lightCardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? const Color(0xFF233554) : const Color(0xFFE2E8F0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkAccentGlow : AppColors.lightAccentGlow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconTheme(
              data: IconThemeData(
                color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
              ),
              child: iconWidget,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            hobby['title'] as String,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            hobby['desc'] as String,
            style: TextStyle(
              fontSize: 12,
              height: 1.5,
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
