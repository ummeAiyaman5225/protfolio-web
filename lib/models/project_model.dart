class ProjectModel {
  final String id;
  final String title;
  final String description;
  final List<String> images;
  final List<String> technologies;
  final List<String> features;
  final String category;
  final String? githubUrl;
  final String? liveDemoUrl;
  final String? playStoreUrl;
  final bool isPlayStoreApp;
  final bool visible;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.technologies,
    required this.features,
    required this.category,
    this.githubUrl,
    this.liveDemoUrl,
    this.playStoreUrl,
    this.isPlayStoreApp = false,
    this.visible = true,
  });
}
