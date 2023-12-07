import 'package:flutter/material.dart';
import 'package:giwe_away/Screens/profile_screen.dart';
import '../Widgets/main_widgets.dart';

class Login_Screen extends StatelessWidget {
  const Login_Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const InputField("Username", 370, 57.5, 10),
            const SizedBox(
              height: 25,
            ),
            const InputField("Password", 370, 57.5, 10),
            const SizedBox(
              height: 25,
            ),
            MyButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserProfile(),
                    ),
                  );
                },
                btnName: "Login"),
          ],
        ),
      ),
    );
  }
}

