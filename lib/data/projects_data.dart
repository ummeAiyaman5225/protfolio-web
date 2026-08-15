import '../models/project_model.dart';
import '../app/constants/app_config.dart';

class ProjectsData {
  static const List<String> categories = [
    'All',
    'Flutter Apps',
    'Full-Stack',
    'Published Apps',
  ];

  static final List<ProjectModel> allProjects = [
    ProjectModel(
      id: 'chatnest',
      title: 'ChatNest - Realtime Chat App',
      description: 'High-performance real-time messaging and communication application published on Google Play Store featuring instant delivery, phone & email OTP authentication, media sharing, and push notifications.',
      category: 'Published Apps',
      isPlayStoreApp: true,
      technologies: ['Flutter', 'Firebase', 'Firestore', 'REST APIs', 'GetX', 'OTP Auth'],
      features: [
        'Phone & email OTP authentication',
        'Real-time Firestore chat messaging',
        'Push notifications & online indicators',
        'Optimized media & document sharing',
        'Production release optimization',
      ],
      images: const [
        'assets/images/projects/4.png',
        'assets/images/projects/Frame 427318601.png',
        'assets/images/projects/Frame 427318610.png',
        'assets/images/projects/Frame 427318611.png',
      ],
      githubUrl: '${AppConfig.githubUrl}/ChatNest',
      playStoreUrl: null,
    ),
    ProjectModel(
      id: 'apex',
      title: 'Apex Healthcare & Appointment Booking',
      description: 'Eye and Dental Hospital Booking Application allowing users to browse specialized doctors, view available slots, and book real-time healthcare appointments with push notifications.',
      category: 'Published Apps',
      isPlayStoreApp: true,
      technologies: ['Flutter', 'Firebase', 'REST API', 'GetX', 'Appointment Engine'],
      features: [
        'Appointment booking system',
        'Hospital & specialist listings',
        'Doctor profiles & availability',
        'Push notifications & reminders',
        'Secure user authentication',
      ],
      images: const [
        'assets/images/projects/Frame 427318612.png',
        'assets/images/projects/Frame 427318613.png',
        'assets/images/projects/Frame 427318614.png',
        'assets/images/projects/Frame 427318615.png',
      ],
      githubUrl: '${AppConfig.githubUrl}/apex',
      playStoreUrl: null,
    ),
    ProjectModel(
      id: 'manthus',
      title: 'Manthus Express & Logistics',
      description: 'Logistics & Supply Chain Production Application providing real-time location tracking, Google Maps route navigation, dynamic driver assignments, and shipment logs.',
      category: 'Published Apps',
      isPlayStoreApp: true,
      technologies: ['Flutter', 'Google Maps', 'REST API', 'Location Tracking', 'Laravel'],
      features: [
        'Google Maps & live location tracking',
        'Driver assignment & status updates',
        'Shipment tracking & delivery verification',
        'Deep linking for instant order lookups',
        'Offline data syncing capabilities',
      ],
      images: const [
        'assets/images/projects/1.png',
        'assets/images/projects/2.png',
        'assets/images/projects/Frame 427318618.png',
        'assets/images/projects/Frame 427318619.png',
      ],
      githubUrl: '${AppConfig.githubUrl}/manthus',
      playStoreUrl: null,
    ),
    ProjectModel(
      id: 'aazovo-flutter',
      title: 'Aazovo Food Delivery & E-Commerce',
      description: 'Food Delivery & E-Commerce Mobile Application supporting dynamic menu listing, cart management, payment gateway integration, order tracking, and clean UI state architecture.',
      category: 'Flutter Apps',
      isPlayStoreApp: false,
      technologies: ['Flutter', 'GetX', 'REST API', 'Node.js', 'Payment Gateway'],
      features: [
        'Interactive product/food catalog',
        'Seamless cart & checkout workflow',
        'Payment gateway integration',
        'Order history & live status tracking',
        'Responsive pixel-perfect layouts',
      ],
      images: const [
        'assets/images/projects/3.png',
        'assets/images/projects/Frame 427318616.png',
        'assets/images/projects/Frame 427318617.png',
      ],
      githubUrl: '${AppConfig.githubUrl}/aazovo-flutter',
    ),
    ProjectModel(
      id: 'haai-ai',
      title: 'Haai AI - Conversational Assistant',
      description: 'An AI-powered conversational chat application integrated with modern AI APIs featuring rich audio messaging, context-aware responses, and clean glassmorphic UI.',
      category: 'Full-Stack',
      isPlayStoreApp: false,
      technologies: ['Flutter', 'REST APIs', 'AI APIs', 'Firebase', 'Node.js'],
      features: [
        'AI conversational interface',
        'Chat history & state retention',
        'Audio recording & response support',
        'Modern dark/light glassmorphic UI',
        'API integration & response parsing',
      ],
      images: const [
        'assets/images/projects/Frame 427318600.png',
        'assets/images/projects/Frame 427318620.png',
        'assets/images/projects/Frame 427318621.png',
      ],
      githubUrl: '${AppConfig.githubUrl}/haai-ai',
    ),
  ];
}
