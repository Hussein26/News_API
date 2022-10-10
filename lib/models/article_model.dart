class ArticleModel {
  final String title;
  final String? description;
  final String url;
  final String? urtToImage;

  ArticleModel(
      {required this.title,
      required this.description,
      required this.url,
      required this.urtToImage});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json["title"],
      description: json["description"],
      url: json["url"],
      urtToImage: json["urlToImage"]
    );
  }
}
