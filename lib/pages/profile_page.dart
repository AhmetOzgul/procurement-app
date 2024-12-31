import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proje/services/firebase_service.dart';

import '../widgets/product_list_item.dart';

class ProfilePage extends StatefulWidget {
  final String nameSurname;
  final String phoneNum;

  const ProfilePage(
      {Key? key, required this.nameSurname, required this.phoneNum})
      : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseService _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    final currentUser = _firebaseService.getCurrentUser();
    TextStyle _textStyle =
        const TextStyle(fontSize: 18, color: Color(0xff176B87));
    final streamQuery = _firebaseService.getUserProducts(currentUser.email!);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff176B87),
                      ),
                      height: 200,
                      width: 200,
                      child: const Icon(
                        Icons.account_circle,
                        size: 200,
                        color: Colors.white,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffEEF5FF),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      height: 100,
                      width: 450,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.nameSurname, style: _textStyle),
                          Text(widget.phoneNum, style: _textStyle),
                          Text(currentUser.email!, style: _textStyle)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: const Color(0xffB4D4FF),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text(
                        "My Products",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 380),
              child: StreamBuilder(
                  stream: streamQuery,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                          child: Text('Some error occurred ${snapshot.error}'));
                    }
                    if (snapshot.hasData) {
                      QuerySnapshot querySnapshot = snapshot.data;
                      List<QueryDocumentSnapshot> documents =
                          querySnapshot.docs;
                      List<Map> items = documents
                          .map((e) => {
                                'id': e.id,
                                'image': e['image'],
                                'name': e['name'],
                                'quantity': e['quantity'],
                              })
                          .toList();
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            Map thisItem = items[index];
                            return ProductListItem(
                                showCartButton: false,
                                productName: thisItem['name'],
                                numberOfProduct: thisItem['quantity'],
                                productImage: thisItem['image']);
                          });
                    } else {
                      return Container();
                    }
                  }),
            ),
          ],
        ),
        backgroundColor: const Color(0xff176B87),
      ),
    );
  }
}
