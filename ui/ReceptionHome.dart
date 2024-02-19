import 'package:bistroboss/Ui/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';
import 'Orderspage.dart';
import 'Storepage.dart';

class ReceptionScreen extends StatefulWidget {
  const ReceptionScreen({super.key});

  @override
  State<ReceptionScreen> createState() => _ReceptionScreenState();
}

class _ReceptionScreenState extends State<ReceptionScreen> {


  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>
  [
    Home(),
    Orders(),
    Store(),
  ];

  void _onItemTapped(int index)
  {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Reception",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30 ,color: AppColors.whiteColor),),
          titleSpacing: 20.0,
          centerTitle: false,
          toolbarHeight: 80.2,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10)),
          ),
          elevation: 0.00,
          backgroundColor: AppColors.primaryColor3,
        ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.store_mall_directory_outlined),
              label: 'Store'
            //title: Text('Download'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.blackColor,
        backgroundColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.secondaryColor2,
        onTap: _onItemTapped,
      ),

    );
  }
}
