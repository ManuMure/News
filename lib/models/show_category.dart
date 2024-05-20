class ShowCategoryModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? content;

  ShowCategoryModel({
    this.author,
    this.content,
    this.description,
    this.title,
    this.url,
    this.urlToImage,
  });

  factory ShowCategoryModel.fromJson(Map<String, dynamic> json) {
    return ShowCategoryModel(
      author: json['author'] ?? '',
      content: json['content'] ?? '',
      description: json['description'] ?? '',
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
    );
  }
}
