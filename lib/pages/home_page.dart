import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:proje/pages/home_body.dart';
import 'package:proje/pages/search_page.dart';
import 'package:proje/widgets/my_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size(100, 80), child: MyAppBar()),
        bottomNavigationBar: CurvedNavigationBar(
          index: _pageIndex,
          height: 50,
          backgroundColor: Color(0xffEEF5FF),
          color: Color(0xff176B87),
          items: const [
            Icon(
              Icons.add_circle_rounded,
              size: 50,
              color: Colors.white,
            ),
            Icon(
              Icons.house,
              size: 50,
              color: Colors.white,
            ),
            Icon(
              Icons.search,
              size: 50,
              color: Colors.white,
            ),
          ],
          onTap: (index) {
            setState(
              () {
                _pageIndex = index;
              },
            );
          },
        ),
        backgroundColor: const Color(0xffEEF5FF),
        body: [null, HomeBody(), SearchPage()][_pageIndex],
      ),
    );
  }
}
