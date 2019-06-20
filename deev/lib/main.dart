import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'slideshow.dart';
import 'Floatingbutton.dart';
void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatelessWidget {
  final PageController ctrl = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

        home: Scaffold(

      resizeToAvoidBottomPadding: false,
      body:Stack(
        children: <Widget>[
            Slideshow()

        ],
      )


    ));
  }
}