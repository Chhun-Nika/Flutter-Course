import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("Favorite Cards"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            FavoriteCard(), 
            FavoriteCard(), 
            FavoriteCard()
          ],
        ),
      ),
    );
  }
}

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;

  void onClick() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 10, 20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[400]!)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                const Text(
                  "title",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text("Description"),
              ],
            ),
          ),
          IconButton(
            onPressed: onClick,
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            color: isFavorite ? Colors.red : Colors.grey,
          ),
        ],
      ),
    );
  }
}

// stateless widget
// class FavoriteCard extends StatelessWidget {
//   final bool isFavorite;
//   const FavoriteCard({super.key, required this.isFavorite});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         border: Border(bottom: BorderSide(color: Colors.grey[400]!)),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("title", style: TextStyle(color: Colors.blue,  fontWeight: FontWeight.bold)),
//                 Text("Description"),
//               ],
//             ),
//           ),
//           IconButton(onPressed: () => {}, icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border), color: isFavorite ? Colors.red : Colors.grey,),
//         ],
//       ),
//     );
//   }
// }
