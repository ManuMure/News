class CategoryModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? content;
  String? image;
  String? categoryName;

  CategoryModel({
    this.author,
    this.content,
    this.description,
    this.title,
    this.url,
    this.urlToImage,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      author: json['author'] ?? '',
      content: json['content'] ?? '',
      description: json['description'] ?? '',
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
    );
  }
}
