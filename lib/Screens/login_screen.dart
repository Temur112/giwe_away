import 'package:flutter/material.dart';
import 'package:giwe_away/Screens/all_items.dart';
import 'package:giwe_away/Screens/profile_screen.dart';
import '../Widgets/main_widgets.dart';

class Login_Screen extends StatelessWidget {
  final TextEditingController loginusrn = TextEditingController();
  final TextEditingController loginpswd = TextEditingController();
  Login_Screen({super.key});
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
            InputField("Username", 370, 57.5, 10, loginusrn),
            const SizedBox(
              height: 25,
            ),
            InputField("Password", 370, 57.5, 10, loginpswd),
            const SizedBox(
              height: 25,
            ),
            MyButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllItems(),
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
