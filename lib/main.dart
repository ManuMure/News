import 'package:flutter/material.dart';
import 'package:flutter_application_registration/newspage.dart';
import 'package:flutter_application_registration/pages/introduction_page.dart';
import 'package:flutter_application_registration/registration_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "My App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(),
      home: const LoginScreen(),
    );
  }
}
