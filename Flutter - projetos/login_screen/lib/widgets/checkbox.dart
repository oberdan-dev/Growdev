import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  final String _texto;

  CheckBox(this._texto);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              width: 25,
              height: 25,
              margin: EdgeInsets.symmetric(
                horizontal: 50,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Icon(Icons.check),
            ),
            Container(
              margin: EdgeInsets.only(left: 85, top: 5),
              child: Text(
                _texto,
                style: TextStyle(color: Colors.grey[600], fontSize: 16),
              ),
            )
          ],
        ),
      ],
    );
  }
}
