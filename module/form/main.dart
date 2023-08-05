import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'first.dart';

void main()
{
  runApp(MyApp());

}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)

  {
    return MaterialApp
      (
      home: Scaffold(
        appBar: AppBar(
          title: Text("singup"),
        ),
        body: Firstpage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
