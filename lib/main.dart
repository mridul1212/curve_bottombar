import 'package:flutter/material.dart';

import 'change_package/curve_bottom.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBar2State> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Page $_page",
          style: TextStyle(fontSize: 30),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar2(
        key: _bottomNavigationKey,
        index: 0,
        height: 75.0,
        items: <Widget>[
          Icon(Icons.home, size: 35, color: Colors.white),
          Icon(Icons.search, size: 35, color: Colors.white),
          Icon(Icons.add, size: 35, color: Colors.white),
          Icon(Icons.favorite, size: 35, color: Colors.white),
          Icon(Icons.person, size: 35, color: Colors.white),
        ],

        labels: [
          "Home",
          "Search",
          "Favorite",
          "Kabbik",
          "Shorts",
        ],
        color: Colors.blueGrey, // makes the bar itself transparent
        buttonBackgroundColor: Colors.blueAccent,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.linear,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
