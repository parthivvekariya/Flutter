

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'DashboardScreen.dart';

class AddProduct extends StatefulWidget
{
  @override
  AddProductState createState() => AddProductState();

}

class AddProductState extends State<AddProduct>
{
  TextEditingController Product_Name = TextEditingController();
  TextEditingController Product_about = TextEditingController();
  TextEditingController Product_Prize = TextEditingController();



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

              Text("Add New Product", style: TextStyle(fontSize: 24, color: Colors.white),),

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
                    // Get the values from the controllers
                    String productName = Product_Name.text.toString();
                    String productDescription = Product_about.text.toString();
                    String productPrice = Product_Prize.text.toString();

                    // Create a Map with the data to send in the request body
                    Map<String, String> requestBody = {
                      "name": productName,
                      "about": productDescription,
                      "value": productPrice, // Ensure that productPrice is a valid numeric string
                    };

                    var url = Uri.parse("https://roasting-conflict.000webhostapp.com/API/AddProduct.php");

                    // Send the POST request
                    var response = await http.post(url, body: requestBody);

                    // Check the response
                    if (response.statusCode == 200)
                    {
                      // Request was successful, you can handle the response data here if needed.
                      print("Product Added Successfully");
                      insertdata();
                    }
                    else
                    {
                      // Request failed, handle the error here.
                      print("Failed to add product. Status code: ${response.statusCode}");
                    }
                  },

                  child: Text("Add Product")
              )



            ],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()),);
        },
        child: Icon(Icons.keyboard_double_arrow_left_rounded),
      ),
    );
  }

  void insertdata()
  {

    Fluttertoast.showToast
      (
        msg: "Product Inserted",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.yellow
    );


  }

}