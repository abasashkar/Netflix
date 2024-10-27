import 'package:flutter/material.dart';
import 'package:netflix_app/provider/botomnav_provider.dart';
import 'package:netflix_app/screens/home_screen.dart';
import 'package:netflix_app/screens/news_creen.dart';
import 'package:netflix_app/screens/search_screen.dart';
import 'package:provider/provider.dart';

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
    final botomnavprovider = Provider.of<BottomProvider>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: botomnavprovider.curentabIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album_sharp),
            label: 'News',
          ),
        ],
        onTap: (value) {
          botomnavprovider.updateState(value);

          Future.delayed(const Duration(milliseconds: 100), () {});
        },
      ),
      body: pages[botomnavprovider.curentabIndex],
    );
  }
}
