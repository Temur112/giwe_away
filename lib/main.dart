import 'package:flutter/material.dart';
import 'package:giwe_away/Screens/all_items.dart';
import 'package:giwe_away/Screens/create_new_item.dart';
import 'package:giwe_away/Screens/navigator_page.dart';
import 'package:giwe_away/Screens/product_details.dart';
import 'package:giwe_away/Widgets/bottom_navigation.dart';
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
        '/': (context) => const NavigatorPage(),
        // '/intro_2': (context) => const IntroScreen("Take instead of purchasing",
        //     "assets/images/people.png", "Go registration", "/register"),
        // '/home_page': (context) => MainScreen(),
        // '/register': (context) => const RegisterScreen(),
        // '/login': (context) => Login_Screen(),
        // '/profile': (context) => const UserProfile(),
        // '/explore': (context) => const AllItems(),
        // '/add_item': (context) => const CreateNewItem(),
        // '/product_details': (context) => const ProductDetails(),
      },
    );
  }
}
