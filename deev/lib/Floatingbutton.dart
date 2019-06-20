import 'package:flutter/material.dart';

class Floatingbutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          height: 60.0,
          width: 60.0,
          child: FittedBox(
            child: FloatingActionButton(

              backgroundColor: Colors.orange,
              heroTag: null,
              child: Icon(Icons.menu,color: Colors.white,),

              onPressed: (){},
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          height: 60.0,
          width: 60.0,
          child: FittedBox(
            child: FloatingActionButton(

              backgroundColor: Colors.orange,
              heroTag: null,
              child: Icon(Icons.share,color: Colors.white,),
              onPressed: (){},
            ),
          ),
        ),
      ],
    );
  }
}
