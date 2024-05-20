import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_registration/models/article_model.dart';
import 'package:flutter_application_registration/models/category_model.dart';
import 'package:flutter_application_registration/models/slider_model.dart';
import 'package:flutter_application_registration/pages/article_view.dart';
import 'package:flutter_application_registration/services/data.dart';
import 'package:flutter_application_registration/services/news.dart';
import 'package:flutter_application_registration/services/slider_data.dart'
    as sliderService;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];
  List<ArticleModel> articles = [];
  bool _loading = true;

  int activeIndex = 0;

  @override
  void initState() {
    categories = getCategories();
    getSlider();
    getNews();
    super.initState();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
    setState(() {
      _loading = false;
    });
  }

  getSlider() async {
    sliderService.Slider slider = sliderService.Slider();
    await slider.getSlider();
    sliders = slider.sliders;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Today"),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      height: 60,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryTitle(
                              image: categories[index].image!,
                              categoryName: categories[index].categoryName!,
                            );
                          }),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Breaking News!",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                fontFamily: '  '),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    CarouselSlider.builder(
                        itemCount: sliders.length,
                        itemBuilder: (context, index, realIndex) {
                          String imageUrl = sliders[index].urlToImage!;
                          String title = sliders[index].title!;
                          String url = sliders[index].url!;
                          return buildImage(imageUrl, index, title, url);
                        },
                        options: CarouselOptions(
                            height: 250,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                            onPageChanged: (index, reason) {
                              setState(() {
                                activeIndex = index;
                              });
                            })),
                    SizedBox(
                      height: 30.0,
                    ),
                    Center(child: buildIndicator()),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Trending News!",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return BlogTile(
                                url: articles[index].url!,
                                desc: articles[index].description!,
                                imageUrl: articles[index].urlToImage!,
                                title: articles[index].title!);
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Widget buildImage(String imageUrl, int index, String title, String url) =>
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticleView(blogUrl: url)));
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                height: 250,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Container(
              height: 250,
              padding: EdgeInsets.only(left: 18.0),
              margin: EdgeInsets.only(top: 170.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            )
          ]),
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: sliders.length,
        effect: SlideEffect(
            dotWidth: 10,
            dotHeight: 10,
            activeDotColor: const Color.fromARGB(255, 7, 98, 173)),
      );
}

class CategoryTitle extends StatelessWidget {
  final image, categoryName;
  CategoryTitle({this.categoryName, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              image,
              width: 120,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 120,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.black38,
            ),
            child: Center(
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;
  BlogTile(
      {required this.desc,
      required this.imageUrl,
      required this.title,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Material(
            elevation: 6.0,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Text(
                          title,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Text(
                          desc,
                          maxLines: 4,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
