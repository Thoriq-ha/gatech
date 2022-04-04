class DetailNews {
  DetailNews({
    required this.title,
    required this.thumb,
    required this.author,
    required this.date,
    required this.categories,
    required this.figure,
    required this.content,
  });

  late final String title;
  late final String? thumb;
  late final String author;
  late final String date;
  late final List<String> categories;
  late final List<dynamic> figure;
  late final List<String> content;

  DetailNews.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String;
    thumb = json['thumb'] as String;
    author = json['author'] as String;
    date = json['date'] as String;
    categories = List.castFrom<dynamic, String>(json['categories']);
    figure = List.castFrom<dynamic, dynamic>(json['figure']);
    content = List.castFrom<dynamic, String>(json['content']);
  }
}
