import 'package:appbar3d/realls/reels_screen.dart';
import 'package:flutter/material.dart';

import 'change_package/curve_bottom.dart';
import 'community/community_screen.dart';

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

  // ---------- ADD YOUR SCREEN LIST HERE ----------
  final List<Widget> pages = [
    Center(child: Text("Home", style: TextStyle(fontSize: 30))),
    Center(child: Text("Search", style: TextStyle(fontSize: 30))),
    CommunityScreen(),
    YoutubeReelsPage(),   // <----- YOUR REELS PAGE HERE (index = 3)
    Center(child: Text("Profile", style: TextStyle(fontSize: 30))),
  ];
  // ------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _page,
        children: pages,
      ),

      bottomNavigationBar: CurvedNavigationBar2(
        key: _bottomNavigationKey,
        index: _page,
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
          "Add",
          "Shorts",     // <--- index 3 → reels page
          "Profile",
        ],
        color: Colors.blueGrey,
        buttonBackgroundColor: Colors.blueAccent,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.linear,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() => _page = index);
        },
      ),
    );
  }
}