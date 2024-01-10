import 'package:flutter/material.dart';
import 'package:proje/widgets/product_list_item.dart';

class ProfilePage extends StatelessWidget {
  final String nameSurname;
  final String phoneNum;
  final String email;
  const ProfilePage(
      {Key? key,
      required this.nameSurname,
      required this.phoneNum,
      required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle = TextStyle(fontSize: 18, color: Color(0xff176B87));
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(360),
                color: Color(0xffEEF5FF),
              ),
              height: 200,
              width: 200,
              child: Image.asset(
                "lib/avatar.jpeg",
                scale: 5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 100,
                color: Color(0xffEEF5FF),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(nameSurname, style: _textStyle),
                    Text(phoneNum, style: _textStyle),
                    Text(email, style: _textStyle)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 254, 0),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0xffB4D4FF),
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "My Products",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: ProductListItem(
                  productName: "asd",
                  productDescription: "sgsdgsdg",
                  productImage: "asd"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: ProductListItem(
                  productName: "asd",
                  productDescription: "sgsdgsdg",
                  productImage: "asd"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: ProductListItem(
                  productName: "asd",
                  productDescription: "sgsdgsdg",
                  productImage: "asd"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: ProductListItem(
                productName: "asd",
                productDescription: "sgsdgsdg",
                productImage: "asd",
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xff176B87),
      ),
    );
  }
}
