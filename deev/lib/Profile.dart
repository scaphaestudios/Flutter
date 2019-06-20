import 'package:flutter/material.dart';


class Profile extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return new Scaffold(
          body: new Stack(
            children: <Widget>[
              ClipPath(
                child: Container(color: Colors.orange),
                clipper: getClipper(),
              ),
              Positioned(
                  width: 350.0,
                  top: MediaQuery.of(context).size.height / 5,
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://scontent.fkhi6-1.fna.fbcdn.net/v/t1.0-9/56395108_1062041260646080_28'
                                          '29181737689415680_n.jpg?_nc_cat=107&_nc_ht=scontent.fkhi6-1.fna&oh=bc62af9abad6fc85e5d186ae054747e2&oe=5D37E321'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.all(Radius.circular(75.0)),
                              boxShadow: [
                                BoxShadow(blurRadius: 7.0, color: Colors.black)
                              ])),
                      SizedBox(height: 40.0),
                      Text(
                        'Muhammad Raheel Anwar',
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'Programmer, Designer',
                        style: TextStyle(
                            fontSize: 17.0,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Montserrat'),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '+923029802838',
                        style: TextStyle(
                            fontSize: 17.0,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Montserrat'),
                      ),
                      SizedBox(height: 45.0),
                      OutlineButton(
                        borderSide: BorderSide(color:Colors.orange),
                        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                        child:   Text('Edit', style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14.0,
                            color: Colors.orange),),
                        onPressed: (){



                        },),
                      SizedBox(height: 15.0),
                      OutlineButton(
                        borderSide: BorderSide(color:Colors.orange),
                        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                        child:   Text('Logout', style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14.0,
                            color: Colors.orange),),
                        onPressed: (){

                          Navigator.pop(context);

                        },),
                    ],
                  ))
            ],
          ));
    }
  }

  class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
  var path = new Path();

  path.lineTo(0.0, size.height / 1.9);
  path.lineTo(size.width + 125, 0.0);
  path.close();
  return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
  // TODO: implement shouldReclip
  return true;
  }

}
