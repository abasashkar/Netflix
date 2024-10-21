import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/screens/home_screen.dart';
import 'package:netflix_app/screens/news_creen.dart';
import 'package:netflix_app/screens/search_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<Widget> pages = [];
  late HomeScreen homePage;
  late SearchScreen searchPage;
  late NewsCreen newsPage;

  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    homePage = const HomeScreen();
    searchPage = const SearchScreen();
    newsPage = const NewsCreen();
    pages = [homePage, searchPage, newsPage];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          height: 60,
          index: currentTabIndex,
          items: const <Widget>[
            Icon(
              Icons.home,
              size: 30,
              color: Colors.black,
            ),
            Icon(
              Icons.search,
              size: 30,
              color: Colors.black,
            ),
            Icon(
              Icons.photo_library_outlined,
              size: 30,
              color: Colors.black,
            ),
          ],
          onTap: (index) {
            setState(() {
              currentTabIndex = index;
            });
          }),
      body: pages[currentTabIndex],
    );
  }
}
