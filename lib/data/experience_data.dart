import '../models/experience_model.dart';
import '../app/constants/app_strings.dart';

class ExperienceData {
  static const ExperienceModel workExperience = ExperienceModel(
    role: 'Flutter Developer',
    company: 'Anzo Tech',
    duration: '1+ Years Experience',
    description: AppStrings.experienceOverview,
    responsibilities: [
      'Contributed to the development of cross-platform mobile applications using Flutter and Dart, delivering responsive and high-performance user experiences for Android and iOS.',
      'Built pixel-perfect, reusable UI components following modern design principles and responsive layouts.',
      'Integrated REST APIs, managed application state using GetX, and implemented clean architecture for scalable development.',
      'Worked with Firebase services including Authentication, Cloud Firestore, Cloud Messaging, Crashlytics, Remote Config, and Analytics.',
      'Collaborated with backend developers to integrate APIs and optimize data flow between frontend and server.',
      'Debugged and resolved application issues, optimized performance, and ensured smooth user experience across multiple devices.',
      'Used Git for version control and participated in Agile development, code reviews, testing, and feature deployment.',
      'Managed Google Play Store and Apple App Store releases and deployment processes.',
    ],
  );

  static const List<Map<String, String>> practicalDomains = [
    {
      'title': 'E-Commerce Applications',
      'desc': 'Cart management, checkout flows, payment gateways, and dynamic product catalogs.',
      'icon': 'shopping_cart',
    },
    {
      'title': 'Food Delivery Applications',
      'desc': 'Interactive menus, live order tracking, location selection, and instant notifications.',
      'icon': 'restaurant',
    },
    {
      'title': 'Hospital & Doctor Booking',
      'desc': 'Doctor availability schedules, patient booking management, and appointment alerts.',
      'icon': 'local_hospital',
    },
    {
      'title': 'AI Conversational Apps',
      'desc': 'Integration with modern AI REST APIs, chat history, audio messaging, and smart prompts.',
      'icon': 'smart_toy',
    },
    {
      'title': 'Real-Time Communication',
      'desc': 'Firestore chat engines, online indicators, push notifications, and media attachments.',
      'icon': 'chat',
    },
    {
      'title': 'Logistics & Fleet Tracking',
      'desc': 'Live GPS tracking, Google Maps route plotting, driver assignments, and deep linking.',
      'icon': 'local_shipping',
    },
  ];
}
