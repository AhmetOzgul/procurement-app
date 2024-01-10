import 'package:flutter/material.dart';

class ProductOnHome extends StatelessWidget {
  const ProductOnHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        height: 40,
        width: 40,
        color: Color(0xffB4D4FF),
      ),
    );
  }
}
