class SliderModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? content;

  SliderModel({
    this.author,
    this.content,
    this.description,
    this.title,
    this.url,
    this.urlToImage,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      author: json['author'] ?? '',
      content: json['content'] ?? '',
      description: json['description'] ?? '',
      title: json['title'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
    );
  }
}
