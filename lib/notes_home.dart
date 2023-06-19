import 'package:flutter/material.dart';

import 'db_helper.dart';

class mainnotespage extends StatefulWidget {

  @override
  State<mainnotespage> createState() => _mainnotespageState();
}

class _mainnotespageState extends State<mainnotespage> {

  var titlecontroller= TextEditingController();
  var descriptioncontroller= TextEditingController();
  var title;
  var description;
  List<Map<String, dynamic>> notes = [];
  var id;


  @override
  void initState() {
    getAllNotes();
    super.initState();
  }

  Future<List<Map<String, dynamic>>> getAllNotes() async{
    return notes= await DBhelper().fetchData();
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Note app'),
        ),
        backgroundColor: Colors.black26,
        body: GridView.builder(
            itemCount: notes.length,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
                child: InkWell(

                  onLongPress: () {
                    showDialog( context: context, builder: (BuildContext context) {
                      return AlertDialog(
                          title: Text('Delete'),
                          content: Text ('Are you sure you want to delete the text'),
                          actions: [
                            TextButton(

                              onPressed: () {
                                DBhelper().delData(notes[index]['note_id']);
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context)=> mainnotespage())));
                              }, child: Text('Delete'),

                              /*onLongPress: () async{

                                DBhelper().delData(notes[index]['note_id']);
                                /*getAllNotes();*/
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context)=> mainnotespage())));

                              },*/
                            ),
                            TextButton(

                              onPressed: () {
                                Navigator.pop(context);
                              }, child: Text('Cancel'),
                            )
                          ]
                      );
                    },
                    );
                    setState(() { });
                  }, child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.greenAccent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(notes[index]['note_title'], style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(notes[index]['note_desc'], style: TextStyle(fontSize: 15)),
                      ),
                    ],
                  ),

                ),
                ),
              );
            }
        ),


        floatingActionButton: FloatingActionButton(onPressed: () {

          showDialog( context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Add a new note'),
              content: Column(
                children: [
                  TextField(
                    controller: titlecontroller,
                    decoration: InputDecoration(hintText: 'Title'),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: descriptioncontroller,
                    decoration: InputDecoration(hintText: 'Description'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    title = titlecontroller.text.toString();
                    description = descriptioncontroller.text.toString();
                    DBhelper().addData(title, description);
                    /*getAllNotes();*/
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context)=> mainnotespage())));
                    setState(() {

                    });
                  },
                  child: Text('SAVE'),
                ),
              ],
            );

          },
          );

        }, child: Icon (Icons.add),

        )
    );
  }
}
