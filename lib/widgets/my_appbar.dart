import 'package:flutter/material.dart';
import 'package:proje/pages/profile_page.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: const Color(0xff176B87),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(
                  nameSurname: "Ahmet Özgül",
                  phoneNum: "553 059 3560",
                ),
              ),
            );
          },
          style: const ButtonStyle(
              elevation: MaterialStatePropertyAll(5),
              shape: MaterialStatePropertyAll(CircleBorder()),
              backgroundColor: MaterialStatePropertyAll(Colors.white)),
          child: const Icon(
            Icons.person,
            color: Color(0xff176B87),
            size: 40,
          ),
        )
      ],
    );
  }
}
