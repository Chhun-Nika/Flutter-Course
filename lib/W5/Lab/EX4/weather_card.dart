import 'package:flutter/material.dart';

enum Weather {
  phnompenh("assets/ex4/cloudy.png", "Phnom Penh", "10.0", "30.0", "12.2", [
    Color.fromARGB(255, 213, 125, 248),
    Color.fromARGB(255, 172, 128, 249),
  ]),
  paris("assets/ex4/sunnyCloudy.png", "Paris", "10.0", "40.0", "22.2", [
    Color.fromARGB(255, 104, 234, 213),
    Color.fromARGB(255, 37, 220, 181),
  ]),
  rome("assets/ex4/sunny.png", "Rome", "10.0", "40.0", "42.5", [
    Color.fromARGB(255, 247, 108, 154),
    Color.fromARGB(255, 244, 79, 123),
  ]),
  toulouse("assets/ex4/veryCloudy.png", "Toulouse", "10.0", "40.0", "23.4", [
    Color(0xFFFFAD62),
    Color(0xFFF3BE9B),
  ]);

  final String image;
  final String city;
  final String minValue;
  final String maxValue;
  final String currentWeather;
  final List<Color> colors;

  const Weather(
    this.image,
    this.city,
    this.minValue,
    this.maxValue,
    this.currentWeather,
    this.colors,
  );
}

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      clipBehavior: Clip.hardEdge,
      color: Colors.black,
      borderRadius: BorderRadius.circular(20),
      elevation: 10,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: weather.colors,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -60,
              right: -40,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: weather.colors,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(
                right: 20,
                left: 20,
                top: 20,
                bottom: 35,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20,
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage(weather.image),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            weather.city,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Opacity(
                            opacity: 0.7,
                            child: Text(
                              'Max ${weather.minValue}°C',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Opacity(
                            opacity: 0.7,
                            child: Text(
                              'Max ${weather.maxValue}°C',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '${weather.currentWeather}°C',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
