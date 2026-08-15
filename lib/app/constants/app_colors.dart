import 'package:flutter/material.dart';

class AppColors {
  // Brand Primary Accent Colors
  static const Color primaryAccent = Color(0xFF0284C7); // Rich Modern Sky Blue
  static const Color darkAccent = Color(0xFF38BDF8);   // Vibrant Cyan Sky for Dark Mode
  static const Color lightAccent = Color(0xFF0284C7);  // Deep Cyan Blue for Light Mode

  // Dark Theme Palette (Navy & Cyan Accent)
  static const Color darkBackground = Color(0xFF0A192F);
  static const Color darkSurface = Color(0xFF112240);
  static const Color darkCardBg = Color(0xFF112240);
  static const Color darkCardHover = Color(0xFF1D3557);
  static const Color darkTextPrimary = Color(0xFFF1F5F9);
  static const Color darkTextSecondary = Color(0xFF94A3B8);
  static const Color darkAccentGlow = Color(0x2638BDF8);
  static const Color darkBorder = Color(0xFF1E293B);

  // Light Theme Palette (Clean Slate White, Navy Slate Text & Vivid Blue Accent)
  static const Color lightBackground = Color(0xFFF8FAFC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCardBg = Color(0xFFFFFFFF);
  static const Color lightCardHover = Color(0xFFF1F5F9);
  static const Color lightTextPrimary = Color(0xFF0F172A);
  static const Color lightTextSecondary = Color(0xFF334155);
  static const Color lightAccentGlow = Color(0xFFE0F2FE); // Soft sky tint
  static const Color lightBorder = Color(0xFFE2E8F0);

  // General Accent & Brand Colors
  static const Color playStoreGreen = Color(0xFF01875F);
  static const Color gitHubDark = Color(0xFF24292E);
  static const Color linkedInBlue = Color(0xFF0A66C2);
  static const Color errorRed = Color(0xFFEF4444);
  static const Color successGreen = Color(0xFF10B981);

  // Helper methods to get theme-aware colors
  static Color background(bool isDark) => isDark ? darkBackground : lightBackground;
  static Color surface(bool isDark) => isDark ? darkSurface : lightSurface;
  static Color cardBg(bool isDark) => isDark ? darkCardBg : lightCardBg;
  static Color cardHover(bool isDark) => isDark ? darkCardHover : lightCardHover;
  static Color textPrimary(bool isDark) => isDark ? darkTextPrimary : lightTextPrimary;
  static Color textSecondary(bool isDark) => isDark ? darkTextSecondary : lightTextSecondary;
  static Color accent(bool isDark) => isDark ? darkAccent : lightAccent;
  static Color accentGlow(bool isDark) => isDark ? darkAccentGlow : lightAccentGlow;
  static Color border(bool isDark) => isDark ? darkBorder : lightBorder;
}
