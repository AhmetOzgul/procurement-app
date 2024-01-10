import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButton({Key? key, required this.onTap, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(110, 10, 110, 0),
      child: ElevatedButton(
        onPressed: onTap,
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Color(0xff176B87)),
            shape: MaterialStatePropertyAll(StadiumBorder()),
            elevation: MaterialStatePropertyAll(3),
            padding:
                MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 15))),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
