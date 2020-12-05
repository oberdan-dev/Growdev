import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final Color _color;

  Box(this._color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(
        horizontal: 50,
      ),
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
