import 'package:flutter/material.dart';
import 'Profile.dart';
import 'Status.dart';
class LiftInfo extends StatelessWidget {
  static bool active =true;
  final double blur = active ? 30 : 0;
  final double offset = active ? 20 : 0;
  final double top = active ? 100 : 200;
  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(


        duration: Duration(milliseconds: 500),
        curve: Curves.easeOutQuint,
        margin: EdgeInsets.only(top: top, bottom: 50, right: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: blur,
              offset: Offset(offset, offset),
            ),
          ],
        ),
        child: Center(
          child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(height: 350,
                    ),
                    Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          color: Colors.orange),
                    ),
                    Positioned(
                        top: 50.0,
                        left: 94.0,
                        child: Container(
                          height: 90.0,
                          width: 90.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45.0),
                              border: Border.all(
                                  color: Colors.orange,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                              image: DecorationImage(
                                  image:
                                  NetworkImage('https://scontent.fkhi6-1.fna.fbcdn.net/v/t1.0-9/56395108_1062041260646080_2829181737689415680_n.jpg?_nc_cat=107&_nc_ht=scontent.fkhi6-1.fna&oh=bc62af9abad6fc85e5d186ae054747e2&oe=5D37E321'),
                                  fit: BoxFit.cover)),

                        )
                    ),
                    Positioned(
                        top: 150.0,
                        left: 50.0,
                        child: Container(
                          height: 100.0,
                          width: 250.0,
                          child: Text('Muhammad Raheel Anwar',style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),
                            textAlign: TextAlign.justify,),

                        )
                    ),
                    Positioned(
                        top: 80.0,
                        left: 44.0,
                        child: Container(
                            height: 100.0,
                            width: 250.0,
                            child:Icon(Icons.verified_user,color: Colors.orange,)
                        )
                    ),
                    Positioned(
                        top: 200.0,

                        child: Container(

                            height: 200.0,
                            width: 250.0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(

                                children: <Widget>[

                                  SizedBox(height: 5,),
                                  SizedBox(width: double.maxFinite,height: 0.25,child: Container(color: Colors.black,),),
                                  SizedBox(height: 3,),
                                  Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.supervised_user_circle,size: 20,color: Colors.black,), Divider(height: 5,color: Colors.black,),
                                          Text('54',style: TextStyle(fontSize: 16))



                                        ],
                                      ),
                                      SizedBox(width: 50,),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.directions_car,size: 20,color: Colors.black,),
                                          Divider(height: 5,color: Colors.black,),
                                          Text('23',style: TextStyle(fontSize: 16),),



                                        ],
                                      ),


                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  SizedBox(width: double.maxFinite,height: 0.25,child: Container(color: Colors.black,),),
                                  SizedBox(height: 30,),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      OutlineButton(
                                        borderSide: BorderSide(color:Colors.orange),
                                        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                        child:   Text('Reviews', style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 14.0,
                                            color: Colors.orange),),
                                        onPressed: (){

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => Profile()),
                                          );

                                        },),
                                      OutlineButton(
                                        borderSide: BorderSide(color:Colors.orange),
                                        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                        child:   Text('Status', style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 14.0,
                                            color: Colors.orange),),
                                        onPressed: (){

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => Status()),
                                          );
                                        },)
                                    ],
                                  ),
                                  SizedBox(height: 5,),

                                ],
                              ),
                            )
                        )
                    ),


                  ],
                ),
              ]),
        ));
  }
}
