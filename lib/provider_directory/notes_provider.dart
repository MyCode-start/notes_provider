
import 'package:flutter/cupertino.dart';

import '../db_helper.dart';

class NotesProvider extends ChangeNotifier {

  List<Map<String, dynamic>> myData = [];

  void addNotes (String title, String desc) async{

  await DBhelper().addData(title, desc);
   myData = await DBhelper().fetchData();
   notifyListeners();

  }


  void getNotes() async {
    myData = await DBhelper().fetchData();

  }



}
