import 'package:flutter/material.dart';

import '../widgets/product_list_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            ProductListItem(
                showCartButton: true,
                productName: "ASDAsd",
                productDescription: "productDescription",
                productImage:
                    "https://www.bluemint.com/content/images/thumbs/026/0267753_atil_1200.jpeg"),
            ProductListItem(
                showCartButton: true,
                productName: "ASDAsd",
                productDescription: "productDescription",
                productImage:
                    "https://www.bluemint.com/content/images/thumbs/026/0267753_atil_1200.jpeg"),
            ProductListItem(
                showCartButton: true,
                productName: "ASDAsd",
                productDescription: "productDescription",
                productImage:
                    "https://www.bluemint.com/content/images/thumbs/026/0267753_atil_1200.jpeg"),
            ProductListItem(
                showCartButton: true,
                productName: "ASDAsd",
                productDescription: "productDescription",
                productImage:
                    "https://www.bluemint.com/content/images/thumbs/026/0267753_atil_1200.jpeg"),
            ProductListItem(
                showCartButton: true,
                productName: "ASDAsd",
                productDescription: "productDescription",
                productImage:
                    "https://www.bluemint.com/content/images/thumbs/026/0267753_atil_1200.jpeg"),
            ProductListItem(
                showCartButton: true,
                productName: "ASDAsd",
                productDescription: "productDescription",
                productImage:
                    "https://www.bluemint.com/content/images/thumbs/026/0267753_atil_1200.jpeg"),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 40),
        child: SearchAnchor(
            builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
            side: const MaterialStatePropertyAll(
                BorderSide(color: Color(0xff176B87), width: 1)),
            backgroundColor: const MaterialStatePropertyAll(Color(0xffB4D4FF)),
            controller: controller,
            padding: const MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0)),
            onTap: () {
              controller.openView();
            },
            onChanged: (_) {
              controller.openView();
            },
            trailing: const [
              Icon(
                Icons.search,
                size: 40,
                color: Colors.white,
              )
            ],
          );
        }, suggestionsBuilder:
                (BuildContext context, SearchController controller) {
          return List<ListTile>.generate(5, (int index) {
            final String item = 'item $index';
            return ListTile(
              title: Text(item),
              onTap: () {
                setState(() {
                  controller.closeView(item);
                });
              },
            );
          });
        }),
      ),
    ]);
  }
}
