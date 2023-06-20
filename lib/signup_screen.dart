import 'package:flutter/material.dart';

import 'db_helper.dart';
import 'login_screen.dart';


class signuppage extends StatefulWidget {

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {


  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var mobilecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var confirmpascontroller = TextEditingController();

  var name;
  var email;
  var mobile;
  var password;
  var confpass;
  var newtempone;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.pinkAccent,
          body: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text ('Signup Page', style: TextStyle(fontSize: 30)),
              ),
              TextField(
                decoration: InputDecoration (
                    labelText: "Enter Name",
                    enabledBorder: OutlineInputBorder (
                        borderSide: BorderSide(
                          width: 3, color: Colors.white,
                        )
                    )
                ),
                controller: namecontroller,
              ),
              TextField(
                decoration: InputDecoration (
                    labelText: "Enter Email",
                    enabledBorder: OutlineInputBorder (
                        borderSide: BorderSide(
                          width: 3, color: Colors.white,
                        )
                    )
                ),
                controller: emailcontroller,
              ),
              TextField(
                decoration: InputDecoration (
                    labelText: "Enter Mobile",
                    enabledBorder: OutlineInputBorder (
                        borderSide: BorderSide(
                          width: 3, color: Colors.white,
                        )
                    )
                ),
                controller: mobilecontroller,
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
                controller: passwordcontroller,
              ),
              TextField(
                controller: confirmpascontroller,
                decoration: InputDecoration (
                    labelText: "Confirm password",
                    enabledBorder: OutlineInputBorder (
                        borderSide: BorderSide(
                          width: 3, color: Colors.white,
                        )
                    )
                ),
                /*onChanged: (value) {
 if (value == passwordcontroller.text.toString()) {

 } else {

 }
 },*/

              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(onPressed: () async{

                  name = namecontroller.text.toString();
                  email = emailcontroller.text.toString();
                  mobile = mobilecontroller.text.toString();
                  password = passwordcontroller.text.toString();
                  confpass = confirmpascontroller.text.toString();

                  newtempone = await DBhelper().isemailexist (email);
                  if (newtempone== true) {
                    showDialog( context: context, builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('## ERROR', style: TextStyle(color: Colors.red)),
                        content: Text ('The user already exit'),
                        actions: [
                          TextButton(
                            onPressed: () {

                              Navigator.pop(context);
                              setState(() {

                              });
                            },
                            child: Text('Try Again Later'),
                          ),
                        ],
                      );

                    },
                    );
                  } else {

                    DBhelper().signupadddata(name, email, mobile, password);
                    Navigator.push(context, MaterialPageRoute (builder: (context) => logindetails()));
                  }

                }, child: Text('Sign Up')
                ),
              ),
              Text ('Already a user?', style: TextStyle (fontSize: 15)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute (builder: (context) => logindetails()));

                }, child: Text('User login')),
              )

            ],
          )



      ),
    );
  }
}
