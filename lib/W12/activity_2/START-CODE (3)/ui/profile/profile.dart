import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Center(child: Column(children: [
          CircleAvatar(radius: 60, backgroundImage: AssetImage('assets/w8/profile.jpg'),),
          const SizedBox(height: 40,),
          Text("Ronan THE BEST", style: TextStyle(fontSize: 30),)
        ],),),
      ),
    );
  }
}
