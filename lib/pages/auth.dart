import 'package:flutter/material.dart';
import 'package:proje/pages/home_page.dart';
import 'package:proje/services/firebase_service.dart';
import 'package:proje/widgets/login_signup_toggle.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  @override
  Widget build(BuildContext context) {
    final FirebaseService _firebaseService = FirebaseService();
    return Scaffold(
      body: StreamBuilder(
        stream: _firebaseService.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
