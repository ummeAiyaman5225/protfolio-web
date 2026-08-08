class ProjectModel {
  final String id;
  final String title;
  final String description;
  final List<String> technologies;
  final List<String> features;
  final String? imagePath;
  final String? githubUrl;
  final String? liveDemoUrl;
  final String? playStoreUrl;
  final bool isPlayStoreApp;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.technologies,
    required this.features,
    this.imagePath,
    this.githubUrl,
    this.liveDemoUrl,
    this.playStoreUrl,
    this.isPlayStoreApp = false,
  });
}
