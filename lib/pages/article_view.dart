import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatelessWidget {
  final String blogUrl;

  const ArticleView({required this.blogUrl});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Scaffold(
        body: Builder(
          builder: (context) {
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              _loadUrlInSameTab(blogUrl);
            });
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      );
    } else {
      return Scaffold(
        body: WebView(
          initialUrl: blogUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      );
    }
  }

  void _loadUrlInSameTab(String url) {
    html.window.location.href = url;
  }
}
