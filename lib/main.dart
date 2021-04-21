import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[400],
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          centerTitle: true,
          title: Text('I\'m Poor'),
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/icons8-coal-80.png'),
          ),
        ),
      ),
    );
  }
}
