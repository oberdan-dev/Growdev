import 'package:flutter/material.dart';

class ContentButton extends StatelessWidget {
  final String _texto;

  ContentButton(this._texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Center(
        child: Text(
          _texto,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        // ],
      ),
    );
  }
}
