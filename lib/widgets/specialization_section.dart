import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../app/constants/app_colors.dart';
import '../utils/responsive.dart';

class SpecializationSection extends StatelessWidget {
  const SpecializationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);

    final specializations = [
      {
        'title': 'Flutter & Dart',
        'badge': 'PRIMARY EXPERTISE',
        'desc': 'Building high-performance, pixel-perfect, cross-platform Android and iOS applications with clean architecture and smooth 60fps animations.',
        'iconWidget': const FaIcon(FontAwesomeIcons.flutter, size: 24),
        'isPrimary': false,
        'tech': 'Flutter 3.x / Dart / Mobile & Web',
      },
      {
        'title': 'Firebase & Cloud Services',
        'badge': 'CORE BACKEND',
        'desc': 'Implementing real-time Firestore databases, Firebase Authentication (Email & Phone OTP), Cloud Messaging (FCM), Crashlytics, and Analytics.',
        'iconWidget': const FaIcon(FontAwesomeIcons.fire, size: 24),
        'isPrimary': false,
        'tech': 'Firestore / Auth / FCM / Cloud Functions',
      },
      {
        'title': 'Mobile Application Dev',
        'badge': 'ANDROID + IOS',
        'desc': 'Complete end-to-end mobile development lifecycle from UI design to API integration, state management, and Play Store / App Store publishing.',
        'iconWidget': const Icon(Icons.phone_iphone_rounded, size: 24),
        'isPrimary': false,
        'tech': 'Native Features / APIs / Deployment',
      },
      {
        'title': 'Node.js & REST APIs',
        'badge': 'BACKEND & INTEGRATION',
        'desc': 'Designing scalable REST APIs, backend service communication, payment gateway integrations, and real-time location services.',
        'iconWidget': const FaIcon(FontAwesomeIcons.nodeJs, size: 24),
        'isPrimary': false,
        'tech': 'Node.js / Express / REST APIs / Laravel',
      },
      {
        'title': 'HTML5 & Modern Web UI',
        'badge': 'WEB STANDARDS',
        'desc': 'Structuring responsive web layouts with modern semantic HTML markup, custom CSS tokens, and dark/light mode themes.',
        'iconWidget': const FaIcon(FontAwesomeIcons.html5, size: 24),
        'isPrimary': false,
        'tech': 'Semantic HTML / CSS3 / Responsive UI',
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
                'SPECIALIZATION',
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
            'What I Specialize In',
            style: TextStyle(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            ),
          ),
          const SizedBox(height: 36),

          // Cards Grid
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 1024 ? 3 : (constraints.maxWidth > 600 ? 2 : 1);
              return Wrap(
                spacing: 20,
                runSpacing: 20,
                children: specializations.map((spec) {
                  final double width = crossAxisCount == 1
                      ? constraints.maxWidth
                      : (constraints.maxWidth - (crossAxisCount - 1) * 20) / crossAxisCount;
                  return SizedBox(
                    width: width,
                    child: _buildSpecCard(spec, isDark),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSpecCard(Map<String, dynamic> spec, bool isDark) {
    final isPrimary = spec['isPrimary'] as bool;
    final Widget iconWidget = spec['iconWidget'] as Widget;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color:  isDark ? AppColors.darkCardBg : AppColors.lightCardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.darkAccentGlow : AppColors.lightAccentGlow,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: isPrimary
                      ? (isDark ? AppColors.darkAccent : AppColors.lightAccent)
                      : (isDark ? AppColors.darkBackground : AppColors.lightCardHover),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  spec['badge'] as String,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: isPrimary
                        ? (isDark ? AppColors.darkBackground : Colors.white)
                        : (isDark ? AppColors.darkAccent : AppColors.lightAccent),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            spec['title'] as String,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            spec['desc'] as String,
            style: TextStyle(
              fontSize: 13,
              height: 1.5,
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            spec['tech'] as String,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
            ),
          ),
        ],
      ),
    );
  }
}
