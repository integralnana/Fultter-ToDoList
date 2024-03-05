import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_screen/firebase_options.dart';
import 'package:onboarding_screen/screen/home_screen.dart';
import 'package:onboarding_screen/screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool show = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter on Boarding',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: show ? IntroScreen() : HomeScreen(),
    );
  }
}
