import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'DetailPage.dart';
import 'MoreDetail.dart';
import 'Model.dart';
import 'note_screen.dart';

class ListViewNote extends StatefulWidget {
  final Note note;
  ListViewNote(this.note);
  @override
  _ListViewNoteState createState() => new _ListViewNoteState();
}

final notesReference = FirebaseDatabase.instance.reference().child('notes');

class _ListViewNoteState extends State<ListViewNote> {
  List<Note> items;
  StreamSubscription<Event> _onNoteAddedSubscription;
  StreamSubscription<Event> _onNoteChangedSubscription;
  TextEditingController _titleController;
  TextEditingController _descriptionController;
  TextEditingController _statusController;
  @override
  void initState() {
    super.initState();

    items = new List();

    _titleController = new TextEditingController(text: widget.note.title);
    _descriptionController = new TextEditingController(text: widget.note.description);
    _statusController = new TextEditingController(text: widget.note.status);

    _onNoteAddedSubscription = notesReference.onChildAdded.listen(_onNoteAdded);
    _onNoteChangedSubscription = notesReference.onChildChanged.listen(_onNoteUpdated);
  }

  @override
  void dispose() {
    _onNoteAddedSubscription.cancel();
    _onNoteChangedSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon:Icon(Icons.backspace),color: Colors.orange,onPressed: (){
            Navigator.pop(context);
            
          },),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Rides',style: TextStyle(color: Colors.orange),),
centerTitle: true,
actions: <Widget>[
  IconButton(icon: Icon(Icons.search,color: Colors.orange,), onPressed: (){

   

  })
],
        ),
        resizeToAvoidBottomPadding: false,
        body: Scrollbar(

          child: Center(
            child: ListView.builder(
                itemCount: items.length,
                padding: const EdgeInsets.all(15.0),
                itemBuilder: (context, position) {
                  return Container(
                    height: 220,
                    width: double.infinity,
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20.0)),

                    child: Card(

                      elevation: 15.0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[

                             SafeArea(
                               child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                 children: <Widget>[
                                   Row(

                                     children: <Widget>[
                                       Icon(Icons.home),
                                       SizedBox(width: 10,),
                                       Text('${items[position].title}', style: new TextStyle(
                                         fontSize: 18.0,
                                         fontStyle: FontStyle.normal,
                                       ),)
                                     ],
                                   ),
                                    SizedBox(width: 40,),
                                   Row(
                                     children: <Widget>[
                                       Icon(Icons.assistant_photo),
                                       SizedBox(width: 10,),
                                       Text('${items[position].description}', style: new TextStyle(
                                         fontSize: 18.0,
                                         fontStyle: FontStyle.normal,
                                       ),)
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                             SizedBox(height: 20,),
                             Divider(height: 1,),
                             SizedBox(height: 10,),
                             Row(mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
                                 Text(
                                   'Fare:',
                                   style: new TextStyle(
                                     fontSize: 20.0,
                                     fontWeight: FontWeight.bold,
                                   ),
                                 ),
                                 SizedBox(width: 10,),
                                 Text(
                                   '${items[position].status}/-',
                                   style: new TextStyle(
                                     fontSize: 20.0,
                                     fontStyle: FontStyle.normal,
                                   ),
                                 ),
                               ],
                             ),
                             SizedBox(height: 10,),
                             Divider(height: 1,),
                           SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                OutlineButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => MoreDetail('${items[position].title}','${items[position].description}','${items[position].status}')));
                              },
                                  borderSide: BorderSide(color:Colors.orange,width: 2,),
                                  shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                  child: Text('Details', style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14.0,
                                      color: Colors.orange),)

                        ),

                                OutlineButton(
                                    onPressed: (){

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => DetailPage()),
                                      );

                                    },
                                    borderSide: BorderSide(color:Colors.orange,width: 2,),
                                    shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                    child: Text('Done', style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 14.0,
                                        color: Colors.orange),)

                                )

                                  ],
                        )



                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          child: Icon(Icons.add),
          onPressed: () => showReview(context),
        ),
      ),
    );
  }

  void _onNoteAdded(Event event) {
    setState(() {
      items.add(new Note.fromSnapshot(event.snapshot));
    });
  }

  void _onNoteUpdated(Event event) {
    var oldNoteValue = items.singleWhere((note) => note.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldNoteValue)] = new Note.fromSnapshot(event.snapshot);
    });
  }

  void _deleteNote(BuildContext context, Note note, int position) async {
    await notesReference.child(note.id).remove().then((_) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToNote(BuildContext context, Note note) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteScreen(note)),
    );
  }

  void _createNewNote(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteScreen(Note(null, '', '',''))),
    );
  }

  Future<bool> showReview(context) {
    _statusController.clear();
    _descriptionController.clear();
    _titleController.clear();
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: SingleChildScrollView(
                child: Container(
                    height: 450.0,
                    width: 300.0,
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(height: 150.0),
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
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 2.0),
                                      image: DecorationImage(
                                          image:
                                          NetworkImage(
                                              'https://scontent.fkhi6-1.fna.fbcdn.net/v/t1.0-9/56395108_1062041260646080_2829181737689415680_n.jpg?_nc_cat=107&_nc_ht=scontent.fkhi6-1.fna&oh=bc62af9abad6fc85e5d186ae054747e2&oe=5D37E321'),
                                          fit: BoxFit.cover)),
                                ))
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.all(15.0),
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              TextField(
                                controller: _titleController,
                                decoration: InputDecoration(labelText: 'From',labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                              ),
                              Padding(padding: new EdgeInsets.all(5.0)),
                              TextField(

                                controller: _descriptionController,
                                decoration: InputDecoration(labelText: 'To',labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                              ),
                              TextField(
                                controller: _statusController,
                                decoration: InputDecoration(
                                    
                                    labelText: 'Fare',labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                              ),
                              Padding(padding: new EdgeInsets.all(5.0)),
                              OutlineButton(
                                borderSide: BorderSide(color:Colors.orange),
                                shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                                child: (widget.note.id != null) ? Text('Update', style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14.0,
                                    color: Colors.orange),) : Text('Add', style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14.0,
                                    color: Colors.orange),),

                                onPressed: () {
                                  if (widget.note.id != null) {
                                    notesReference.child(widget.note.id).set({
                                      'title': _titleController.text,
                                      'description': _descriptionController.text,
                                      'status': _statusController.text

                                    }).then((_) {
                                      Navigator.pop(context);
                                    });
                                  } else {
                                    notesReference.push().set({
                                      'title': _titleController.text,
                                      'description': _descriptionController.text,
                                      'status': _statusController.text
                                    }).then((_) {
                                      Navigator.pop(context);
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ),

                      ],
                    )),
              ));
        });
  }
}
