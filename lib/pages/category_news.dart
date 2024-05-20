import 'package:flutter/material.dart';
import 'package:flutter_application_registration/models/show_category.dart';
import 'package:flutter_application_registration/services/show_category_news.dart';

class CategoryNews extends StatefulWidget {
  final String name;
  CategoryNews({required this.name});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategoriesNews(widget.name);
    categories = showCategoryNews.categories;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(categories[index].title ?? ''),
                  subtitle: Text(categories[index].description ?? ''),
                );
              },
            ),
    );
  }
}
