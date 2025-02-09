class News {
  final String title;
  final String description;
  final String link;
  final String imageUrl;

  News({
    required this.title,
    required this.description,
    required this.link,
    required this.imageUrl,
  });

  factory News.fromJson(Map<String, dynamic> json) {
  return News(
    title: json['title'] ?? 'No title',
    description: json['description'] ?? 'No description',
    link: json['link'] ?? '',
    imageUrl: json['image_url'] ?? '', // Correct field name for News API
  );
}

}
