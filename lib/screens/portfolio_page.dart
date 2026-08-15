import 'package:flutter/material.dart';
import '../app/constants/app_colors.dart';
import '../app/constants/app_config.dart';
import '../widgets/navbar.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/specialization_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/education_section.dart';
import '../widgets/hobbies_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer.dart';
import '../widgets/theme_switch.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  // Keys for: 0: Home, 1: About, 2: Skills, 3: Projects, 4: Contact
  final List<GlobalKey> _sectionKeys = List.generate(5, (_) => GlobalKey());

  int _activeSectionIndex = 0;
  bool _isScrolled = false;
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final double offset = _scrollController.offset;
    if (offset > 50 && !_isScrolled) {
      setState(() => _isScrolled = true);
    } else if (offset <= 50 && _isScrolled) {
      setState(() => _isScrolled = false);
    }

    if (offset > 400 && !_showBackToTop) {
      setState(() => _showBackToTop = true);
    } else if (offset <= 400 && _showBackToTop) {
      setState(() => _showBackToTop = false);
    }

    // Determine active section index
    for (int i = _sectionKeys.length - 1; i >= 0; i--) {
      final context = _sectionKeys[i].currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero);
          if (position.dy <= 160) {
            if (_activeSectionIndex != i) {
              setState(() => _activeSectionIndex = i);
            }
            break;
          }
        }
      }
    }
  }

  void _scrollToSection(int index) {
    if (index >= 0 && index < _sectionKeys.length) {
      final context = _sectionKeys[index].currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      endDrawer: _buildMobileDrawer(context, isDark),
      body: Stack(
        children: [
          // Scrollable Body Content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 70), // Spacer for sticky navbar
                Container(
                  key: _sectionKeys[0],
                  child: HeroSection(
                    onViewWorkPressed: () => _scrollToSection(3), // Projects
                    onContactPressed: () => _scrollToSection(4), // Contact
                  ),
                ),
                Container(
                  key: _sectionKeys[1],
                  child: AboutSection(
                    onViewWorkPressed: () => _scrollToSection(3),
                    onContactPressed: () => _scrollToSection(4),
                  ),
                ),
                const SpecializationSection(),
                Container(
                  key: _sectionKeys[2],
                  child: const SkillsSection(),
                ),
                const ExperienceSection(),
                Container(
                  key: _sectionKeys[3],
                  child: const ProjectsSection(),
                ),
                const EducationSection(),
                const HobbiesSection(),
                Container(
                  key: _sectionKeys[4],
                  child: const ContactSection(),
                ),
                Footer(onNavItemSelected: _scrollToSection),
              ],
            ),
          ),

          // Fixed Top Navbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              onNavItemSelected: _scrollToSection,
              activeSectionIndex: _activeSectionIndex,
              isScrolled: _isScrolled,
            ),
          ),
        ],
      ),

      // Floating Back To Top Button
      floatingActionButton: _showBackToTop
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: isDark ? AppColors.darkAccent : AppColors.lightAccent,
              foregroundColor: isDark ? AppColors.darkBackground : Colors.white,
              tooltip: 'Back to Top',
              child: const Icon(Icons.arrow_upward_rounded),
            )
          : null,
    );
  }

  Widget _buildMobileDrawer(BuildContext context, bool isDark) {
    const navItems = Navbar.navItems;

    return Drawer(
      backgroundColor: isDark ? AppColors.darkCardBg : AppColors.lightCardBg,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    AppConfig.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                    ),
                  ),
                  const Spacer(),
                  const ThemeSwitch(),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: navItems.length,
                itemBuilder: (context, index) {
                  final isActive = _activeSectionIndex == index;
                  return ListTile(
                    title: Text(
                      navItems[index],
                      style: TextStyle(
                        fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                        color: isActive
                            ? (isDark ? AppColors.darkAccent : AppColors.lightAccent)
                            : (isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
