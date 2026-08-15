import '../models/project_model.dart';
import '../app/constants/app_config.dart';

class ProjectsData {
  // Configuration flags to easily show/hide projects
  static const bool showAazovoProject = true;
  static const bool showApexProject = true;
  static const bool showManthusProject = true;
  static const bool showAiAiProject = true; // Always visible as per user request
  static const bool showNestProject = true; // Always visible as per user request

  static const List<String> categories = [
    'All',
    'Flutter Apps',
    'Full-Stack',
    'Published Apps',
  ];

  static final List<ProjectModel> allProjects = [
    // 1. Aazovo Food Delivery & E-Commerce
    ProjectModel(
      id: 'aazovo-flutter',
      title: 'Aazovo Food Delivery & E-Commerce',
      description: 'Food Delivery & E-Commerce Mobile Application supporting dynamic menu listing, cart management, payment gateway integration, order tracking, and clean UI state architecture.',
      category: 'Flutter Apps',
      isPlayStoreApp: false,
      visible: showAazovoProject,
      technologies: const ['Flutter', 'GetX', 'REST API', 'Node.js', 'Payment Gateway'],
      features: const [
        'Interactive product/food catalog',
        'Seamless cart & checkout workflow',
        'Payment gateway integration',
        'Order history & live status tracking',
        'Responsive pixel-perfect layouts',
      ],
      images: const [
        'assets/images/projects/aazovo/Aazovo.png',
        'assets/images/projects/aazovo/Aazovo 2.png',
        'assets/images/projects/aazovo/Aazovo 3.png',
        'assets/images/projects/aazovo/Aazovo 4.png',
        'assets/images/projects/aazovo/Aazovo #1.png',
        'assets/images/projects/aazovo/Aazovo #2.png',
        'assets/images/projects/aazovo/Aazovo #3.png',
        'assets/images/projects/aazovo/Aazovo #4.png',
      ],
      githubUrl: '${AppConfig.githubUrl}/aazovo-flutter',
    ),

    // 2. Apex Healthcare & Appointment Booking
    ProjectModel(
      id: 'apex',
      title: 'Apex Healthcare & Appointment Booking',
      description: 'Eye and Dental Hospital Booking Application allowing users to browse specialized doctors, view available slots, and book real-time healthcare appointments with push notifications.',
      category: 'Published Apps',
      isPlayStoreApp: true,
      visible: showApexProject,
      technologies: const ['Flutter', 'Firebase', 'REST API', 'GetX', 'Appointment Engine'],
      features: const [
        'Appointment booking system',
        'Hospital & specialist listings',
        'Doctor profiles & availability',
        'Push notifications & reminders',
        'Secure user authentication',
      ],
      images: const [
        'assets/images/projects/apex/Frame 427318612.png',
        'assets/images/projects/apex/Frame 427318613.png',
        'assets/images/projects/apex/Frame 427318614.png',
        'assets/images/projects/apex/Frame 427318615.png',
        'assets/images/projects/apex/Frame 427318616.png',
        'assets/images/projects/apex/Frame 427318617.png',
        'assets/images/projects/apex/Frame 427318618.png',
        'assets/images/projects/apex/Frame 427318619.png',
        'assets/images/projects/apex/Frame 427318620.png',
        'assets/images/projects/apex/Frame 427318621.png',
      ],
      githubUrl: '${AppConfig.githubUrl}/apex',
    ),

    // 3. Manthus Express & Logistics
    ProjectModel(
      id: 'manthus',
      title: 'Manthus Express & Logistics',
      description: 'Logistics & Supply Chain Production Application providing real-time location tracking, Google Maps route navigation, dynamic driver assignments, and shipment logs.',
      category: 'Published Apps',
      isPlayStoreApp: true,
      visible: showManthusProject,
      technologies: const ['Flutter', 'Google Maps', 'REST API', 'Location Tracking', 'Laravel'],
      features: const [
        'Google Maps & live location tracking',
        'Driver assignment & status updates',
        'Shipment tracking & delivery verification',
        'Deep linking for instant order lookups',
        'Offline data syncing capabilities',
      ],
      images: const [
        'assets/images/projects/manthus/1.png',
        'assets/images/projects/manthus/2.png',
        'assets/images/projects/manthus/3.png',
        'assets/images/projects/manthus/4.png',
        'assets/images/projects/manthus/Frame 427318600.png',
        'assets/images/projects/manthus/Frame 427318601.png',
        'assets/images/projects/manthus/Frame 427318610.png',
        'assets/images/projects/manthus/Frame 427318611.png',
      ],
      githubUrl: '${AppConfig.githubUrl}/manthus',
    ),

    // 4. Haai AI - Conversational Assistant (Placeholder text "AI AI")
    ProjectModel(
      id: 'haai-ai',
      title: 'Haai AI - Conversational Assistant',
      description: 'An AI-powered conversational chat application integrated with modern AI APIs featuring rich audio messaging, context-aware responses, and clean glassmorphic UI.',
      category: 'Full-Stack',
      isPlayStoreApp: false,
      visible: showAiAiProject,
      technologies: const ['Flutter', 'REST APIs', 'AI APIs', 'Firebase', 'Node.js'],
      features: const [
        'AI conversational interface',
        'Chat history & state retention',
        'Audio recording & response support',
        'Modern dark/light glassmorphic UI',
        'API integration & response parsing',
      ],
      images: const [], // Empty for now, triggers professional placeholder in UI
      githubUrl: '${AppConfig.githubUrl}/haai-ai',
    ),

    // 5. ChatNest - Realtime Chat App (Placeholder text "NEST")
    ProjectModel(
      id: 'chatnest',
      title: 'ChatNest - Realtime Chat App',
      description: 'High-performance real-time messaging and communication application published on Google Play Store featuring instant delivery, phone & email OTP authentication, media sharing, and push notifications.',
      category: 'Published Apps',
      isPlayStoreApp: true,
      visible: showNestProject,
      technologies: const ['Flutter', 'Firebase', 'Firestore', 'REST APIs', 'GetX', 'OTP Auth'],
      features: const [
        'Phone & email OTP authentication',
        'Real-time Firestore chat messaging',
        'Push notifications & online indicators',
        'Optimized media & document sharing',
        'Production release optimization',
      ],
      images: const [], // Empty for now, triggers professional placeholder in UI
        githubUrl: 'https://github.com/ummeAiyaman5225/ChatNest/tree/main/nest',
    ),
  ];
}
