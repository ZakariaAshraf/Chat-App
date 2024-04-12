import 'package:flutter/material.dart';

class CustomMatrialButton extends StatelessWidget {
  CustomMatrialButton({required this.color, required this.text, required this.onClick});
  final Color color;
  final String text;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        color: color,
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: MaterialButton(
          onPressed: onClick,
          height: 42,
          minWidth: 300,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
        ),
      ),
    );
  }
}
