import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void setupFirebaseEmulator() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
