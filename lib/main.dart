import 'package:flutter/material.dart';
import 'package:giwe_away/Screens/all_items.dart';
import 'Screens/starting_scene.dart';
import 'Screens/register_screen.dart';
import 'Screens/profile_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => MainScreen(),
        //'/': (context) => const IntroScreen("Used items for free",
        //    "assets/images/people.png", "Get started", "/intro_2"),
        //'/intro_2': (context) => const IntroScreen("Take instead of purchasing",
        //    "assets/images/people.png", "Go registration", "/register"),
        '/register': (context) => const RegisterScreen(),
        '/login': (context) => Login_Screen(),
        '/profile': (context) => const UserProfile(),
        '/explore': (context) => AllItems(),
      },
    );
  }
}