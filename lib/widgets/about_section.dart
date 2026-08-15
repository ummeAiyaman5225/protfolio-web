import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../app/constants/app_colors.dart';
import '../app/constants/app_strings.dart';
import '../utils/responsive.dart';
import '../utils/url_launcher_util.dart';
import 'cv_viewer_modal.dart';

class AboutSection extends StatelessWidget {
  final VoidCallback? onViewWorkPressed;
  final VoidCallback? onContactPressed;

  const AboutSection({
    super.key,
    this.onViewWorkPressed,
    this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getHorizontalPadding(context),
        vertical: isMobile ? 40 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('About Me', 'Get to know my journey & background', isDark),
          const SizedBox(height: 40),
          Responsive(
            mobile: Column(
              children: [
                _buildDescriptionText(context, isDark, isMobile: true),
                const SizedBox(height: 32),
                _buildStatsGrid(isDark, isMobile: true),
              ],
            ),
            desktop: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: _buildDescriptionText(context, isDark, isMobile: false),
                ),
                const SizedBox(width: 48),
                Expanded(
                  flex: 5,
                  child: _buildStatsGrid(isDark, isMobile: false),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String subtitle, bool isDark) {
    return Column(
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
              title.toUpperCase(),
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
          subtitle,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionText(BuildContext context, bool isDark, {required bool isMobile}) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCardBg : AppColors.lightCardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.aboutDescription,
            style: TextStyle(
              fontSize: 15,
              height: 1.7,
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 20),

          // About Section Action Buttons (View Work, View CV, Download CV, Contact Me)
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              // Primary: View Work
              ElevatedButton.icon(
                onPressed: onViewWorkPressed,
                icon: const Icon(Icons.folder_special_rounded, size: 16),
                label: const Text('View Work'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                  foregroundColor: isDark ? AppColors.darkBackground : Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              // View CV
              ElevatedButton.icon(
                onPressed: () => CvViewerModal.show(context),
                icon: const Icon(Icons.description_rounded, size: 16),
                label: const Text('View CV'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDark ? AppColors.darkCardHover : AppColors.lightAccentGlow,
                  foregroundColor: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                  elevation: 0,
                  side: BorderSide(
                    color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              // Download CV
              ElevatedButton.icon(
                onPressed: () => UrlLauncherUtil.launchURL(CvViewerModal.cvImagePath),
                icon: const FaIcon(FontAwesomeIcons.download, size: 14),
                label: const Text('Download CV'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDark ? AppColors.darkCardHover : AppColors.lightAccentGlow,
                  foregroundColor: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                  elevation: 0,
                  side: BorderSide(
                    color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              // Secondary: Contact Me
              OutlinedButton.icon(
                onPressed: onContactPressed,
                icon: const Icon(Icons.mail_rounded, size: 16),
                label: const Text('Contact Me'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                  side: BorderSide(
                    color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(bool isDark, {required bool isMobile}) {
    final stats = [
      {'number': '1+', 'label': 'Years Experience', 'sub': 'Full-Stack & Mobile'},
      {'number': 'Cross', 'label': 'Android & iOS', 'sub': 'Flutter Specialist'},
      {'number': '5+', 'label': 'Production Repos', 'sub': 'GitHub Projects'},
      {'number': '3', 'label': 'Live Play Store Apps', 'sub': 'Production Published'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: isMobile ? 1.25 : 1.35,
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        final item = stats[index];
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkCardBg : AppColors.lightCardBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDark ? AppColors.darkAccentGlow : AppColors.lightAccentGlow,
            ),
            boxShadow: [
              BoxShadow(
                color: (isDark ? AppColors.darkAccent : AppColors.lightAccent).withValues(alpha: isDark ? 0.04 : 0.06),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['number']!,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                item['label']!,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                item['sub']!,
                style: TextStyle(
                  fontSize: 11,
                  color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
