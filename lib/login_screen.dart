


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'db_helper.dart';
import 'notes_home.dart';

class logindetails extends StatefulWidget {

  @override
  State<logindetails> createState() => _logindetailsState();
}

class _logindetailsState extends State<logindetails> {


  var loginpasswordcontroller = TextEditingController();
  var loginemailcontroller = TextEditingController();

  var loginemail;
  var loginpassword;
  var newtemp;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey,
          body: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text ('Login Page', style: TextStyle(fontSize: 31)),

              TextField(
                decoration: InputDecoration (
                    labelText: "Enter Email",
                    enabledBorder: OutlineInputBorder (
                        borderSide: BorderSide(
                          width: 3, color: Colors.white,
                        )
                    )
                ),
                controller: loginemailcontroller,

              ),
              TextField(
                decoration: InputDecoration (
                    labelText: "Enter Password",
                    enabledBorder: OutlineInputBorder (
                        borderSide: BorderSide(
                          width: 3, color: Colors.white,
                        )
                    )
                ),
                controller: loginpasswordcontroller,

              ),


              ElevatedButton(onPressed: () async {

                loginemail = loginemailcontroller.text.toString();
                loginpassword = loginpasswordcontroller.text.toString();

                newtemp = await DBhelper().Authentication (loginemail, loginpassword);

                if (newtemp == true) {

                  /*var prefs = await SharedPreferences.getInstance();
                  prefs.setBool("Login", true);*/
                  Navigator.pushReplacement(context, MaterialPageRoute (builder: (context) => mainnotespage()));

                } else {

                  showDialog( context: context, builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('## ERROR', style: TextStyle(color: Colors.red)),
                      content: Text ('Please sign up first'),
                      actions: [
                        TextButton(
                          onPressed: () {

                            Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (BuildContext context) => mainnotespage(),
                            ),
                            );

                          },
                          child: Text('Signup'),
                        ),
                      ],
                    );

                  },
                  );
                }


              }, child: Text('Login')
              )

            ],
          )

      ),
    );
  }
}
