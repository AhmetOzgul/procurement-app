import 'package:flutter/material.dart';

class ProductListItem extends StatefulWidget {
  final String productName;
  final String numberOfProduct;
  final String productImage;
  final bool showCartButton;
  const ProductListItem(
      {Key? key,
      required this.productName,
      required this.numberOfProduct,
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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Card(
        color: const Color(0xffB4D4FF),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                child: Image.network(
                  widget.productImage,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productName,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "${widget.numberOfProduct} Piece(s)",
                    style: const TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: widget.showCartButton
                  ? TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<CircleBorder>(
                            const CircleBorder()),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xff176B87)),
                      ),
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
