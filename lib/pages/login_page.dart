import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proje/widgets/button.dart';
import 'package:proje/widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void login() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
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
                  "Welcome! please login to your account",
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
                  controller: emailTextController,
                  hintText: "Email",
                  obscureText: false,
                  isNumber: false,
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
              MyButton(onTap: login, text: "Login"),
              Padding(
                padding: const EdgeInsets.only(top: 153),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "You don't have an account?",
                      style: TextStyle(fontSize: 17, color: Color(0xff176B87)),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    TextButton(
                      onPressed: widget.onTap,
                      child: const Text(
                        "Create one",
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
