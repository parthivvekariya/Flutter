

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'DashboardScreen.dart';
import 'ViewProduct.dart';

class EditProduct extends StatefulWidget {
  final List list;
  final int index;

  EditProduct({required this.list, required this.index});

  @override
  EditProductState createState() => EditProductState();
}


class EditProductState extends State<EditProduct>
{

  late TextEditingController Product_Name;
  late TextEditingController Product_about;
  late TextEditingController Product_Prize;

  @override
  void initState()
  {
    // TODO: implement initState
    Product_Name = TextEditingController(text: widget.list[widget.index]['name']);
    Product_about = TextEditingController(text: widget.list[widget.index]['about']);
    Product_Prize = TextEditingController(text: widget.list[widget.index]['value']);


    super.initState();
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Container(
            margin: EdgeInsets.only(left: 25),
            width: 350,
            child: Column(
              children: [
                SizedBox(height: 200,),

                Text("Edit Product", style: TextStyle(fontSize: 24, color: Colors.white),),

                SizedBox(height: 25),

                TextField
                  (
                  controller: Product_Name,
                  decoration: InputDecoration
                    (
                    border: OutlineInputBorder
                      (
                      borderRadius: BorderRadius.circular(20),
                    ),

                    prefixIcon: Icon(Icons.shopping_bag_outlined),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[700]),
                    hintText: "Product Name",
                    fillColor: Colors.white,
                  ),
                ),

                SizedBox(height: 20),

                TextField
                  (
                  controller: Product_about,
                  decoration: InputDecoration
                    (
                    border: OutlineInputBorder
                      (
                      borderRadius: BorderRadius.circular(20),
                    ),

                    prefixIcon: Icon(Icons.edit),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[700]),
                    hintText: "Product Description",
                    fillColor: Colors.white,
                  ),
                ),

                SizedBox(height: 20),

                TextField
                  (
                  controller: Product_Prize,
                  decoration: InputDecoration
                    (
                    border: OutlineInputBorder
                      (
                      borderRadius: BorderRadius.circular(20),
                    ),

                    prefixIcon: Icon(Icons.currency_rupee),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[700]),
                    hintText: "Product prize",
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
                    onPressed: () async {
                      String productName = Product_Name.text.toString();
                      String productDescription = Product_about.text.toString();
                      String productPrice = Product_Prize.text.toString();

                      Map<String, String> requestBody = {
                        "id": widget.list[widget.index]['id'], // Pass the ID of the product to edit
                        "name": productName,
                        "about": productDescription,
                        "value": productPrice,
                      };

                      var url = Uri.parse("https://roasting-conflict.000webhostapp.com/API/EditProduct.php");

                      var response = await http.post(url, body: requestBody);

                      if (response.statusCode == 200)
                      {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product Edited Successfully"),));
                      }
                      else
                      {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Failed to edit product. Status code: ${response.statusCode}"),
                        ));
                      }
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ViewProduct()),);
                    },


                    child: Text("Edit Product")
                )



              ],
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ViewProduct()),);
        },
        child: Icon(Icons.keyboard_double_arrow_left_rounded),
      ),
    );
  }

  void insertdata()
  {

    Fluttertoast.showToast
      (
        msg: "Product Edited",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow
    );


  }

}