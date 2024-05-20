class ArticleModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? content;

  ArticleModel({
    this.author,
    this.content,
    this.description,
    this.title,
    this.url,
    this.urlToImage,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      author: json['author'] ?? '',
      content: json['content'] ?? '',
      description: json['description'] ?? '',
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
    );
  }
}
