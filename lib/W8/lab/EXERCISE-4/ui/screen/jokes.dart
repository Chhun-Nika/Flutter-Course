import 'package:example/W8/lab/EXERCISE-4/model/joke_model.dart';
import 'package:example/W8/lab/EXERCISE-4/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class JokesList extends StatefulWidget {
  final List<JokeModel> jokes;

  const JokesList({super.key, required this.jokes});

  @override
  State<JokesList> createState() => _JokesListState();
}

class _JokesListState extends State<JokesList> {
  // JokeModel? favoritedJoke;
  int? jokeFavoriteIndex;

  void favoriteSelected(int jokeIndex) {
    setState(() {
      if (jokeFavoriteIndex == jokeIndex) {
        jokeFavoriteIndex = null;
      } else {
        jokeFavoriteIndex = jokeIndex;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   children: [...widget.jokes.map((joke) => JokeCard(joke: joke))],
    // );
    return ListView.builder(
      itemCount: widget.jokes.length,
      itemBuilder: (context, index) {
        bool isFavorite = false;
        index == jokeFavoriteIndex ? isFavorite = true : isFavorite = false;
        return JokeCard(
          jokeIndex: index,
          joke: widget.jokes[index],
          onChange: favoriteSelected,
          isFavorite: isFavorite,
        );
      },
    );
  }
}

class JokeCard extends StatelessWidget {
  final int jokeIndex;
  final JokeModel joke;
  final bool isFavorite;
  final ValueChanged<int> onChange;
  // another suggestion we can also used the Voidcallback instead of manually defining the type inside the value change

  void handleOnChanged() {
    onChange(jokeIndex);
  }

  // why accessing directly through the data list? it is incorrect.
  // JokeModel get getJoke => jokesData[jokeIndex];

  const JokeCard({
    super.key,
    required this.jokeIndex,
    required this.joke,
    required this.onChange,
    this.isFavorite = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style: TextStyle(
                    color: AppColor.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(joke.description),
              ],
            ),
          ),
          IconButton(
            onPressed: handleOnChanged,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
              // Icons.favorite,
              // color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
