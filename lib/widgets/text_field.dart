import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool isNumber;
  final Color color;
  final Function(String)? onChanged;

  const MyTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.isNumber,
      this.color = const Color(0xffB4D4FF),
      this.onChanged})
      : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _isHidden = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      onChanged: widget.onChanged,
      controller: widget.controller,
      obscureText: widget.obscureText ? !_isHidden : false,
      keyboardType: widget.isNumber ? TextInputType.phone : TextInputType.text,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          labelText: widget.hintText,
          labelStyle: const TextStyle(
            color: Colors.white60,
          ),
          suffix: widget.obscureText
              ? InkWell(
                  onTap: _togglePasswordView,
                  child: Icon(
                    _isHidden ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                  ),
                )
              : null,
          hintStyle: TextStyle(color: Colors.grey[100]),
          // hintText: widget.hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff176B87)),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey)),
          fillColor: widget.color,
          filled: true),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
