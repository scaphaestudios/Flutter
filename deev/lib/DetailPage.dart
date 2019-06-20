import 'package:flutter/material.dart';


class DetailPage extends StatelessWidget {
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
                                    'https://scontent.fkhi6-1.fna.fbcdn.net/v/t1.0-9/52609002_2508405542736095_2518091196241281024_n.jpg?_nc_cat=111&_nc_ht=scontent.fkhi6-1.fna&oh=e3afff9d991626e11ae9b76d1430f8b4&oe=5D3D86B6'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(75.0)),
                            boxShadow: [
                              BoxShadow(blurRadius: 7.0, color: Colors.black)
                            ])),
                    SizedBox(height: 40.0),
                    Text(
                      'Muhammad Ehsan Chohan',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'Verified',
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
                    SizedBox(height: 10.0),
                    Text(
                      'Male',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(height: 25.0),
                    OutlineButton(
                      borderSide: BorderSide(color:Colors.orange),
                      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                      child:   Text('Contact', style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14.0,
                          color: Colors.orange),),
                      onPressed: (){



                      },),
                    SizedBox(height: 15.0),
                    OutlineButton(
                      borderSide: BorderSide(color:Colors.orange),
                      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                      child:   Text('Done', style: TextStyle(
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
