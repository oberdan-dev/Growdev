import 'package:flutter/material.dart';

class BoxButton extends StatelessWidget {
  final _colors;

  BoxButton(this._colors);

  // BoxButton(this._color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(
        horizontal: 50,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            _colors[0],
            _colors[1],
          ],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
