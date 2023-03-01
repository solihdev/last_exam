import 'package:flutter/material.dart';
import 'package:last_exam/app/app.dart';
import 'utils/assistants/get_it/get_it.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const App());
}
