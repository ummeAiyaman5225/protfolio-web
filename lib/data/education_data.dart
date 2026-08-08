class EducationItem {
  final String degree;
  final String institution;
  final String university;
  final String years;
  final String? percentage;
  final String? stream;

  const EducationItem({
    required this.degree,
    required this.institution,
    required this.university,
    required this.years,
    this.percentage,
    this.stream,
  });
}

class EducationData {
  static const List<EducationItem> items = [
    EducationItem(
      degree: 'Master of Computer Applications (MCA)',
      institution: 'Darshan University',
      university: 'Darshan University',
      years: '2024 – 2026',
    ),
    EducationItem(
      degree: 'Bachelor of Computer Applications (BCA)',
      institution: 'Lt. M. J. Kundaliya Arts and Commerce Mahila College',
      university: 'Saurashtra University',
      years: '2021 – 2024',
      percentage: '71.00%',
    ),
    EducationItem(
      degree: '12th CBSE',
      institution: 'CBSE Board',
      university: 'Central Board of Secondary Education',
      years: '2020 – 2021',
      stream: 'Commerce',
      percentage: '65.05%',
    ),
    EducationItem(
      degree: '10th CBSE',
      institution: 'CBSE Board',
      university: 'Central Board of Secondary Education',
      years: '2017 – 2018',
      percentage: '60.00%',
    ),
  ];
}
