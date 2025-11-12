import 'package:example/W5/Lab/EX1/hobby_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My Hobbies'), centerTitle: false),
        body: Container(
          decoration: BoxDecoration(color: Color(0xFF9E9E9E)),
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // before widget is created
                // Container(
                //   padding: EdgeInsets.all(30),
                //   decoration: BoxDecoration(
                //     color: Colors.green,
                //     borderRadius: BorderRadius.all(Radius.circular(20)),
                //   ),
                //   child: Center(
                //     child: Row(
                //       children: [
                //         Padding(
                //           padding: EdgeInsets.only(right: 20),
                //           child: Icon(Icons.travel_explore, color: Colors.white,),
                //         ),
                //         Text('Travelling', style: TextStyle(color: Colors.white, fontSize: 24),),
                //       ],
                //     ),
                //   ),
                // ),

                // using customize widget (HobbyCard)
                HobbyCard(
                  text: "Travelling",
                  icon: Icons.travel_explore,
                  inputColor: Colors.deepPurpleAccent,
                ),
                HobbyCard(
                  text: "Skating",
                  icon: Icons.skateboarding,
                  inputColor: Colors.teal,
                ),
                HobbyCard(text: "Swimming", icon: Icons.water),
                HobbyCard(text: "Hiking", icon: Icons.hiking_rounded, inputColor: Colors.brown,)
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

// class Home extends StatelessWidget {
//   const Home ({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
