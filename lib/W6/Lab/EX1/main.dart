import 'package:flutter/material.dart';

enum ButtonStyle {
  // using hexa color value instead since colors.blue[500] is not a compile time const
  selected("Selected", Colors.white, Color(0xFF009AFB)),
  notSelected("Not Selected", Colors.black, Color(0xFFE1F3FE));

  final String buttonLabel;
  final Color textColor;
  final Color buttonColor;

  const ButtonStyle(this.buttonLabel, this.textColor, this.buttonColor);
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Stateful widget - Button"), centerTitle: false,),
        body: Container(
          padding: EdgeInsets.all(30),
          child: Center(
            child: Column(
              spacing: 20,
              children: [
                SelectableButton(),
                SelectableButton(),
                SelectableButton(),
                SelectableButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  State<StatefulWidget> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  String get text => isSelected
      ? ButtonStyle.selected.buttonLabel
      : ButtonStyle.notSelected.buttonLabel;

  Color get textColor => isSelected
      ? ButtonStyle.selected.textColor
      : ButtonStyle.notSelected.textColor;
  Color get buttonColor => isSelected
      ? ButtonStyle.selected.buttonColor
      : ButtonStyle.notSelected.buttonColor;

  void onClick() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    // size box here is used to set the constain for its child
    // in this case the elevateButton has to be the same size as its parent - the sizedBox
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
        onPressed: onClick,
        child: Center(
          child: Text(text, style: TextStyle(color: textColor, fontSize: 20)),
        ),
      ),
    );
  }
}
