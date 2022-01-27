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
          style: TextStyle(color: state? Colors.white: Colors.blueGrey)),
      style: state ? TextButton.styleFrom(backgroundColor: Colors.blue) : TextButton.styleFrom(backgroundColor: null),
    );
  }
}