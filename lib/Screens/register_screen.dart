import 'package:flutter/material.dart';
import '../Widgets/main_widets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("registration page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Inputfield("First Name", 370, 57.5, 10),
            const SizedBox(
              height: 15,
            ),
            const Inputfield("Last name", 370, 57.5, 10),
            const SizedBox(
              height: 15,
            ),
            const Inputfield("Phone Number", 370, 57.5, 10),
            const SizedBox(
              height: 15,
            ),
            const Inputfield("Email", 370, 57.5, 10),
            const SizedBox(
              height: 35,
            ),
            const Inputfield(
                "Passord", 370, 57.5, 10), //need to use other type of widget
            const SizedBox(
              height: 15,
            ),
            const Inputfield("Confirm Password", 370, 57.5,
                10), //need to use other type of widget
            const SizedBox(
              height: 25,
            ),
            MyButton(
                onPressed: () {
                  print("object");
                },
                btnName: "Register"),
          ],
        ),
      ),
    );
  }
}
