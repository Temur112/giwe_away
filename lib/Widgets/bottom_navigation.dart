import 'package:flutter/material.dart';

import '../Screens/adaptions_screen.dart';
import '../Screens/all_items.dart';
import '../Screens/donations_screen.dart';
import '../Screens/main_screen.dart';
import '../Screens/profile_screen.dart';
import 'main_widgets.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabTapped;

  const MyBottomNavigationBar({
    required this.selectedIndex,
    required this.onTabTapped,
  });

  void _navigateAndHighlight(int index, BuildContext context) {
    if (selectedIndex != index) {
      onTabTapped(index); // Update the selected index

      String routeName;
      switch (index) {
        case 0:
          routeName = '/home_page';
          break;
        case 1:
          routeName = '/explore';
          break;
        case 2:
          routeName = '/donations';
          break;
        case 3:
          routeName = '/adoptions';
          break;
        case 4:
          routeName = '/profile';
          break;
        default:
          return;
      }

      List<Widget Function()> screenBuilders = [
        () => MainScreen(),
        () => AllItems(),
        () => DonationsScreen(),
        () => AdaptionsScreen(),
        () => UserProfile(),
      ];

      Navigator.pushReplacement(
        context,
        CustomPageRoute(
          builder: (context) {
            return screenBuilders[index]();
          },
          settings: RouteSettings(name: routeName),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget Function()> screenBuilders = [
      () => MainScreen(), // Replace with your actual home page widget
      () => AllItems(), // Replace with your actual explore page widget
      () => DonationsScreen(), // Replace with your actual donations page widget
      () => AdaptionsScreen(), // Replace with your actual adoptions page widget
      () => UserProfile(), // Replace with your actual profile page widget
    ];

    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      currentIndex: selectedIndex,
      onTap: (index) => _navigateAndHighlight(index, context),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'home_page',
          backgroundColor: Colors.orangeAccent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'explore',
          backgroundColor: Colors.orangeAccent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.monetization_on),
          label: 'Donations',
          backgroundColor: Colors.orangeAccent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pets),
          label: 'Adoptions',
          backgroundColor: Colors.orangeAccent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'profile',
          backgroundColor: Colors.orangeAccent,
        ),
      ],
    );
  }
}
