import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_exam/app/app.dart';
import 'package:last_exam/app/bloc_observer.dart';
import 'utils/assistants/get_it/get_it.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // FirebaseMessaging.onBackgroundMessage();
  // await FirebaseMessaging.instance.subscribeToTopic("my_news");
  setup();
  await Firebase.initializeApp();
  Bloc.observer=AppBlocObserver();
  runApp(const App());
}
