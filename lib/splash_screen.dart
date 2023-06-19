import 'dart:async';
import 'package:flutter/material.dart';
import 'package:notes_app_provider/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';
import 'notes_home.dart';


class splash extends StatefulWidget {

  @override
  State<splash> createState() => splashState();
}

class splashState extends State<splash> {


  @override
  void initState() {
    Timer(Duration (seconds:3), () {
      /*getLoginData();*/
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => signuppage(),));
    });
    super.initState();
  }


    /*void getLoginData() async{

    var prefs = await SharedPreferences.getInstance();
    bool? isLogin = prefs.getBool("Login");

    if (isLogin!= null) {

      if(isLogin) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => mainnotespage(),));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => logindetails(),));
      }

    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => logindetails(),));
    }

    }*/







  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.black26,
        body: Center(child: Container (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 50,
                  height: 50,
                  child: Icon(Icons.note_add_sharp, color: Colors.greenAccent, size: 50)),

              SizedBox(
                height: 50,
              ),
              Text ( 'Advance Notes App', style: TextStyle (fontSize: 30, color: Colors.white))
            ],
          ),
        ))


    );
  }
}
