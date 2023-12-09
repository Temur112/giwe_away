import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.orangeAccent,
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Center(child: Text("My Profile")),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0,30.0,20.0,0.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage('assets/images/me.jpg'),
              ),
              Divider(height: 70.0, color: Colors.black45,),
              Row(
                children: [
                  Icon(Icons.person_outline, size: 40.0,),
                  SizedBox(width: 10.0),
                  Text("Diyorbek Usmanov", style: TextStyle(color: Colors.white70, fontSize: 20.0, letterSpacing: 2.0, fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 30.0,),
              Row(
                children: [
                  Icon(Icons.phone_outlined, size: 40.0,),
                  SizedBox(width: 10.0),
                  Text("+9981234567", style: TextStyle(color: Colors.white70, fontSize: 20.0, letterSpacing: 2.0, fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 20.0,),
              Row(
                children: [
                  Icon(Icons.email_outlined, size: 40.0,),
                  SizedBox(width: 10.0,),
                  Text("Email", style: TextStyle(color: Colors.white70, fontSize: 20.0, letterSpacing: 2.0, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}