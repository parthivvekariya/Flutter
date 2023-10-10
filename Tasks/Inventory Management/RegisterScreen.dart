


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


import 'package:url_launcher/url_launcher.dart';


import 'LoginScreen.dart';


class Register extends StatefulWidget
{
  RegState createState() => RegState();
}


enum GenderSelect {Male,Female}


class RegState extends State<Register>
{

  TextEditingController First_Name = TextEditingController();
  TextEditingController Last_Name = TextEditingController();
  //TextEditingController Gender = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController Password = TextEditingController();

  GenderSelect _gender = GenderSelect.Male;
  String _finalgender="";



  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      backgroundColor: Colors.black,
      body: Center
        (
        child: Column
          (
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 25),
              width: 350,
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    Text("Create An Account", style: TextStyle(fontSize: 24, color: Colors.white),),

                    SizedBox(height: 25),


                    TextField
                      (
                      controller: First_Name,
                      decoration: InputDecoration
                        (
                        border: OutlineInputBorder
                          (
                          borderRadius: BorderRadius.circular(20),
                        ),

                        prefixIcon: Icon(Icons.person),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[700]),
                        hintText: "First Name",
                        fillColor: Colors.white,
                      ),
                    ),

                    SizedBox(height: 20),

                    TextField
                      (
                      controller: Last_Name,
                      decoration: InputDecoration
                        (
                        border: OutlineInputBorder
                          (
                          borderRadius: BorderRadius.circular(20),
                        ),

                        prefixIcon: Icon(Icons.person),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[700]),
                        hintText: "Last Name",
                        fillColor: Colors.white,
                      ),
                    ),

                    SizedBox(height: 20),

                    //gender

                    Container(
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: CupertinoColors.white
                      ),
                      child: Row
                        (

                        children: <Widget>[

                          SizedBox(width: 10,),

                          Icon(Icons.perm_identity,color: Colors.grey,),

                          Text("Gender", style: TextStyle(fontSize: 16,color: Colors.grey),),
                          Row(
                            children: [

                              Radio(
                                  value: GenderSelect.Male,
                                  groupValue: _gender,
                                  onChanged: (GenderSelect? value)
                                  {
                                   setState(() {
                                     _gender = value!;
                                     if(_gender==GenderSelect.Male)
                                       {
                                         _finalgender="Male";
                                       }
                                   });
                                  }
                              ),
                              Text("Male"),


                              Radio(
                                    value: GenderSelect.Female,
                                    groupValue: _gender,
                                    onChanged: (GenderSelect? value)
                                    {
                                      setState(() {
                                        _gender = value!;
                                        if(_gender==GenderSelect.Female)
                                        {
                                          _finalgender="Female";
                                        }
                                      });
                                    }
                                ),
                              Text("Female"),
                            ],
                      ),
                      ]

                    ),
                    ),

                    SizedBox(height: 20),


                    TextField
                      (
                      controller: Email,
                      decoration: InputDecoration
                        (
                        border: OutlineInputBorder
                          (
                          borderRadius: BorderRadius.circular(20),
                        ),

                        prefixIcon: Icon(Icons.email),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[700]),
                        hintText: "Email",
                        fillColor: Colors.white,
                      ),
                    ),

                    SizedBox(height: 20),


                    TextField
                      (
                      controller: Phone,
                      decoration: InputDecoration
                        (
                        border: OutlineInputBorder
                          (
                          borderRadius: BorderRadius.circular(20),
                        ),

                        prefixIcon: Icon(Icons.phone),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[700]),
                        hintText: "Phone",
                        fillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                    ),

                    SizedBox(height: 20),


                    TextField
                      (
                      controller: Password,
                      decoration: InputDecoration
                        (
                        border: OutlineInputBorder
                          (
                          borderRadius: BorderRadius.circular(20),
                        ),

                        prefixIcon: Icon(Icons.password),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[700]),
                        hintText: "Password",
                        fillColor: Colors.white,
                      ),
                    ),


                    SizedBox(height: 25),


                    ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(350, 50)),
                        elevation: MaterialStateProperty.all<double>(4.0),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                      onPressed: () async
                      {
                        var url = Uri.parse("https://roasting-conflict.000webhostapp.com/API/Register.php");
                        
                        var response = await http.post(url, body: {
                          "First_Name": First_Name.text.toString(),
                          "Last_Name": Last_Name.text.toString(),
                          "Gender": _finalgender.toString(),
                          "Email": Email.text.toString(),
                          "Phone": Phone.text.toString(),
                          "Password": Password.text.toString(),
                        });

                        // Check the response status code and handle it as needed
                        if (response.statusCode == 200) {
                          // Registration successful
                          print("Inserted");
                        } else {
                          // Registration failed
                          print("Failed to insert data");
                        }


                        blank();
                      },
                      child: Text("Register"),
                    ),


                    SizedBox(height: 15),

                    Text("or Countinue With", style: TextStyle(color: Colors.white),),

                    SizedBox(height: 10),

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

                    Row
                      (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        Text("Already have an account?", style: TextStyle(color: Colors.white),),
                        SizedBox(width: 2),
                        GestureDetector
                          (
                          onTap: ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                          },
                          child: Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ],
                )
            )
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
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

  void blank()
  {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registered Added") ));
    First_Name.text = "";
    Last_Name.text = "";
    GenderSelect.Male;
    Email.text = "";
    Phone.text = "";
    Password.text = "";
  }

  void success2()
  {
    Fluttertoast.showToast
      (
        msg: "Registered  successfully ",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow
    );
  }

}