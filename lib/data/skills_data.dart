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
      ],
    ),
    SkillCategory(
      categoryName: 'Backend & Cloud Services',
      iconName: 'backend',
      skills: [
        'Firebase',
        'Cloud Firestore',
        'Node.js',
        'REST API Development',
        'Laravel',
        'MySQL',
        'SQLite',
      ],
    ),
    SkillCategory(
      categoryName: 'State Management & Arch',
      iconName: 'state',
      skills: [
        'GetX',
        'Provider',
        'Clean Architecture',
        'MVC / Layered Architecture',
      ],
    ),
    SkillCategory(
      categoryName: 'Integrations & Features',
      iconName: 'integrations',
      skills: [
        'Firebase Auth & OTP',
        'Google Maps',
        'Push Notifications (FCM)',
        'Payment Gateway',
        'Location Tracking',
        'Audio Recording',
        'Deep Linking',
      ],
    ),
    SkillCategory(
      categoryName: 'Tools & Workflows',
      iconName: 'tools',
      skills: [
        'Git & GitHub',
        'VS Code',
        'Android Studio',
        'Xcode',
        'Postman',
        'Figma',
      ],
    ),
    SkillCategory(
      categoryName: 'Deployment & Analytics',
      iconName: 'deployment',
      skills: [
        'Google Play Console',
        'App Store Connect',
        'Firebase Analytics',
        'Crashlytics',
      ],
    ),
  ];

  static const List<String> languages = [
    'English (Fluent)',
    'Hindi (Fluent)',
    'Gujarati (Native)',
  ];
}
