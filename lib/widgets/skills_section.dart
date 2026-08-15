import 'package:flutter/material.dart';
import '../app/constants/app_colors.dart';
import '../data/skills_data.dart';
import '../models/skill_model.dart';
import '../utils/responsive.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = Responsive.isMobile(context);

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
                'SKILLS & TECH STACK',
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
            'Technologies & Expertise',
            style: TextStyle(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            ),
          ),
          const SizedBox(height: 36),

          // Skill Categories Grid
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 1024 ? 3 : (constraints.maxWidth > 650 ? 2 : 1);
              return Wrap(
                spacing: 20,
                runSpacing: 20,
                children: SkillsData.categories.map((category) {
                  final double width = crossAxisCount == 1
                      ? constraints.maxWidth
                      : (constraints.maxWidth - (crossAxisCount - 1) * 20) / crossAxisCount;
                  return SizedBox(
                    width: width,
                    child: _buildSkillCategoryCard(category, isDark),
                  );
                }).toList(),
              );
            },
          ),
          const SizedBox(height: 36),

          // Languages Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkCardBg : AppColors.lightCardBg,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
              ),
            ),
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.language_rounded,
                            color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                            size: 22,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Languages Spoken: ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: SkillsData.languages.map((lang) {
                          return Chip(
                            label: Text(lang, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                            backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightCardHover,
                            side: BorderSide(
                              color: (isDark ? AppColors.darkAccent : AppColors.lightAccent).withValues(alpha: 0.3),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Icon(
                        Icons.language_rounded,
                        color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                        size: 22,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Languages Spoken: ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: SkillsData.languages.map((lang) {
                            return Chip(
                              label: Text(lang, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                              backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightCardHover,
                              side: BorderSide(
                                color: (isDark ? AppColors.darkAccent : AppColors.lightAccent).withValues(alpha: 0.3),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCategoryCard(SkillCategory category, bool isDark) {
    IconData categoryIcon;
    switch (category.iconName) {
      case 'mobile':
        categoryIcon = Icons.phone_iphone_rounded;
        break;
      case 'backend':
        categoryIcon = Icons.storage_rounded;
        break;
      case 'state':
        categoryIcon = Icons.account_tree_rounded;
        break;
      case 'integrations':
        categoryIcon = Icons.extension_rounded;
        break;
      case 'tools':
        categoryIcon = Icons.handyman_rounded;
        break;
      case 'deployment':
        categoryIcon = Icons.cloud_upload_rounded;
        break;
      default:
        categoryIcon = Icons.code_rounded;
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCardBg : AppColors.lightCardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.darkAccentGlow : AppColors.lightAccentGlow,
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkAccentGlow : AppColors.lightAccentGlow,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  categoryIcon,
                  size: 20,
                  color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  category.categoryName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Skill Chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: category.skills.map((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkBackground : AppColors.lightCardHover,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isDark
                        ? AppColors.darkAccent.withValues(alpha: 0.2)
                        : AppColors.lightAccent.withValues(alpha: 0.2),
                  ),
                ),
                child: Text(
                  skill,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
