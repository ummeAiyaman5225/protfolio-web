import '../models/skill_model.dart';

class SkillsData {
  static const List<SkillCategory> categories = [
    SkillCategory(
      categoryName: 'Mobile Development',
      iconName: 'mobile',
      skills: [
        'Flutter',
        'Dart',
        'Android',
        'iOS',
        'Material Design',
        'Responsive UI',
        'Animations',
        'React Native (Basic)',
        'Java (Android Basics)',
      ],
    ),
    SkillCategory(
      categoryName: 'Backend & APIs',
      iconName: 'backend',
      skills: [
        'Laravel',
        'REST API Development',
        'Node.js',
        'MySQL',
        'Cloud Firestore',
        'SQLite',
        'Firebase',
      ],
    ),
    SkillCategory(
      categoryName: 'State Management',
      iconName: 'state',
      skills: [
        'GetX',
        'Provider (Basic)',
        'Clean Architecture',
      ],
    ),
    SkillCategory(
      categoryName: 'Integrations',
      iconName: 'integrations',
      skills: [
        'Google Maps',
        'Payment Gateway',
        'Push Notifications',
        'Location Tracking',
        'OTP Authentication',
        'Camera & Media',
        'Audio Recording',
        'Deep Linking',
      ],
    ),
    SkillCategory(
      categoryName: 'Tools & Workflows',
      iconName: 'tools',
      skills: [
        'Git & GitHub',
        'Android Studio',
        'VS Code',
        'Xcode',
        'Postman',
        'Figma',
      ],
    ),
    SkillCategory(
      categoryName: 'Deployment',
      iconName: 'deployment',
      skills: [
        'Google Play Console',
        'App Store Connect',
        'Release Management',
        'Crashlytics & Analytics',
      ],
    ),
  ];

  static const List<String> languages = [
    'English (Fluent)',
    'Hindi (Fluent)',
    'Gujarati (Native)',
  ];
}
