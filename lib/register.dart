import 'package:Login/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:intl/intl.dart';

import 'login.dart';
//import 'login.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  //TextEditingController _date_of_birth = TextEditingController();
  TextEditingController dateinput = TextEditingController();

  Future register() async {
    //var url = "http://10.60.146.90/php_flutter/reg.php";
    var response = await http
        .post(Uri.parse("http://192.168.42.234//php_flutter/reg.php"), body: {
      "username": user.text,
      "password": pass.text,
      "mobile": mobile.text
    });
    var data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
          msg: "User exist",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Registered",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  bool passwordVisible = false;
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 280,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-1.png'))),
                            )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 120,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-2.png'))),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 110,
                        child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/clock.png'))),
                            )),
                      ),
                      Positioned(
                        child: FadeAnimation(
                            1.6,
                            Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Center(
                                child: Text(
                                  "Registration",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.grey))),
                                  child: TextField(
                                    controller: _name,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Name",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.grey))),
                                  child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Email",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                      controller: user),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.grey))),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Mobile number",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                    controller: mobile,
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                        obscureText: passwordVisible,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Password",
                                            suffixIcon: IconButton(
                                              icon: Icon(passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off),
                                              onPressed: () {
                                                setState(() {
                                                  passwordVisible =
                                                      !passwordVisible;
                                                });
                                              },
                                            ),
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400])),
                                        controller: pass)),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          2,
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ])),
                            child: Center(
                                child: TextButton(
                              onPressed: () {
                                register();
                              },
                              child: Text(
                                "Create Account",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                          )),
                      SizedBox(
                        height: 70,
                      ),
                      FadeAnimation(
                          1.5,
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomePage1(
                                      /* name: _name.text,
                                      user: user.text,
                                      date_of_birth: _date_of_birth.text*/
                                      )));
                            },
                            child: (Text('Sign in')),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
