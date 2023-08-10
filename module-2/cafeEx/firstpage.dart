import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'SecondPage.dart';
import 'menu.dart';



class Firstpage extends StatefulWidget
{
  @override
  FirstState createState() => FirstState();
}

class FirstState extends State<Firstpage> {
  final _formKey = GlobalKey<FormState>();
  String username = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Wrap with Scaffold
      appBar: AppBar
        (
        title: Text("Yasnaya Cafe"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox
              (
              width: 10,
            ),

            Text('Login',style: TextStyle(fontSize: 20.0), ),



            TextFormField(
              //fistname
              decoration: const InputDecoration
                (
                icon: const Icon(Icons.person),
                hintText: "Enter Username",
                labelText: 'Username',
              ),
              validator: (value)
              {
                if (value!.isEmpty)
                {
                  return 'please enter Username';
                }
                else
                {
                  username = value!;
                }
                return null;
              },
            ),

            TextFormField(
              //password
              decoration: const InputDecoration
                (
                icon: const Icon(Icons.password),
                hintText: "Enter Your password",
                labelText: 'password',
              ),
              validator: (value)
              {
                if (value!.isEmpty)
                {
                  return 'please enter firstname';
                }
                return null;
              },
            ),

            ElevatedButton(onPressed: ()
            {
              if(_formKey.currentState!.validate())
              {
                masg();
                //Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage() ));
                Navigator.push(
                  context,
                  MaterialPageRoute(

                    builder: (context) => MenuEx(username),
                  ),
                );
              }

            }, child: Text("login"))

          ],
        ),
      ),
    );
  }

  void masg()
  {
    Fluttertoast.showToast(
        msg: "Welcome $username",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow
    );

  }
}
