import 'package:flutter/material.dart';
import 'package:giwe_away/Screens/adaptions_screen.dart';
import 'package:giwe_away/Screens/all_items.dart';
import 'package:giwe_away/Screens/donations_screen.dart';
import 'package:giwe_away/Screens/profile_screen.dart';
import 'package:giwe_away/Widgets/bottom_navigation.dart';
import '../Widgets/main_widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7DB6A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "GIVE",
                  style: TextStyle(fontSize: 24, fontFamily: "RobotoMono"),
                ),
                const SizedBox(width: 10,),
                Image.asset(
                  "assets/images/giving_hand.png",
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 10,),
                const Text("AWAY", style: TextStyle(fontSize: 24)),
              ],
            ),
            Image.asset(
              'assets/images/unwanted.png',
              width: 350,
              height: 250,
            ),
            const Center(
              child: Text(
                "Don’t throw it away\nGive it away",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MyButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  btnName: 'Give away',
                ),
                MyButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  btnName: 'Get donation',
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Search for more items",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            MyButton(
              onPressed: () {
                Navigator.pushNamed(context, '/explore');
              },
              btnName: 'Explore',
            ),
          ],
        ),
      ),
      bottomNavigationBar:MyBottomNavigationBar(
        selectedIndex: _currentIndex,
        onTabTapped: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      )
    );
  }
}
