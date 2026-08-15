import 'dart:async';
import 'package:flutter/material.dart';
import '../app/constants/app_colors.dart';
import '../utils/responsive.dart';

class ProjectImageCarousel extends StatefulWidget {
  final List<String> images;
  final String title;

  const ProjectImageCarousel({
    super.key,
    required this.images,
    required this.title,
  });

  @override
  State<ProjectImageCarousel> createState() => _ProjectImageCarouselState();
}

class _ProjectImageCarouselState extends State<ProjectImageCarousel> {
  late PageController _pageController;
  int _currentIndex = 0;
  Timer? _autoPlayTimer;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _autoPlayTimer?.cancel();
    if (widget.images.length > 1) {
      _autoPlayTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
        if (!mounted || _isHovered) return;
        final int nextPage = (_currentIndex + 1) % widget.images.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void _resetAutoPlay() {
    _startAutoPlay();
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (widget.images.isEmpty) return;
    final next = (_currentIndex + 1) % widget.images.length;
    _pageController.animateToPage(
      next,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    _resetAutoPlay();
  }

  void _previousPage() {
    if (widget.images.isEmpty) return;
    final prev = (_currentIndex - 1 + widget.images.length) % widget.images.length;
    _pageController.animateToPage(
      prev,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    _resetAutoPlay();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bool hasMultipleImages = widget.images.length > 1;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        height: Responsive.isMobile(context) ? 300 : 380,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkBackground : const Color(0xFFF1F5F9),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Stack(
          children: [
            // PageView Carousel
            if (widget.images.isNotEmpty)
              NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollStartNotification) {
                    _autoPlayTimer?.cancel();
                  } else if (notification is ScrollEndNotification) {
                    _resetAutoPlay();
                  }
                  return false;
                },
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.images.length,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Image.asset(
                          widget.images[index],
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                          errorBuilder: (context, error, stackTrace) {
                            return _buildFallback(isDark);
                          },
                        ),
                      ),
                    );
                  },
                ),
              )
            else
              _buildFallback(isDark),

            // Left Navigation Arrow (Only if multiple images and not on mobile)
            if (hasMultipleImages && !Responsive.isMobile(context))
              Positioned(
                left: 8,
                top: 0,
                bottom: 0,
                child: Center(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _isHovered ? 0.95 : 0.5,
                    child: Material(
                      color: (isDark ? Colors.black54 : Colors.white).withValues(alpha: 0.9),
                      elevation: 2,
                      shape: const CircleBorder(),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 16,
                          color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                        ),
                        onPressed: _previousPage,
                        tooltip: 'Previous Image',
                      ),
                    ),
                  ),
                ),
              ),

            // Right Navigation Arrow (Only if multiple images and not on mobile)
            if (hasMultipleImages && !Responsive.isMobile(context))
              Positioned(
                right: 8,
                top: 0,
                bottom: 0,
                child: Center(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _isHovered ? 0.95 : 0.5,
                    child: Material(
                      color: (isDark ? Colors.black54 : Colors.white).withValues(alpha: 0.9),
                      elevation: 2,
                      shape: const CircleBorder(),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                          color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                        ),
                        onPressed: _nextPage,
                        tooltip: 'Next Image',
                      ),
                    ),
                  ),
                ),
              ),

            // Page Indicators / Dots (Bottom Center)
            if (hasMultipleImages)
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.images.length, (index) {
                    final bool isSelected = _currentIndex == index;
                    return GestureDetector(
                      onTap: () {
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                        _resetAutoPlay();
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 6,
                        width: isSelected ? 20 : 6,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? (isDark ? AppColors.darkAccent : AppColors.lightAccent)
                              : (isDark ? Colors.white30 : Colors.black26),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    );
                  }),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFallback(bool isDark) {
    final titleLower = widget.title.toLowerCase();
    final String text = titleLower.contains('ai')
        ? 'AI AI'
        : (titleLower.contains('nest') ? 'NEST' : widget.title.toUpperCase());

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [
                  AppColors.darkCardBg,
                  AppColors.darkAccentGlow.withValues(alpha: 0.15),
                ]
              : [
                  AppColors.lightCardBg,
                  AppColors.lightAccentGlow.withValues(alpha: 0.2),
                ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkAccentGlow : AppColors.lightAccentGlow,
                shape: BoxShape.circle,
              ),
              child: Icon(
                titleLower.contains('ai')
                    ? Icons.auto_awesome_rounded
                    : Icons.forum_rounded,
                size: 32,
                color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              text,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
                color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'PREVIEW COMING SOON',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
