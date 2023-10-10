



import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'DashboardScreen.dart';
import 'EditProduct.dart';


class ViewProduct extends StatefulWidget
{
  @override
  ViewProductState createState() => ViewProductState();

}

class ViewProductState extends State<ViewProduct>
{

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Products"),),
      body: FutureBuilder<List>(
          future: getdetail(),
          builder:(ctx,ss){

            if(ss.hasData)
            {

              return Items(list:ss.data!);

            }
            if(ss.hasError)
            {
              print('Network Not Found');
            }

            return CircularProgressIndicator();



          }),
      floatingActionButton: FloatingActionButton
        (
        child: Icon(Icons.keyboard_double_arrow_left_rounded),
        onPressed: ()
        {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
        },
      ),
    );
  }
  Future<List>getdetail()async
  {
    var response = await http.get(Uri.parse("https://roasting-conflict.000webhostapp.com/API/ViewProduct.php"));
    return jsonDecode(response.body);
  }
}



class Items extends StatelessWidget
{
  TextEditingController Product_Name = TextEditingController();
  TextEditingController Product_about = TextEditingController();
  TextEditingController Product_Prize = TextEditingController();


  List list;
  Items({required this.list});



  @override
  Widget build(BuildContext context)
  {
    return ListView.builder(

        itemCount: list==null?0:list.length,
        itemBuilder: (ctx,i)
        {
          return Card( //                           <-- Card
            color: Colors.teal[300],

            child: ListTile(

              leading: Icon(Icons.shopping_bag_outlined),

              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:
                [
                  Row(children: [
                    Text("Product Name :-",style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(list[i]['name']),
                  ],),
                  Row(children: [
                    Text("Product Prize :-",style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(list[i]['value']),
                  ],),
                  Row(children: [
                    Text("About Product :-",style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(list[i]['about']),
                  ],),
                  Row(children: [
                    SizedBox(width: 20,),
                    IconButton(
                      color: Colors.black,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => EditProduct(
                              list: list, // Pass the 'list' from the Items class
                              index: i,    // Pass the 'index' from the Items class
                            ),
                          ),
                        );
                      },
                      icon: Icon(Icons.edit),
                    ),
                    SizedBox(width: 130,),
                    // Inside the Items widget build method, update the IconButton onPressed callback:
                    IconButton(
                      color: Colors.red,
                      onPressed: () {
                        // Call the confirm function with the required arguments
                        confirm(context, list, i);
                      },
                      icon: Icon(Icons.delete),
                    )
                  ],),
                ],
              ),
            ),
          );
        }


    );
  }

  void confirm(BuildContext context, List list, int i) {
    var url = Uri.parse("https://roasting-conflict.000webhostapp.com/API/DeleteProduct.php");
    http.post(url, body: {
      'id': list[i]['id'], // Corrected key
    });

    // Assuming you want to navigate back to the ViewProduct screen.
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ViewProduct()));
  }




  }


