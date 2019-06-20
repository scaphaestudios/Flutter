import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {


  String tag;
  String activeTag = 'Near You';

BuildButton(this.tag);
  @override
  Widget build(BuildContext context) {
      return _buildButton(tag);
  }

  FlatButton _buildButton(tag) {
    Color color = tag == activeTag ? Colors.orange : Colors.orange[100];
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: color,
      child: Text(
        '$tag',
        textAlign: TextAlign.left,
      ),
      onPressed: (){


      },
    );
  }



}