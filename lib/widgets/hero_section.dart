import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../app/constants/app_colors.dart';
import '../app/constants/app_config.dart';
import '../app/constants/app_strings.dart';
import '../utils/responsive.dart';
import '../utils/url_launcher_util.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewWorkPressed;
  final VoidCallback onContactPressed;

  const HeroSection({
    super.key,
    required this.onViewWorkPressed,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getHorizontalPadding(context),
        vertical: isMobile ? 20 : 30,
      ),
      child: Responsive(
        mobile: Column(
          children: [
            _buildProfileAvatar(context, isDark, 180),
            const SizedBox(height: 32),
            _buildHeroTextContent(context, isDark, isMobile: true),
          ],
        ),
        desktop: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: _buildHeroTextContent(context, isDark, isMobile: false),
            ),
            const SizedBox(width: 40),
            Expanded(
              flex: 4,
              child: Center(
                child: _buildProfileAvatar(context, isDark, 320),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileAvatar(BuildContext context, bool isDark, double size) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer Decorative Glow Ring
        Container(
          width: size + 20,
          height: size + 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                isDark ? AppColors.darkAccent : AppColors.lightAccent,
                AppColors.primaryAccent,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: (isDark ? AppColors.darkAccent : AppColors.lightAccent).withValues(alpha: 0.3),
                blurRadius: 25,
                spreadRadius: 4,
              ),
            ],
          ),
        ),
        // Main Avatar Container
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDark ? AppColors.darkCardBg : AppColors.lightCardBg,
            border: Border.all(
              color: isDark ? AppColors.darkBackground : Colors.white,
              width: 4,
            ),
          ),
          child: ClipOval(
            child: Image.asset(
              AppConfig.profileImagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: isDark ? AppColors.darkCardBg : AppColors.lightCardHover,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_rounded,
                        size: size * 0.45,
                        color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'UK',
                        style: TextStyle(
                          fontSize: size * 0.12,
                          fontWeight: FontWeight.bold,
                          color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        // Experience Badge Overlay
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkCardBg : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
              border: Border.all(
                color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.stars_rounded,
                  size: 18,
                  color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                ),
                const SizedBox(width: 6),
                Text(
                  AppConfig.experienceYears,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeroTextContent(BuildContext context, bool isDark, {required bool isMobile}) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Location Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkAccentGlow : AppColors.lightAccentGlow,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: (isDark ? AppColors.darkAccent : AppColors.lightAccent).withValues(alpha: 0.4),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.location_on_rounded,
                size: 14,
                color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
              ),
              const SizedBox(width: 6),
              Text(
                'Based in ${AppConfig.location}',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Greeting
        Text(
          AppStrings.heroGreeting,
          style: TextStyle(
            fontSize: isMobile ? 18 : 22,
            fontWeight: FontWeight.w500,
            color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
          ),
        ),
        const SizedBox(height: 8),

        // Name
        Text(
          AppConfig.name,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: isMobile ? 32 : 48,
            fontWeight: FontWeight.w900,
            height: 1.1,
            letterSpacing: 0.5,
            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
          ),
        ),
        const SizedBox(height: 12),

        // Roles
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 10,
          runSpacing: 8,
          children: [
            _roleBadge('Full-Stack Developer', isDark, false),
            _roleBadge('Flutter & Dart Specialist', isDark, false),
            _roleBadge('Firebase & REST APIs', isDark, false),
          ],
        ),
        const SizedBox(height: 20),

        // Primary Bio Description
        Text(
          AppStrings.heroDescription,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: isMobile ? 14 : 16,
            height: 1.6,
            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
          ),
        ),
        const SizedBox(height: 28),

        // // Action Buttons
        // Wrap(
        //   alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
        //   spacing: 12,
        //   runSpacing: 12,
        //   children: [
        //     ElevatedButton.icon(
        //       onPressed: onViewWorkPressed,
        //       icon: const Icon(Icons.folder_special_rounded, size: 18),
        //       label: const Text('View My Work'),
        //       style: ElevatedButton.styleFrom(
        //         backgroundColor: isDark ? AppColors.darkAccent : AppColors.lightAccent,
        //         foregroundColor: isDark ? AppColors.darkBackground : Colors.white,
        //         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        //         elevation: 3,
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(12),
        //         ),
        //       ),
        //     ),
        //     OutlinedButton.icon(
        //       onPressed: onContactPressed,
        //       icon: const Icon(Icons.mail_rounded, size: 18),
        //       label: const Text('Contact Me'),
        //       style: OutlinedButton.styleFrom(
        //         foregroundColor: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
        //         side: BorderSide(
        //           color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
        //         ),
        //         padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(12),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        // const SizedBox(height: 32),

        // Social Links
        Row(
          mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            _socialIconButton(
              iconWidget: const FaIcon(FontAwesomeIcons.github, size: 18),
              tooltip: 'GitHub Profile',
              onPressed: () => UrlLauncherUtil.launchURL(AppConfig.githubUrl),
              isDark: isDark,
            ),
            const SizedBox(width: 14),
            _socialIconButton(
              iconWidget: const FaIcon(FontAwesomeIcons.linkedinIn, size: 18),
              tooltip: 'LinkedIn Profile',
              onPressed: () => UrlLauncherUtil.launchURL(AppConfig.linkedinUrl),
              isDark: isDark,
            ),
            const SizedBox(width: 14),
            _socialIconButton(
              iconWidget: const Icon(Icons.email_rounded, size: 18),
              tooltip: 'Send Email',
              onPressed: () => UrlLauncherUtil.sendEmail(AppConfig.email),
              isDark: isDark,
            ),
            const SizedBox(width: 14),
            _socialIconButton(
              iconWidget: const Icon(Icons.phone_rounded, size: 18),
              tooltip: 'Call Phone',
              onPressed: () => UrlLauncherUtil.makePhoneCall(AppConfig.phoneFormatted),
              isDark: isDark,
            ),
          ],
        ),
      ],
    );
  }

  Widget _roleBadge(String text, bool isDark, bool isPrimary) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: isPrimary
            ? (isDark ? AppColors.darkAccent : AppColors.lightAccent)
            : (isDark ? AppColors.darkCardBg : AppColors.lightAccentGlow),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: isPrimary
              ? (isDark ? AppColors.darkBackground : Colors.white)
              : (isDark ? AppColors.darkAccent : AppColors.lightAccent),
        ),
      ),
    );
  }

  Widget _socialIconButton({
    required Widget iconWidget,
    required String tooltip,
    required VoidCallback onPressed,
    required bool isDark,
  }) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkCardBg : AppColors.lightCardBg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.05 : 0.04),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconTheme(
            data: IconThemeData(
              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            ),
            child: iconWidget,
          ),
        ),
      ),
    );
  }
}
