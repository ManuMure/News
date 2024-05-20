import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/sport.jpg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.7,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "News from around the world\n                 for you",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Get the latest and top news from our app",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.symmetric(vertical: 15.0),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
