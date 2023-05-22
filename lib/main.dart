import 'package:Login/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF701ebd),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'LOGIN',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Divider(
                color: Colors.white,
                thickness: 1.0,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    const TextField(
                      cursorColor: Colors.purple,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple))),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    const Text(
                      'Password',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    const Padding(padding: EdgeInsets.all(0.0)),
                    const TextField(
                      cursorColor: Colors.purple,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple))),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    Center(
                      child: TextButton(
                          onPressed: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: List.empty()),
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
