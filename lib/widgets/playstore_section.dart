import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../app/constants/app_colors.dart';
import '../data/projects_data.dart';
import '../models/project_model.dart';
import '../utils/responsive.dart';
import '../utils/url_launcher_util.dart';

class PlaystoreSection extends StatelessWidget {
  const PlaystoreSection({super.key});

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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 32,
                height: 3,
                color: AppColors.playStoreGreen,
              ),
              const SizedBox(width: 10),
              const Text(
                'PRODUCTION APPS',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: AppColors.playStoreGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Live on Google Play Store',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '3 Real-World Applications Published & Maintained on Google Play Store',
            style: TextStyle(
              fontSize: 14,
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
            ),
          ),
          const SizedBox(height: 36),

          // Play Store App Cards Grid
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 1024 ? 3 : (constraints.maxWidth > 650 ? 2 : 1);
              return Wrap(
                spacing: 20,
                runSpacing: 20,
                children: ProjectsData.playStoreApps.map((app) {
                  final double width = crossAxisCount == 1
                      ? constraints.maxWidth
                      : (constraints.maxWidth - (crossAxisCount - 1) * 20) / crossAxisCount;
                  return SizedBox(
                    width: width,
                    child: _buildPlayStoreCard(context, app, isDark),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPlayStoreCard(BuildContext context, ProjectModel app, bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCardBg : AppColors.lightCardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.playStoreGreen.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.playStoreGreen.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Badge & Image Area
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Container(
              height: 140,
              width: double.infinity,
              color: isDark ? const Color(0xFF0F261C) : const Color(0xFFE6F4EA),
              child: Stack(
                children: [
                  // Play Store project image upload here
                  if (app.imagePath != null)
                    Image.asset(
                      app.imagePath!,
                      width: double.infinity,
                      height: 140,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildPlayStoreImageFallback(app.title, isDark);
                      },
                    )
                  else
                    _buildPlayStoreImageFallback(app.title, isDark),

                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.playStoreGreen,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Row(
                        children: [
                          FaIcon(FontAwesomeIcons.googlePlay, size: 10, color: Colors.white),
                          SizedBox(width: 4),
                          Text(
                            'LIVE ON PLAY STORE',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  app.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  app.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.5,
                    color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                  ),
                ),
                const SizedBox(height: 16),

                // Features List
                ...app.features.map(
                  (f) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        const Icon(Icons.check, size: 14, color: AppColors.playStoreGreen),
                        const SizedBox(width: 6),
                        Text(
                          f,
                          style: TextStyle(
                            fontSize: 12,
                            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Tech Tags
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: app.technologies.map((t) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.playStoreGreen.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        t,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.playStoreGreen,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),

                // Play Store Button
                ElevatedButton.icon(
                  onPressed: () {
                    // Play Store URL here
                    if (app.playStoreUrl != null) {
                      UrlLauncherUtil.launchURL(app.playStoreUrl!);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Play Store link will be updated soon.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  icon: const FaIcon(FontAwesomeIcons.googlePlay, size: 14),
                  label: const Text('View on Play Store'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.playStoreGreen,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 42),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayStoreImageFallback(String title, bool isDark) {
    return Container(
      color: isDark ? const Color(0xFF0F261C) : const Color(0xFFE6F4EA),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(
              FontAwesomeIcons.googlePlay,
              size: 32,
              color: AppColors.playStoreGreen,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
