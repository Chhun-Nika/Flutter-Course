import 'package:example/W8/lab/EXERCISE-4/data/jokes_data.dart';
import 'package:example/W8/lab/EXERCISE-4/ui/screen/jokes.dart';
import 'package:example/W8/lab/EXERCISE-4/ui/theme/theme.dart';
import 'package:flutter/material.dart';



void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: const Text("Favorite Jokes"),
      ),
      body: JokesList(jokes: jokesData)
    ),
  ),
);



// class FavoriteCard extends StatefulWidget {
//   // final String title;
//   // final String description;
//   final JokeModel joke;

//   const FavoriteCard({super.key, required this.joke});

//   @override
//   State<FavoriteCard> createState() => _FavoriteCardState();
// }

// class _FavoriteCardState extends State<FavoriteCard> {
//   bool _isFavorite = false;

//   void onFavoriteClick() {
//     setState(() {
//       _isFavorite = !_isFavorite;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
//       ),
//       padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Expanded(
//             flex: 7,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   widget.joke.title,
//                   style: TextStyle(
//                     color: appColor,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//                 const SizedBox(height: 10.0),
//                 Text(widget.joke.description),
//               ],
//             ),
//           ),
//           IconButton(
//             onPressed: onFavoriteClick,
//             icon: Icon(
//               _isFavorite ? Icons.favorite : Icons.favorite_border,
//               color: _isFavorite ? Colors.red : Colors.grey,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


