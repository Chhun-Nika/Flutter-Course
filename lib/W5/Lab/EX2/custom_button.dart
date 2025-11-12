import 'package:flutter/material.dart';

enum ButtonType {
  // enum values
  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Color(0xFFE3DCE5));

  // attribute for each enum value
  final Color color;
  // constructor to set the enum value, what fields are need to create an enum value
  const ButtonType(this.color);
}

enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.buttonType = ButtonType.primary,
    this.iconPosition = IconPosition.left,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: buttonType.color,
        textStyle: TextStyle(fontSize: 20),
        padding: EdgeInsets.all(20),
      ),
      // set the on pressed to null when the button type is disable so that it is not clickable
      onPressed: buttonType == ButtonType.disabled ? null : () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPosition == IconPosition.left)
            Padding(
              padding: EdgeInsetsGeometry.only(left: 10, right: 10),
              child: Icon(icon),
            ),
          Text(label, style: TextStyle(fontSize: 20)),

          if (iconPosition == IconPosition.right)
            Padding(
              padding: EdgeInsetsGeometry.only(left: 10, right: 10),
              child: Icon(icon),
            ),
        ],
      ),
    );
  }
}
