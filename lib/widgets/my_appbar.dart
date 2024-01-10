import 'package:flutter/material.dart';
import 'package:proje/pages/profile_page.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: const Color(0xff176B87),
      leading: const Padding(
        padding: EdgeInsets.only(left: 15),
        child: Icon(
          Icons.accessibility_new_outlined,
          size: 50,
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(
                  nameSurname: "Ahmet Özgül",
                  phoneNum: "553 059 3560",
                  email: "ahmetozgul.ao@gmail.com",
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
