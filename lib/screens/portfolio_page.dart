import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../app/constants/app_colors.dart';
import '../app/constants/app_config.dart';
import '../utils/url_launcher_util.dart';
import '../widgets/navbar.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/specialization_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/playstore_section.dart';
import '../widgets/education_section.dart';
import '../widgets/hobbies_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer.dart';
import '../widgets/cv_viewer_modal.dart';
import '../widgets/theme_switch.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(8, (_) => GlobalKey());

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
          if (position.dy <= 150) {
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
                const SizedBox(height: 75), // Spacer for sticky navbar
                Container(key: _sectionKeys[0], child: HeroSection(
                  onViewWorkPressed: () => _scrollToSection(5), // Projects
                  onContactPressed: () => _scrollToSection(7), // Contact
                )),
                Container(key: _sectionKeys[1], child: const AboutSection()),
                Container(key: _sectionKeys[2], child: const SpecializationSection()),
                Container(key: _sectionKeys[3], child: const SkillsSection()),
                Container(key: _sectionKeys[4], child: const ExperienceSection()),
                Container(key: _sectionKeys[5], child: const ProjectsSection()),
                const PlaystoreSection(),
                Container(key: _sectionKeys[6], child: const EducationSection()),
                const HobbiesSection(),
                Container(key: _sectionKeys[7], child: const ContactSection()),
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
    final navItems = [
      'Home',
      'About',
      'Specialization',
      'Skills',
      'Experience',
      'Projects',
      'Education',
      'Contact',
    ];

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
                    color: isDark ? const Color(0xFF233554) : const Color(0xFFE2E8F0),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    AppConfig.name,
                    style: TextStyle(
                      fontSize: 18,
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
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      CvViewerModal.show(context);
                    },
                    icon: const Icon(Icons.description_outlined, size: 16),
                    label: const Text('View CV'),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 44),
                      foregroundColor: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                      side: BorderSide(color: isDark ? AppColors.darkAccent : AppColors.lightAccent),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      // CV PDF upload here
                      UrlLauncherUtil.launchURL(AppConfig.cvPdfPath);
                    },
                    icon: const FaIcon(FontAwesomeIcons.download, size: 14),
                    label: const Text('Download CV'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 44),
                      backgroundColor: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                      foregroundColor: isDark ? AppColors.darkBackground : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
