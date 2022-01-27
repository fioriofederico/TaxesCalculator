import 'package:flutter/material.dart';

class ButtonActive extends StatelessWidget{
  String rate;
  bool state;
  Function()? onButtonPressed;
  ButtonActive(this.rate, this.onButtonPressed, this.state);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onButtonPressed,
      child: Text(rate,
          style: state ? TextStyle(Colors.white): TextStyle(Colors.blue)),
      style: state ? TextButton.styleFrom(backgroundColor: Colors.blue) : TextButton.styleFrom(backgroundColor: null),
    );
  }
}