import 'package:example/W5/Lab/EX4/weather_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: Color(0xFF70C9F4)),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: <Widget>[
            WeatherCard(weather: Weather.phnompenh),
            const SizedBox(height: 16,),
            WeatherCard(weather: Weather.paris),
            const SizedBox(height: 16,),
            WeatherCard(weather: Weather.rome),
            const SizedBox(height: 16,),
            WeatherCard(weather: Weather.toulouse),
            const SizedBox(height: 16,),
            WeatherCard(weather: Weather.paris),
            const SizedBox(height: 16,),
            WeatherCard(weather: Weather.rome),
            const SizedBox(height: 16,),
            WeatherCard(weather: Weather.toulouse)
          ],
        ),
      ),
    );
  }
}
