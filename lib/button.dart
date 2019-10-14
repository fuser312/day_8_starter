import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Icon icon;
  final Function callback;
  Button({this.icon, this.callback});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: callback,
      child: icon,
      fillColor: Color(0xFF4C5FE),
      elevation: 6,
      constraints: BoxConstraints(
        minHeight: 56, minWidth: 56,
      ),
      shape: CircleBorder(),
    );
  }
}