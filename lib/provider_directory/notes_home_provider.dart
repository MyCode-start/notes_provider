import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../db_helper.dart';
import 'notes_provider.dart';



class mainnotespagefromprovider extends StatefulWidget {

  @override
  State<mainnotespagefromprovider> createState() => _mainnotespagefromproviderState();
}


class _mainnotespagefromproviderState extends State<mainnotespagefromprovider> {

  var titlecontroller= TextEditingController();
  var descriptioncontroller= TextEditingController();
  var title;
  var desc;

  List<Map<String, dynamic>> arrNotes = [];



  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Note app'),
        ),
        backgroundColor: Colors.black26,
        body: Consumer<NotesProvider>(
        builder: (_, __, ___) {
          return GridView.builder(
              itemCount: arrNotes.length,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 20, bottom: 10),
                  child: InkWell(

                    onLongPress: () {
                      showDialog(
                        context: context, builder: (BuildContext context) {
                        return AlertDialog(
                            title: Text('Delete'),
                            content: Text(
                                'Are you sure you want to delete the text'),
                            actions: [
                              TextButton(

                                onPressed: () {
                                  /*DBhelper().delData(notes[index]['note_id']);
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context)=> mainnotespage())));*/
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
                    }, child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.greenAccent,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(arrNotes[index][DBhelper().columnTitle], style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(arrNotes[index][DBhelper().columnDesc],
                              style: TextStyle(fontSize: 15)),
                        ),
                      ],
                    ),

                  ),
                  ),
                );
              }
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
                    desc = descriptioncontroller.text.toString();
                    context.read<NotesProvider>().addNotes(title, desc);
                    Navigator.pop(context);

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

  void getAllData() {
    arrNotes = context.watch<NotesProvider>().myData;
  }

}
