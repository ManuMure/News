import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? Key}) : super(key: Key);

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 21, 69, 108),
        elevation: 0,
        title: Text('W E L C O M E'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            backgroundColor: Color.fromARGB(226, 0, 0, 0),
            color: Color.fromARGB(255, 35, 144, 158),
            tabBackgroundColor: Color.fromARGB(40, 29, 84, 126),
            gap: 8,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Favourites',
              ),
              GButton(
                icon: Icons.search,
                text: 'search',
              ),
              GButton(
                icon: Icons.settings,
                text: 'settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
