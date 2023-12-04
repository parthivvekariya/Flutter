import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class DynamicListView extends StatefulWidget
{
  List<Model>Mylist;
  DynamicListView({required this.Mylist});

  @override
  DynamicState createState() => DynamicState(Mylist: Mylist);


}

class DynamicState extends State<DynamicListView>
{

  List<Model>Mylist ;
  DynamicState({required this.Mylist});

  @override
  Widget build(BuildContext context)
  {

    Mylist.add(Model("https://roasting-conflict.000webhostapp.com/images/images.jpeg", "php","codin language"));
    Mylist.add(Model("https://roasting-conflict.000webhostapp.com/images/jerry.webp", "HTML","codin language"));
    Mylist.add(Model("https://nikhil2293.000webhostapp.com/Images/java.png", "java","codin language"));
    Mylist.add(Model("https://roasting-conflict.000webhostapp.com/images/tom-jerry.jpg", "dart","codin language"));
    Mylist.add(Model("https://roasting-conflict.000webhostapp.com/images/tom.jpeg", "c","codin language"));

    return Scaffold(

        appBar: AppBar(title: Text("Custom List"),),
        body: ListView.builder
          (


            itemCount: Mylist == null ? 0 : Mylist.length,
            itemBuilder: (ctx, i) {
              return ListTile
                (
                leading: Image.network(Mylist[i].icon,width: 100,height: 250),
                title: Text(Mylist[i].name),
                subtitle: Text(Mylist[i].about),
              );
            }
        )


    );
  }
}