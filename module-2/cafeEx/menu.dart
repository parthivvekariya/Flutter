import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'SecondPage.dart';

class MenuEx extends StatefulWidget
{
  MenuEx($username);

  @override
  MenuState  createState() => MenuState(username: '');
}

class MenuState extends State<MenuEx>
{

  bool one=false;
  bool two=false;
  bool three=false;
  var total=0;
  var amount=0;
  var data="";

  String username= "";
  MenuState({required this.username});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(title: Text("Yasnaya Cafe"),),
      body: Center(

        child: Column(

          children:
          [
            SizedBox
              (
              width: 10,
            ),

            Text('Menu',style: TextStyle(fontSize: 20.0), ),

            CheckboxListTile(
              title: Text('Pizza'),
              subtitle: Text('Rs. 100'),
              value: one,
              onChanged: (bool? value) {
                setState(() {
                  one = value!;
                  if (value) {
                    amount += 100;
                    data += "\n Pizza @ rs.100";
                  } else {
                    amount -= 100;
                    data = data.replaceAll("\n Pizza @ rs.100", "");
                  }
                });
              },
            ),
            CheckboxListTile(
              title: Text('Burger'),
              subtitle: Text('Rs. 70'),
              value: two,
              onChanged: (bool? value) {
                setState(() {
                  two = value!;
                  if (value) {
                    amount += 70;
                    data += "\n Burger @ rs.70";
                  } else {
                    amount -= 70;
                    data = data.replaceAll("\n Burger @ rs.70", "");
                  }
                });
              },
            ),
            CheckboxListTile(
              title: Text('Coffee'),
              subtitle: Text('Rs. 120'),
              value: three,
              onChanged: (bool? value) {
                setState(() {
                  three = value!;
                  if (value) {
                    amount += 120;
                    data += "\n Coffee @ rs.120";
                  } else {
                    amount -= 120;
                    data = data.replaceAll("\n Coffee @ rs.120", "");
                  }
                });
              },
            ),


            ElevatedButton(onPressed: (){

              // print("\n Bill \n $data \n Total: $amount");
              toastmsg();
              Navigator.push(context,MaterialPageRoute(builder: (context) => SecondPage(total: total,amount: amount,data: data)));

            }, child: Text("Order")),

          ],
        ),
      ),

    );
  }

  void toastmsg()
  {
    Fluttertoast.showToast
      (
        msg: "your Bill is Hear",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow
    );
  }

}
