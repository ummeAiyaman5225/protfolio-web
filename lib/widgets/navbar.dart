import 'package:flutter/material.dart';
import '../app/constants/app_colors.dart';
import '../app/constants/app_config.dart';
import '../utils/responsive.dart';
import 'theme_switch.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  final Function(int) onNavItemSelected;
  final int activeSectionIndex;
  final bool isScrolled;

  const Navbar({
    super.key,
    required this.onNavItemSelected,
    required this.activeSectionIndex,
    this.isScrolled = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(isScrolled ? 60 : 75);

  static const List<String> navItems = [
    'Home',
    'About',
    'Skills',
    'Projects',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: preferredSize.height,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.getHorizontalPadding(context),
      ),
      decoration: BoxDecoration(
        color: (isDark ? AppColors.darkBackground : AppColors.lightBackground)
            .withValues(alpha: isScrolled ? 0.95 : 0.85),
        boxShadow: isScrolled
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                )
              ]
            : [],
        border: Border(
          bottom: BorderSide(
            color: isScrolled
                ? (isDark
                    ? AppColors.darkAccent.withValues(alpha: 0.2)
                    : AppColors.lightAccent.withValues(alpha: 0.2))
                : Colors.transparent,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Name/Brand Logo
          InkWell(
            onTap: () => onNavItemSelected(0),
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.darkAccentGlow : AppColors.lightAccentGlow,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                        width: 1.5,
                      ),
                    ),
                    child: Text(
                      'UK',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    AppConfig.name,
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 19,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Desktop Navigation Links
          if (!isMobile) ...[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(navItems.length, (index) {
                  final isActive = activeSectionIndex == index;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () => onNavItemSelected(index),
                      borderRadius: BorderRadius.circular(6),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              navItems[index],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                                color: isActive
                                    ? (isDark ? AppColors.darkAccent : AppColors.lightAccent)
                                    : (isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
                              ),
                            ),
                            const SizedBox(height: 2),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              height: 2,
                              width: isActive ? 20 : 0,
                              decoration: BoxDecoration(
                                color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(width: 16),

                // Theme Switch
                const ThemeSwitch(),
              ],
            ),
          ] else ...[
            // Mobile controls (Theme Switch + Hamburger Menu)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ThemeSwitch(),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.menu_rounded),
                  color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
