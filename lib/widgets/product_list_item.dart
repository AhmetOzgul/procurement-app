import 'package:flutter/material.dart';

class ProductListItem extends StatefulWidget {
  final String productName;
  final String productDescription;
  final String productImage;
  final bool showCartButton;
  const ProductListItem(
      {Key? key,
      required this.productName,
      required this.productDescription,
      required this.productImage,
      this.showCartButton = false})
      : super(key: key);

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Card(
        color: Color(0xffB4D4FF),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                child: Image.asset(
                  "lib/asd.jpeg",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productName,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.productDescription,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: widget.showCartButton
                  ? TextButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<CircleBorder>(
                            CircleBorder()),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xff176B87)),
                      ),
                    )
                  : SizedBox(), // Alternatively, you can use an empty SizedBox() or Container() here
            ),
          ],
        ),
      ),
    );
  }
}
