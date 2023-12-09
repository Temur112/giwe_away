import 'package:flutter/material.dart';
import '../Widgets/main_widgets.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/people.png',
              width: 250,
              height: 250,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Don’t throw it away - Give it away",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Adjust alignment as needed
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
    );
  }
}
