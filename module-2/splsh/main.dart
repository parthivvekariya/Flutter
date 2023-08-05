import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async
{
  await initApp();
  runApp(MyApp());
}

initApp()
{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
}
class  MyApp extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    Timer(
        Duration(seconds: 3),
            () =>
            print('switch')
    );

    return MaterialApp(

      home: Scaffold(

        body:Image.network("https://paternalistic-hiera.000webhostapp.com/Images/apple.jpg"),




      ),


    );
  }

}
