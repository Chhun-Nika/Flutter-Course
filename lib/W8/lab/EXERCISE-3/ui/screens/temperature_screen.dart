import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key, this.active = true, required this.onChange});
  final bool active;
  final ValueChanged<bool> onChange;

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  String input = '';
  double resultInFahrenheit = 0;

  void handleOnChage (String value) {
    setState(() {
      input = value;
    });
  }

  double temperatureConversion () {
    final number = double.tryParse(input);
    if (number == null) {
      resultInFahrenheit = 0;
    } else {
      resultInFahrenheit = (number * 9/5) + 32;
    }
    return resultInFahrenheit;
  }

  void handleClick() {
    widget.onChange(widget.active);
  }

  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.thermostat_outlined,
              size: 120,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 45),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Temperature in Degrees:"),
            const SizedBox(height: 10),
            TextField(
              onChanged: (value) => handleOnChage(value),
              decoration: inputDecoration,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30),
            const Text("Temperature in Fahrenheit:"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(temperatureConversion().toString()),
            ),
            const SizedBox(height: 50),
            OutlinedButton(
              onPressed: handleClick,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 1.0, color: Colors.white),
                padding: EdgeInsets.all(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.arrow_back, color: Colors.white),
                  const SizedBox(width: 20),
                  const Text(
                    'Back to welcome page',
                    style: TextStyle(color: Colors.white, fontSize: 15),
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

// class TemperatureScreen extends StatelessWidget {
//   TemperatureScreen({super.key, this.active = true, required this.onChange});
//   final bool active;
//   final ValueChanged<bool> onChange;

//   void handleClick() {
//     onChange(active);
//   }

//   final InputDecoration inputDecoration = InputDecoration(
//     enabledBorder: OutlineInputBorder(
//       borderSide: const BorderSide(color: Colors.white, width: 1.0),
//       borderRadius: BorderRadius.circular(12),
//     ),
//     hintText: 'Enter a temperature',
//     hintStyle: const TextStyle(color: Colors.white),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(40.0),
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const Icon(
//               Icons.thermostat_outlined,
//               size: 120,
//               color: Colors.white,
//             ),
//             const Center(
//               child: Text(
//                 "Converter",
//                 style: TextStyle(color: Colors.white, fontSize: 45),
//               ),
//             ),
//             const SizedBox(height: 50),
//             const Text("Temperature in Degrees:"),
//             const SizedBox(height: 10),
//             TextField(
//               decoration: inputDecoration,
//               style: const TextStyle(color: Colors.white),
//             ),
//             const SizedBox(height: 30),
//             const Text("Temperature in Fahrenheit:"),
//             const SizedBox(height: 10),
//             Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: const Text('test'),
//             ),
//             const SizedBox(height: 50),
//             OutlinedButton(
//               onPressed: handleClick,
//               style: OutlinedButton.styleFrom(
//                 side: const BorderSide(width: 1.0, color: Colors.white),
//                 padding: EdgeInsets.all(20),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(Icons.arrow_back, color: Colors.white),
//                   const SizedBox(width: 20),
//                   const Text(
//                     'Back to welcome page',
//                     style: TextStyle(color: Colors.white, fontSize: 15),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
