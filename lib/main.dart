
import 'package:flutter/material.dart';
import 'package:notes_app_provider/provider_directory/notes_home_provider.dart';
import 'package:notes_app_provider/provider_directory/notes_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp( MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (_)=> NotesProvider())
        ],
          child: const MyApp()));
    }



class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: mainnotespagefromprovider(),
    );
  }
}

