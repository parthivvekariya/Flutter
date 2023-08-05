
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Firstpage extends StatefulWidget
{
  @override
  FirstState createState() => FirstState();

}

class FirstState extends State<Firstpage>
{

  final _formKey = GlobalKey<FormState>();


    @override
    Widget build(BuildContext context)
    {
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[

            TextFormField(
              //fistname
              decoration: const InputDecoration
                (
                icon: const Icon(Icons.person),
                hintText: "Enter Your Firstname",
                labelText: 'Firstname',
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

            TextFormField(
              //lastname
              decoration: const InputDecoration
                (
                icon: const Icon(Icons.person),
                hintText: "Enter Your Lastname",
                labelText: 'Lastname',
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

            TextFormField(
              //email
              decoration: const InputDecoration
                (
                icon: const Icon(Icons.email),
                hintText: "Enter Your Email",
                labelText: 'Email',
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

            TextFormField(
              //password
              decoration: const InputDecoration
                (
                icon: const Icon(Icons.person),
                hintText: "Enter Your Lastname",
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

            TextFormField(
              //ConformPassword
              decoration: const InputDecoration
                (
                icon: const Icon(Icons.password),
                hintText: "Enter Your ConformPassword",
                labelText: 'Password',
              ),
              obscureText: true,
              validator: (value)
              {
                if (value!.isEmpty)
                {
                  return 'Please enter Password';
                }
                return null;
              },
            ),
            
            ElevatedButton(onPressed: ()
            {
              if(_formKey.currentState!.validate())
              {
                print("Data Processing");
              }
            }, child: Text("login"))
          ]
        ),
      );
    }
  }