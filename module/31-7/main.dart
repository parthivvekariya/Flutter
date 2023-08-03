import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(home: Firstpage());
  }
}

class Firstpage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(appBar: AppBar(title: Text("It courses"),),
        body: Center
          (
            child: Column
              (
              children:
              [
                //android
                Image.network("https://roasting-conflict.000webhostapp.com/images/android.jpeg",width: 150, height: 150),
                SizedBox( width: 100,height: 10,),

                ElevatedButton(
                    child: Text("official website"),
                    onPressed:()
                    {
                      websitelaunch();
                    }
                ),
                ElevatedButton(
                    child: Text("Call"),
                    onPressed:()
                    {
                      callnum();
                    }
                ),
                //ios
                Image.network("https://roasting-conflict.000webhostapp.com/images/ios.jpeg",width: 150, height: 150),
                SizedBox( width: 100,height: 10,),

                ElevatedButton(
                    child: Text("official website"),
                    onPressed:()
                    {
                      websitelaunchio();
                    }
                ),
                ElevatedButton(
                    child: Text("Call"),
                    onPressed:()
                    {
                      callnum();
                    }
                ),
                //FULL STACK DEVLOPRE COURSE
                Image.network("https://roasting-conflict.000webhostapp.com/images/full%20stack%20devlopment.jpeg",width: 150, height: 150),
                SizedBox( width: 100,height: 10,),

                ElevatedButton(
                    child: Text("official website"),
                    onPressed:()
                    {
                      websitelaunchfull();
                    }
                ),
                ElevatedButton(
                    child: Text("Call"),
                    onPressed:()
                    {
                      callnum();
                    }
                ),
              ],
            )
        )
    );
  }


}

void websitelaunch() async
{
  var url = Uri.parse("https://www.android.com/intl/en_in/");
  launchUrl(url);

}


void websitelaunchio() async
{
  var url = Uri.parse("https://www.apple.com/in/store?afid=p238%7Cs8Vs8GkTq-dc_mtid_187079nc38483_pcrid_664737674852_pgrid_112258962467_pntwk_g_pchan__pexid__&cid=aos-IN-kwgo-brand--slid---product-");
  launchUrl(url);
}

void websitelaunchfull() async
{
  var url = Uri.parse("https://www.tops-int.com");
  launchUrl(url);
}

void callnum()
{
  var url = Uri.parse("tel:9687978769");
  launchUrl(url);
}