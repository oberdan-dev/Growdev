import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final String _texto;
  final IconData _icon;

  Content(this._texto, this._icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 60),
      child: Row(
        children: [
          Icon(
            _icon,
            color: Colors.red,
          ),
          SizedBox(width: 10),
          Text(
            _texto,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
