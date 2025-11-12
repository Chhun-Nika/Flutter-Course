import 'package:example/W5/Lab/EX2/custom_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Custom Button"), centerTitle: false),
        body: Container(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(label: "Submit", icon: Icons.check,),
              CustomButton(label: "Time", icon: Icons.schedule, buttonType: ButtonType.secondary, iconPosition: IconPosition.right,),
              CustomButton(label: "Account", icon: Icons.account_tree, buttonType: ButtonType.disabled,),
            ],
          ),
        ),
      ),
    ),
  );
}
