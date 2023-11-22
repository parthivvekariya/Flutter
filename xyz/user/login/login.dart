import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project1/screens/user/home/Home.dart';
import 'package:project1/screens/user/login/widgets/custom_clippers/brown_top_clipper.dart';
import 'package:project1/screens/user/login/widgets/custom_clippers/gold_top_clipper.dart';
import 'package:project1/screens/user/login/widgets/custom_clippers/lightgold_top_clipper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants.dart';
import 'package:http/http.dart' as http;
import '../boarding/widgets/header.dart';

import '../front/front.dart';
import '../register/register.dart';


class Login extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return LoginPage();
  }
}

class LoginPage extends State<Login>
{
  //LoginPage();
  //SharedPreferences logindata;
  final _formKey = GlobalKey<FormState>();

  //final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  //final _formKey = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobileno = TextEditingController();

  late SharedPreferences logindata;

  late bool newuser;
  var isLoading = false;

  bool _isObscurePassword = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }
  void check_if_already_login() async
  {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Front()));
    }
  }





  @override
  Widget build(BuildContext context)
  {

    final height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final space = height > 650 ? kSpaceM : kSpaceS;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: kLightGold,
        body: Form(
            key: _formKey,
          child:Stack(
            children: [
              ClipPath(
                clipper: const GoldTopClipper(),
                child: Container(color: kGold),
              ),
              ClipPath(
                clipper: const BrownTopClipper(),
                child: Container(color: kBrown),
              ),
              ClipPath(
                clipper: const LightGoldTopClipper(),
                child: Container(color: kLightGold),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: kPaddingL),
                  child: Column(
                    children: [
                      Header(onSkip: () {  },),
                      //Spacer(),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: kPaddingL),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: space * 7),

                            Text('Login here using your username and password.',
                              style: Theme.of(context).textTheme.subtitle2!.copyWith(color: kDarkBrown.withOpacity(0.7)),
                            ),

                            SizedBox(height: space-5),

                            TextField(
                              controller: username,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(kPaddingS),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
                                ),
                                hintText: 'Username',
                                hintStyle: TextStyle(
                                  color: kBlack.withOpacity(0.5),
                                  fontWeight: FontWeight.w500,
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: kBlack.withOpacity(0.5),
                                ),
                              ),
                            ),

                            SizedBox(height: space-7),

                            TextField(
                              controller: password,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(kPaddingS),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
                                ),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  color: kBlack.withOpacity(0.5),
                                  fontWeight: FontWeight.w500,
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: kBlack.withOpacity(0.5),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(_isObscurePassword ? Icons.visibility_off : Icons.visibility),
                                  onPressed: (){
                                    setState(() {
                                      _isObscurePassword = !_isObscurePassword;
                                    });
                                  },
                                ),

                              ),

                              // obscureText: _isObscurePassword,
                            ),

                            SizedBox(height: space-7),

                            TextField(
                              controller: mobileno,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(kPaddingS),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
                                ),
                                hintText: 'Mobile Number',
                                hintStyle: TextStyle(
                                  color: kBlack.withOpacity(0.5),
                                  fontWeight: FontWeight.w500,
                                ),
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: kBlack.withOpacity(0.5),
                                ),
                              ),
                            ),

                            SizedBox(height: space-7),

                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: double.infinity,
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: kDarkBrown,
                                  padding: const EdgeInsets.all(kPaddingS+5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                onPressed: ()
                                {
                                  //print('clicked');
                                  login();

                                },
                                child: Text("Login to continue",
                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(color: kGold, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),

                            SizedBox(height: space),

                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: double.infinity,
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: kGold,
                                  padding: const EdgeInsets.all(kPaddingS+5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                onPressed: (){
                                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                                },
                                child: Text("Forgot a E-wishes Password?",
                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(color: kDarkBrown,fontSize:15 , fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),

                            //SizedBox(height: 2 * space),

                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: double.infinity,
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: kBrown,
                                  padding: const EdgeInsets.all(kPaddingS+5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                onPressed: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Register()));
                                },
                                child: Text("Create an E-wishes Account",
                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(color: kLightGold, fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            // SizedBox(height: space),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
  /*void initial()async
  {

    logindata = await SharedPreferences.getInstance();
    logindata.setBool('login', false);



  }*/

  Future login()async
  {
    var url = "https://roasting-conflict.000webhostapp.com/API/task/register_view.php";
    var response  = await http.post(Uri.parse(url), body:
    {
      "username": username.text.toString(),
      "password": password.text.toString(),
      "mobile_no": mobileno.text.toString(),
    });


    var data = json.decode(response.body);

    if(data==0)
    {
      print("fail2");
    }
    else
    {
      print("success");

      //print("success2");
     // logindata.setBool('login', false);
     //logindata.setString('username', username.text.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Front(),),);
    }

    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    else
    {
      _formKey.currentState?.save();
      String phonenumber = username.text; // Use mobile.text to get the text value
      String userPassword = password.text; // Use userPassword to get the text value

      if (phonenumber != '' && userPassword != '') {
        print('success');
        logindata.setBool('login', false);
        logindata.setString('phonenumber', phonenumber);
        //Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
      }
    }

  }
/*  void check_if_already_login() async
  {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);

    if (newuser == false)
    {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => Front()));
    }
  }*/

}