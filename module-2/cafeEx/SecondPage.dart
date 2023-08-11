import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget
{
  var total,amount,data;
  //cons. get
  SecondPage({required this.total, required this.amount, required this.data});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(title: Text("Bill"),),
      body: Center(
          child: Column(
              children: [

                SizedBox(width: 300, height: 300,),

                Text('Your order is: $data',style: TextStyle(fontSize: 20.0,backgroundColor: Colors.pink),),
                SizedBox(width: 10, height: 10,),
                Text(' \n Total Amount is : $amount',style: TextStyle(fontSize: 20.0,backgroundColor: Colors.pink),),


                ElevatedButton(
                    onPressed:()
                    {
                      Navigator.pop(context);
                    },
                    child: Text("Go Back", style: TextStyle(fontSize: 10.0,backgroundColor: Colors.blue),)
                )
              ]

      ),

    )
    );
  }

}
