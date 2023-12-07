import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  final String screenTitle;
  final String buttonTitle;
  final String imagePath;
  final String nextRoute;

  const IntroScreen(
    this.screenTitle,
    this.imagePath,
    this.buttonTitle,
    this.nextRoute, {
    super.key,
  });
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(
              screenTitle,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
            height: 30,
            ),
            Image.asset(imagePath),
              const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, nextRoute);
              },
              child: Text(buttonTitle),
              ),
            ],
        ),
      ),
    );
  }
}
