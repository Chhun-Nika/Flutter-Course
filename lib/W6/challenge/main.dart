import 'package:flutter/material.dart';

// List<String> images = [
//   "assets/seasonImages/fall.png",
//   "assets/seasonImages/spring.png",
//   "assets/seasonImages/summer.png",
//   "assets/seasonImages/winter.png",
// ];
enum Seasons {
  fall("assets/seasonImages/fall.png"),
  spring("assets/seasonImages/spring.png"),
  summer("assets/seasonImages/summer.png"),
  winter("assets/seasonImages/winter.png");

  final String imgPath;
  const Seasons(this.imgPath);
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.white),
          child: ListView(
            children: [
              SeasonsContainer(
                children: [
                  SeasonsCard(
                    countryName: "Cambodia",
                    initialSeason: Seasons.summer,
                  ),
                  SeasonsCard(countryName: "France"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SeasonsContainer extends StatelessWidget {
  final List<Widget> children;

  const SeasonsContainer({super.key, required this.children});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            "SEASONS",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [...children.map((c) => c)],
          ),
        ],
      ),
    );
  }
}

class SeasonsCard extends StatefulWidget {
  final String countryName;
  final Seasons initialSeason;
  const SeasonsCard({
    super.key,
    required this.countryName,
    this.initialSeason = Seasons.fall,
  });

  @override
  State<SeasonsCard> createState() => _SeasonsCardState();
}

class _SeasonsCardState extends State<SeasonsCard> {
  late Seasons currentSeason = widget.initialSeason;

  String get currentImg => currentSeason.imgPath;

  void imgTap() {
    setState(() {
      switch (currentSeason) {
        case Seasons.fall:
          currentSeason = Seasons.winter;
          break;
        case Seasons.winter:
          currentSeason = Seasons.spring;
          break;
        case Seasons.spring:
          currentSeason = Seasons.summer;
          break;
        case Seasons.summer:
          currentSeason = Seasons.fall;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: imgTap,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 2),
                ),
              ),
              width: 150,
              child: Image.asset(currentImg, height: 350, fit: BoxFit.cover),
            ),
          ),
          Padding(padding: EdgeInsets.all(20), child: Text(widget.countryName)),
        ],
      ),
    );
  }
}
