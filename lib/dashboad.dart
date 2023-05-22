//import 'package:Login/Animation/FadeAnimation.dart';
import 'package:Login/chat.dart';
//import 'package:Login/register.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart';

import 'login.dart';
//import 'package:http/http.dart' as http;
//import 'chat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false, home: new HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.indigo[300],
        title: new Text("Home"),
      ),
      body: Container(
        color: Colors.blue.shade50,
        child: Column(
          children: [
            Container(
              height: 280,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Bl.png'),
                      fit: BoxFit.fill)),
              child: Stack(
                children: <Widget>[],
              ),
            ),
            Container(
              child: Text(
                'Welcome to our HELPER BOT. ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[600],
                  fontSize: 20,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: 180, left: 10, right: 10, bottom: 10)),
                /* Container(
                    width: 100,
                    child:
                        Text('', maxLines: 5, overflow: TextOverflow.ellipsis)),*/
                Expanded(
                    child: Text(
                  'This is an advanced conversational system that uses voice recognition and NLP technologies to interact with users via spoken/text commands and responses. It serves as a virtual assistant specifically designed to handle insurance-related tasks and inquiries through voice/text interactions.',
                  maxLines: 9,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                )),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Center(
                child: ElevatedButton.icon(
                  label: Text(
                    'Sign Out',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage1()));
                  },
                  icon: Icon(
                    Icons.logout,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.indigo[300],
        child: new Icon(
          Icons.chat,
        ),
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new Home()),
          );
        },
      ),
    );
  }
}
