import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proje/services/firebase_service.dart';
import 'package:proje/widgets/product_list_item.dart';
import 'package:proje/widgets/text_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? searchKey;
  Stream? streamQuery;
  final searchController = TextEditingController();
  final FirebaseService _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.only(top: 80),
        child: StreamBuilder(
            stream: streamQuery,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(
                    child: Text('Some error occurred ${snapshot.error}'));
              }
              if (snapshot.hasData) {
                QuerySnapshot querySnapshot = snapshot.data;
                List<QueryDocumentSnapshot> documents = querySnapshot.docs;
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
                          showCartButton: true,
                          productName: thisItem['name'],
                          numberOfProduct: thisItem['quantity'],
                          productImage: thisItem['image']);
                    });
              } else {
                return Container();
              }
            }),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 40),
        child: MyTextField(
          onChanged: (value) {
            setState(() {
              searchKey = value;
              streamQuery = _firebaseService.searchProducts(searchKey!);
            });
          },
          controller: searchController,
          isNumber: false,
          obscureText: false,
          hintText: "Search Products",
        ),
      ),
    ]);
  }
}
