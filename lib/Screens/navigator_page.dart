import 'package:flutter/material.dart';
import 'package:giwe_away/Screens/all_items.dart';
import 'package:giwe_away/Screens/donations_screen.dart';
import 'package:giwe_away/Screens/main_screen.dart';
import 'package:giwe_away/Screens/profile_screen.dart';

class NavigatorPage extends StatelessWidget {
  const NavigatorPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigatorHomePage(),
    );
  }
}

class NavigatorHomePage extends StatefulWidget {
  const NavigatorHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NavigatorHomePage> {
  bool _loggedIn = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Map<String, dynamic>? arguments =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
      _loggedIn = arguments?['loggedIn'] ?? false;
    });
  }

  int _currentIndex = 0;
  final List<Widget> _pages = [
    const MainScreen(),
    const AllItems(),
    const DonationsScreen(),
    const AdoptionsPage(),
    const UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if ((_loggedIn && index >= 2) || !_loggedIn) {
            setState(() {
              _currentIndex = index;
            });
          } else {
            print('User is not logged in. Restricted access.');
          }
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.orangeAccent,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orangeAccent,
            icon: Icon(Icons.search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orangeAccent,
            icon: Icon(Icons.list_alt),
            label: 'Donations',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orangeAccent,
            icon: Icon(Icons.shopping_cart),
            label: 'Adoptions',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.orangeAccent,
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}


class AdoptionsPage extends StatelessWidget {
  const AdoptionsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('AdoptionsPage Page'), // Updated text for consistency
      ),
    );
  }
}
