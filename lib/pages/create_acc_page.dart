import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proje/widgets/button.dart';
import 'package:proje/widgets/text_field.dart';

class CreateAccPage extends StatefulWidget {
  final Function()? onTap;
  const CreateAccPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<CreateAccPage> createState() => _CreateAccPageState();
}

class _CreateAccPageState extends State<CreateAccPage> {
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordTextController = TextEditingController();
  void signUp() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      );
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessage(e.code);
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pop(context);
    }
  }

  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEEF5FF),
        body: Center(
          child: ListView(
            children: [
              const SizedBox(
                height: 70,
              ),
              const Icon(
                Icons.shopping_cart,
                size: 100,
                color: Color(0xff176B87),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  "Let's create an account for you",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff176B87),
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 70, 60, 0),
                child: MyTextField(
                  controller: nameTextController,
                  hintText: "Name Surname",
                  obscureText: false,
                  isNumber: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 10, 60, 0),
                child: MyTextField(
                  controller: emailTextController,
                  hintText: "Email",
                  obscureText: false,
                  isNumber: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 10, 60, 0),
                child: MyTextField(
                  controller: phoneNumberController,
                  hintText: "Phone Number",
                  obscureText: false,
                  isNumber: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 10, 60, 15),
                child: MyTextField(
                  controller: passwordTextController,
                  hintText: "Password",
                  obscureText: true,
                  isNumber: false,
                ),
              ),
              MyButton(onTap: signUp, text: "Sign Up"),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "You already have an account?",
                      style: TextStyle(fontSize: 17, color: Color(0xff176B87)),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    TextButton(
                      onPressed: widget.onTap,
                      child: const Text(
                        "Login now",
                        style: TextStyle(
                            color: Color(0xff86B6F6),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
