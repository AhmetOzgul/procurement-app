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
              //logo
              const FlutterLogo(
                size: 100,
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
              MyButton(onTap: () {}, text: "Sign Up"),
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
