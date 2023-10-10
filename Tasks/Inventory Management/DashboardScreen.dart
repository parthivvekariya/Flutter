import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AddProduct.dart';
import 'LoginScreen.dart';
import 'ViewProduct.dart';

class Dashboard extends StatefulWidget {
  @override
  dashboardState createState() => dashboardState();
}

class dashboardState extends State<Dashboard> {
  late SharedPreferences logindata;
  late String phonenumber;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    String? username = logindata.getString('username');
    if (username != null) {
      setState(() {
        phonenumber = username;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.teal[300] ,
        title: Text("Inventory Management"),
      ),
      body:GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[

          Container(
            decoration: BoxDecoration(
              color: Colors.teal[300],
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),

            height: 200,
            width: 200,
            child: IconButton(
              iconSize: 50,
              color: Colors.black,
              onPressed: ()
              {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddProduct()),);
              },
              icon: Icon(Icons.add_business_outlined),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.teal[300],
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),

            height: 200,
            width: 200,
            child: IconButton(
              iconSize: 50,
              color: Colors.black,
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ViewProduct()),);
              },
              icon: Icon(Icons.remove_red_eye_outlined),
            ),
          ),


        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          logindata.setBool('login', true);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()),);
        },
        child: Icon(Icons.double_arrow_rounded),
      ),
    );
  }

}
