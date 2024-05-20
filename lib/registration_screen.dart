import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_registration/newspage.dart';
import 'package:flutter_application_registration/registration_field.dart';
import 'package:flutter_application_registration/pages/homepage.dart';
import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/future.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome to TodayNews ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      height: 5,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Please Log In ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      height: 5,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const LoginField(hintText: 'Email'),
                  const SizedBox(height: 15),
                  const LoginField(hintText: 'Password'),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      remoteLogin();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(395, 55),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> remoteLogin() async {
    http.Response response;
    response = await http.get(
        Uri.parse("https://todaysnewspaper.xyz/emmanuel/todaysnews/login.php"));
    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      int loginStatus = serverResponse['Sucess'];
      if (loginStatus == 1) {
        print("Login Sucess");
      } else {
        print("Phone Number or Password is invalid");
      }
    } else {
      print("server Error ${response.statusCode}");
    }
  }
}
