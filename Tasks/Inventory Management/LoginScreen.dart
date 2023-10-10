import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';


import 'DashboardScreen.dart';
import 'RegisterScreen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>
{
  final _formKey = GlobalKey<FormState>();


  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();

  late SharedPreferences logindata;

  late bool newuser;
  var isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }
  void check_if_already_login() async
  {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                      margin: EdgeInsets.only(left: 25),
                      width: 350,
                      child: Column(
                        children: [
                          SizedBox(height: 100,),

                          Text("Welcome Back",style: TextStyle(color: CupertinoColors.white,fontSize: 25,fontWeight: FontWeight.bold),),

                          SizedBox(height: 25,),

                          TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.call),
                              hintText: "Enter Your Mobile",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20), // Reduced the value for a more reasonable radius
                              ),
                              filled: true, // Set filled to true
                              fillColor: Colors.white, // Set fillColor to white
                            ),
                            keyboardType: TextInputType.number,

                            controller: mobile ,

                          ),

                          SizedBox(height: 20,),

                          TextField(
                            decoration: InputDecoration(

                              prefixIcon: Icon(Icons.lock_outline),
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20), // Reduced the value for a more reasonable radius
                              ),
                              filled: true, // Set filled to true
                              fillColor: Colors.white, // Set fillColor to white
                            ),
                            keyboardType: TextInputType.text,
                            controller: password,
                          ),

                          SizedBox(height: 20,),

                          ElevatedButton(
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(Size(350, 50)),
                                elevation: MaterialStateProperty.all<double>(4.0), // Adjust the elevation as needed
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0), // Adjust the border radius as needed
                                  ),
                                ),
                              ),

                          onPressed: () async
                          {

                            var url = Uri.parse("https://roasting-conflict.000webhostapp.com/API/login.php");

                            var response = await http.post(url, body:
                            {
                              "pnumber": mobile.text.toString(),
                              "pass": password.text.toString(),
                            });
                            var data = json.decode(response.body);
                            if(data==0)
                            {
                              fail2();
                            }
                            else
                            {
                              success2();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                            }
                            _Login();

                          },
                              child: Text("Submit")),

                          SizedBox(height: 20,),

                          Row
                            (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                            [
                              ElevatedButton(onPressed: ()
                              {
                                facebook();
                              },
                                  child: Text("Facebook")),

                              SizedBox(width: 15),

                              ElevatedButton(onPressed: ()
                              {
                                google();
                              },
                                  style: ElevatedButton.styleFrom
                                    (
                                    padding: EdgeInsets.all(10.0),
                                  ),
                                  child: Text("Google")),
                            ],
                          ),

                          SizedBox(height: 20,),

                          GestureDetector(
                            onTap: onTap,
                            child: Text("Don't have an account yer? Register", style: TextStyle(color: CupertinoColors.white),),
                          ),



                        ],
                      ),
                    ),
              ],
            )
      ),
    resizeToAvoidBottomInset: false,
  );
}

void onTapText()
{
  Fluttertoast.showToast
    (
      msg: "Working on it",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.yellow
  );
}

void fail2()
{
  Fluttertoast.showToast
    (
      msg: "worong PhoneNumber And Password",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.yellow
  );
}

void success2()
{
  Fluttertoast.showToast
    (
      msg: "Welcome",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.yellow
  );
  Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
}


void facebook()
{
  var url = Uri.parse("https://www.facebook.com");
  launchUrl(url);
}

void google()
{
  var url = Uri.parse("https://www.google.com");
  launchUrl(url);
}



void onTap()
{
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Register()));
}



  void _Login() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    } else {
      _formKey.currentState?.save();
      String phonenumber = mobile.text; // Use mobile.text to get the text value
      String userPassword = password.text; // Use userPassword to get the text value

      if (phonenumber != '' && userPassword != '') {
        print('success');
        logindata.setBool('login', false);
        logindata.setString('phonenumber', phonenumber);
        //Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
      }
    }
  }


/*void _Login()
{

  final isValid  = _formKey.currentState?.validate();
  if(!isValid!)
  {
    return ;
  }
  else
  {
    _formKey.currentState?.save();
    String phonenumber = mobile;
    String password = password;

    if(phonenumber != '' && password !='')
    {
      print('success');
      logindata.setBool('login', false);
      logindata.setString('phnenumber', phonenumber);
      //Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));


    }
  }
}*/
}
