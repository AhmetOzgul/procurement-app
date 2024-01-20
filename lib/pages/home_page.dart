import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proje/pages/posting_page.dart';
import 'package:proje/pages/search_page.dart';
import 'package:proje/widgets/my_appbar.dart';

import '../widgets/home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 1;
  @override
  Widget build(BuildContext context) {
    void logout() {
      FirebaseAuth.instance.signOut();
    }

    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                style: ListTileStyle.list,
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                  size: 30,
                ),
                title: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
                onTap: logout,
              )
            ],
          ),
        ),
        appBar: const PreferredSize(
          preferredSize: Size(100, 80),
          child: MyAppBar(),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: _pageIndex,
          height: 50,
          backgroundColor: const Color(0xffEEF5FF),
          color: const Color(0xff176B87),
          items: const [
            Icon(
              Icons.add_circle_rounded,
              size: 50,
              color: Color(0xffEEF5FF),
            ),
            Icon(
              Icons.house,
              size: 50,
              color: Color(0xffEEF5FF),
            ),
            Icon(
              Icons.search,
              size: 50,
              color: Color(0xffEEF5FF),
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
        body: [
          const PostPage(),
          const HomeBody(),
          const SearchPage()
        ][_pageIndex],
      ),
    );
  }
}
