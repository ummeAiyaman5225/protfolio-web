import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../app/constants/app_colors.dart';
import '../app/constants/app_config.dart';
import '../utils/url_launcher_util.dart';
import '../utils/responsive.dart';

class CvViewerModal extends StatelessWidget {
  const CvViewerModal({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => const CvViewerModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 40,
        vertical: isMobile ? 24 : 40,
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 900),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCardBg : AppColors.lightCardBg,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 25,
              offset: Offset(0, 10),
            ),
          ],
          border: Border.all(
            color: isDark ? AppColors.darkAccent.withValues(alpha: 0.3) : AppColors.lightAccent.withValues(alpha: 0.3),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    'Curriculum Vitae',
                    style: TextStyle(
                      fontSize: isMobile ? 18 : 22,
                      fontWeight: FontWeight.bold,
                      color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                    ),
                  ),
                  const Spacer(),
                  // Download CV Button
                  ElevatedButton.icon(
                    onPressed: () {
                      // CV PDF upload here
                      UrlLauncherUtil.launchURL(AppConfig.cvPdfPath);
                    },
                    icon: const FaIcon(FontAwesomeIcons.download, size: 14),
                    label: Text(isMobile ? 'Download' : 'Download CV'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                      foregroundColor: isDark ? AppColors.darkBackground : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 12 : 18,
                        vertical: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Close Button
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                    tooltip: 'Close CV',
                    color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                  ),
                ],
              ),
            ),
            const Divider(height: 1),

            // Scrollable Content Area (Mockup & structured render of CV)
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top header
                    Center(
                      child: Column(
                        children: [
                          Text(
                            AppConfig.name.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isMobile ? 22 : 28,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.2,
                              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              AppConfig.primaryTitle.toUpperCase(),
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: isDark ? AppColors.darkBackground : Colors.white,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 16,
                            runSpacing: 8,
                            children: [
                              _cvHeaderInfo(Icons.phone, AppConfig.phone, isDark),
                              _cvHeaderInfo(Icons.email, AppConfig.email, isDark),
                              _cvHeaderInfo(Icons.location_on, AppConfig.location, isDark),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 16),

                    // Profile summary
                    _cvSectionTitle('PROFILE SUMMARY', isDark),
                    const SizedBox(height: 8),
                    Text(
                      'Flutter Developer with 1 year of professional experience building scalable cross-platform mobile applications for Android and iOS. Skilled in Flutter, Dart, Firebase, REST APIs, GetX, and React Native, with hands-on experience in application architecture, backend integration, and Play Store/App Store deployment. Passionate about developing high-performance, user-friendly mobile applications using clean architecture and modern development practices.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Work Experience
                    _cvSectionTitle('WORK EXPERIENCE', isDark),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Flutter Developer | Anzo Tech',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                          ),
                        ),
                        Text(
                          '1+ Years',
                          style: TextStyle(
                            fontSize: 13,
                            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _cvBulletPoint('Contributed to cross-platform mobile apps for Android & iOS using Flutter & Dart.', isDark),
                    _cvBulletPoint('Built pixel-perfect, reusable UI components following modern design principles.', isDark),
                    _cvBulletPoint('Integrated REST APIs, managed state using GetX, and implemented clean architecture.', isDark),
                    _cvBulletPoint('Implemented Firebase Authentication, Cloud Firestore, Cloud Messaging, Crashlytics, and Analytics.', isDark),
                    _cvBulletPoint('Collaborated with backend developers to integrate APIs and optimize data flow.', isDark),
                    _cvBulletPoint('Managed Google Play Store and Apple App Store deployment and release management.', isDark),
                    const SizedBox(height: 20),

                    // Education
                    _cvSectionTitle('EDUCATION', isDark),
                    const SizedBox(height: 8),
                    _cvEducationRow('MCA - Master of Computer Applications', 'Darshan University', '2024 – 2026', null, isDark),
                    _cvEducationRow('BCA - Bachelor of Computer Applications', 'Saurashtra University (71.00%)', '2021 – 2024', '71.00%', isDark),
                    _cvEducationRow('12th CBSE (Commerce)', 'CBSE Board', '2020 – 2021', '65.05%', isDark),
                    _cvEducationRow('10th CBSE', 'CBSE Board', '2017 – 2018', '60.00%', isDark),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cvHeaderInfo(IconData icon, String text, bool isDark) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: isDark ? AppColors.darkAccent : AppColors.lightAccent),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(
            fontSize: 13,
            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
          ),
        ),
      ],
    );
  }

  Widget _cvSectionTitle(String title, bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
            width: 2,
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.1,
          color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
        ),
      ),
    );
  }

  Widget _cvBulletPoint(String text, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ', style: TextStyle(color: isDark ? AppColors.darkAccent : AppColors.lightAccent, fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                height: 1.4,
                color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cvEducationRow(String title, String sub, String years, String? score, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary)),
                Text(sub, style: TextStyle(fontSize: 12, color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary)),
              ],
            ),
          ),
          Text(years, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: isDark ? AppColors.darkAccent : AppColors.lightAccent)),
        ],
      ),
    );
  }
}
