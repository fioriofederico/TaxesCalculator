import 'package:flutter/material.dart';

class ButtonActive extends StatelessWidget{

  static const String LuxuryTax = "22%";
  static const String FoodTax = "10%";
  static const String AgriTax = "4%";

  String rate;
  bool enable;
  Function()? onButtonPressed;
  ButtonActive(this.rate, this.onButtonPressed, this.enable);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onButtonPressed,
      child: Text(rate,
          style: TextStyle(color: enable? Colors.white: Colors.blueGrey)),
      style: enable ? TextButton.styleFrom(backgroundColor: Colors.blue) : TextButton.styleFrom(backgroundColor: null),
    );
  }
}