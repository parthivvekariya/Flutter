

import 'package:flutter/material.dart';
import 'package:project1/screens/user/home/Home.dart';
import 'package:project1/screens/user/register/register.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../constants.dart';
import '../login/login.dart';

class Front extends StatefulWidget
{
  @override
  FrontPage createState() => FrontPage();
}

class FrontPage extends State<Front>
{

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>
  [
    Home(),
    //Download(),
  ];


  void _onItemTapped(int index)
  {
    setState(() {
      _selectedIndex = index;
    });
  }

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
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Welcome to E wishes ', style: TextStyle(color: kGold),),
        backgroundColor: kDarkBrown,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: kGold,
            ),
            onPressed: () {
              logindata.setBool('login', true);
               //logindata.setBool('login', true);
              //logindata.setBool('login', false);
              //logindata.setString('username','');
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      backgroundColor: kLightGold,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
              label: 'Download'
            //title: Text('Download'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kGold,
        backgroundColor: kDarkBrown,
        unselectedItemColor: kTerracotta,
        onTap: _onItemTapped,
      ),
    );
  }
  /*void initial()async
  {

    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });


  }*/
}