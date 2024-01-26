class NewsModel {
  final String title;
  final String description;
  final String? articleText;

  NewsModel({
    required this.title,
    required this.description,
    this.articleText = 'loremIpsum',
  });
}
