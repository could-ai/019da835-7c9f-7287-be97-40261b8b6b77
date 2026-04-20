class Chapter {
  final String id;
  final String title;
  final String subtitle;
  final String content;
  final List<Section> sections;

  Chapter({
    required this.id,
    required this.title,
    this.subtitle = '',
    required this.content,
    this.sections = const [],
  });
}

class Section {
  final String title;
  final String content;

  Section({
    required this.title,
    required this.content,
  });
}
