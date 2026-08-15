import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../app/constants/app_colors.dart';
import '../app/constants/app_config.dart';
import '../utils/responsive.dart';
import '../utils/url_launcher_util.dart';
import 'navbar.dart';

class Footer extends StatelessWidget {
  final Function(int) onNavItemSelected;

  const Footer({
    super.key,
    required this.onNavItemSelected,
  });

  static const List<String> navItems = Navbar.navItems;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getHorizontalPadding(context),
        vertical: 40,
      ),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF071224) : const Color(0xFFE2E8F0),
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
        ),
      ),
      child: Column(
        children: [
          Responsive(
            mobile: Column(
              children: [
                _buildBrandInfo(isDark),
                const SizedBox(height: 24),
                _buildQuickLinks(isDark),
                const SizedBox(height: 24),
                _buildSocialIcons(isDark),
              ],
            ),
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 4, child: _buildBrandInfo(isDark)),
                Expanded(flex: 5, child: _buildQuickLinks(isDark)),
                Expanded(flex: 3, child: _buildSocialIcons(isDark)),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 20),
          Text(
            '© 2026 ${AppConfig.name}. All Rights Reserved.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandInfo(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConfig.name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          '${AppConfig.primaryTitle} | Full-Stack Developer',
          style: TextStyle(
            fontSize: 13,
            color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickLinks(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          children: List.generate(navItems.length, (index) {
            return InkWell(
              onTap: () => onNavItemSelected(index),
              child: Text(
                navItems[index],
                style: TextStyle(
                  fontSize: 13,
                  color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildSocialIcons(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Social Connections',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.github, size: 18),
              onPressed: () => UrlLauncherUtil.launchURL(AppConfig.githubUrl),
              tooltip: 'GitHub',
              color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
            ),
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.linkedinIn, size: 18),
              onPressed: () => UrlLauncherUtil.launchURL(AppConfig.linkedinUrl),
              tooltip: 'LinkedIn',
              color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
            ),
            IconButton(
              icon: const Icon(Icons.email_rounded, size: 20),
              onPressed: () => UrlLauncherUtil.sendEmail(AppConfig.email),
              tooltip: 'Email',
              color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
            ),
          ],
        ),
      ],
    );
  }
}
