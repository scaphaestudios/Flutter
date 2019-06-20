import 'package:flutter/material.dart';
import 'Model.dart';

class MoreDetail extends StatelessWidget {

final String title;
final String discription;
final String status;


  MoreDetail(this.title,this.discription,this.status);




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
                        width: 130.0,
                        height: 130.0,
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
                    SizedBox(height: 10.0),
                    Scrollbar(
                      child: Card(

                        elevation: 15.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[

                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(

                                    children: <Widget>[
                                      Icon(Icons.home),
                                      SizedBox(width: 10,),
                                      Text(title, style: new TextStyle(
                                        fontSize: 18.0,
                                        fontStyle: FontStyle.normal,
                                      ),)
                                    ],
                                  ),
                                  SizedBox(width: 30,),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.assistant_photo),
                                      SizedBox(width: 10,),
                                      Text(discription, style: new TextStyle(
                                        fontSize: 18.0,
                                        fontStyle: FontStyle.normal,
                                      ),)
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Divider(height: 1,),
                              SizedBox(height: 10,),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Fare:',
                                    style: new TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                    '${status}/-',
                                    style: new TextStyle(
                                      fontSize: 16.0,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),

                              Divider(height: 1,),
                              SizedBox(height: 10,),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Vehicle:',
                                    style: new TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                    'Car',
                                    style: new TextStyle(
                                      fontSize: 16.0,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),


                              Divider(height: 1,),
                              SizedBox(height: 10,),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Members:',
                                    style: new TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                    '2 ',
                                    style: new TextStyle(
                                      fontSize: 16.0,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Divider(height: 1,),

                              SizedBox(height: 10,),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Luggage:',
                                    style: new TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                    '25KG ',
                                    style: new TextStyle(
                                      fontSize: 16.0,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Divider(height: 1,),
                              SizedBox(height: 10,),

                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Contact:',
                                    style: new TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                    '03058978949',
                                    style: new TextStyle(
                                      fontSize: 16.0,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ],
                              ), SizedBox(height: 10,),
                              Divider(height: 1,),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: <Widget>[

  OutlineButton(
    borderSide: BorderSide(color:Colors.orange),
    shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    child:   Text('Call', style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 14.0,
        color: Colors.orange),),
    onPressed: (){



    },),


    OutlineButton(
    borderSide: BorderSide(color:Colors.orange),
    shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    child:   Text('Back', style: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14.0,
    color: Colors.orange),),
    onPressed: (){

      Navigator.pop(context);


    },),

    ],)

                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),

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
