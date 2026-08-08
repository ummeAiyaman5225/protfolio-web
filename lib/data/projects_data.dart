import '../models/project_model.dart';
import '../app/constants/app_config.dart';

class ProjectsData {
  static const List<ProjectModel> githubProjects = [
    ProjectModel(
      id: 'apex',
      title: 'apex',
      description: 'Eye and Dental Hospital Booking Application allowing users to browse specialized doctors, view available slots, and book real-time healthcare appointments.',
      technologies: ['Flutter', 'Firebase', 'REST API', 'GetX'],
      features: [
        'Appointment booking system',
        'Hospital & specialist listings',
        'Doctor profiles & availability',
        'Push notifications & reminders',
        'Secure user authentication',
      ],
      // project image upload here
      imagePath: 'assets/images/projects/Frame 427318612.png',
      githubUrl: '${AppConfig.githubUrl}/apex',
      liveDemoUrl: null,
    ),
    ProjectModel(
      id: 'haai-ai',
      title: 'haai-ai',
      description: 'An AI-powered conversational chat application integrated with modern AI APIs featuring rich audio messaging and context-aware responses.',
      technologies: ['Flutter', 'REST APIs', 'AI APIs', 'Firebase'],
      features: [
        'AI conversational interface',
        'Chat history & state retention',
        'Audio recording & response support',
        'Modern dark/light glassmorphic UI',
        'API integration & response parsing',
      ],
      // project image upload here
      imagePath: 'assets/images/projects/Frame 427318600.png',
      githubUrl: '${AppConfig.githubUrl}/haai-ai',
      liveDemoUrl: null,
    ),
    ProjectModel(
      id: 'ChatNest',
      title: 'ChatNest',
      description: 'A high-performance real-time messaging and communication application published on Google Play Store featuring instant delivery and media sharing.',
      technologies: ['Flutter', 'Firebase', 'Firestore', 'REST APIs', 'GetX'],
      features: [
        'Phone & email OTP authentication',
        'Real-time Firestore chat messaging',
        'Push notifications & online indicators',
        'Optimized media & document sharing',
        'Production release optimization',
      ],
      // project image upload here
      imagePath: 'assets/images/projects/4.png',
      githubUrl: '${AppConfig.githubUrl}/ChatNest',
      liveDemoUrl: null,
    ),
    ProjectModel(
      id: 'aazovo-flutter',
      title: 'aazovo-flutter',
      description: 'Food Delivery & E-Commerce Mobile Application supporting dynamic menu listing, cart management, payment gateway integration, and order tracking.',
      technologies: ['Flutter', 'GetX', 'REST API', 'Node.js', 'Payment Gateway'],
      features: [
        'Interactive product/food catalog',
        'Seamless cart & checkout workflow',
        'Payment gateway integration',
        'Order history & live status tracking',
        'Responsive pixel-perfect layouts',
      ],
      // project image upload here
      imagePath: 'assets/images/projects/3.png',
      githubUrl: '${AppConfig.githubUrl}/aazovo-flutter',
      liveDemoUrl: null,
    ),
    ProjectModel(
      id: 'manthus',
      title: 'manthus',
      description: 'Logistics & Supply Chain Production Application providing real-time location tracking, route navigation, dynamic driver assignments, and shipment logs.',
      technologies: ['Flutter', 'Google Maps', 'REST API', 'Location Tracking', 'Laravel'],
      features: [
        'Google Maps & live location tracking',
        'Driver assignment & status updates',
        'Shipment tracking & delivery verification',
        'Deep linking for instant order lookups',
        'Offline data syncing capabilities',
      ],
      // project image upload here
      imagePath: 'assets/images/projects/2.png',
      githubUrl: '${AppConfig.githubUrl}/manthus',
      liveDemoUrl: null,
    ),
  ];

  static const List<ProjectModel> playStoreApps = [
    ProjectModel(
      id: 'play_app_1',
      title: 'ChatNest - Realtime Chat',
      description: 'Production real-time communication application live on Google Play Store with thousands of active downloads.',
      technologies: ['Flutter', 'Firebase', 'GetX', 'Cloud Messaging'],
      features: [
        'Real-time messaging',
        'Media & audio sharing',
        'Push notifications',
        'Available on Play Store',
      ],
      // Play Store project image upload here
      imagePath: 'assets/images/projects/Frame 427318601.png',
      playStoreUrl: null,
      isPlayStoreApp: true,
    ),
    ProjectModel(
      id: 'play_app_2',
      title: 'Healthcare & Booking App',
      description: 'Production hospital management & appointment booking app published on Google Play Store.',
      technologies: ['Flutter', 'REST API', 'GetX', 'Firebase'],
      features: [
        'Hospital & doctor discovery',
        'Appointment schedule booking',
        'Patient records & notifications',
        'Available on Play Store',
      ],
      // Play Store project image upload here
      imagePath: 'assets/images/projects/Frame 427318613.png',
      playStoreUrl: null,
      isPlayStoreApp: true,
    ),
    ProjectModel(
      id: 'play_app_3',
      title: 'Logistics & Express Delivery',
      description: 'Production logistics app featuring live Google Maps tracking and delivery management live on Play Store.',
      technologies: ['Flutter', 'Google Maps', 'Location Tracking', 'Node.js'],
      features: [
        'Live driver GPS tracking',
        'Shipment status notifications',
        'Customer digital signature',
        'Available on Play Store',
      ],
      // Play Store project image upload here
      imagePath: 'assets/images/projects/1.png',
      playStoreUrl: null,
      isPlayStoreApp: true,
    ),
  ];
}
