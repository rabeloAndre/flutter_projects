import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:
            // buildScaffoldFirstQuestion()); // First Question
            // buildScaffoldSecondQuestion()); // Second Question
            // buildScaffoldThirdQuestion()); // Third Question
            buildScaffoldFourthQuestion());
  }
}

// Fourth Question
Container buildScaffoldFourthQuestion() {
  return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.purple, Colors.blue],
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                  child: Image(
                      width: 150,
                      height: 140,
                      image: AssetImage('images/mobile.png'),
                      fit: BoxFit.cover)),
              Text(
                'André Rabelo',
                style: TextStyle(
                    fontFamily: 'Lobster',
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '📱 Mobile Developer',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 100.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildContainerFirst(
                        Icons.phone, Colors.purple[400], Colors.purple[50]),
                    buildContainerFirst(
                        Icons.chat, Colors.purple[400], Colors.purple[50]),
                    buildContainerFirst(Icons.location_on, Colors.purple[400],
                        Colors.purple[50]),
                    buildContainerFirst(
                        Icons.email, Colors.purple[400], Colors.purple[50]),
                  ]),
              SizedBox(height: 3.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildText('Phone'),
                    buildText('Message'),
                    buildText('Location'),
                    buildText('Email'),
                  ]),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildContainerFirst(
                      Icons.duo, Colors.purple[400], Colors.purple[50]),
                  buildContainerFirst(
                      Icons.language, Colors.purple[400], Colors.purple[50]),
                  buildContainerFirst(
                      Icons.person, Colors.purple[400], Colors.purple[50]),
                ],
              ),
              SizedBox(height: 3.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildText('Google Duo'),
                    buildText('WWWeb Site'),
                    buildText('About Me'),
                  ]),
              SizedBox(height: 50.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.touch_app,
                      color: Colors.white70,
                    ),
                    buildText('Touch on Icons'),
                  ])
            ],
          ))));
}

Text buildText(String text) {
  return Text(text, style: TextStyle(fontSize: 14.0, color: Colors.white70));
}

// Third Question
Scaffold buildScaffoldThirdQuestion() {
  return Scaffold(
    backgroundColor: Colors.teal[700],
    body: SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildContainerThird(Icons.thumb_down, Colors.red[500]),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildContainerThird(Icons.comment, Colors.yellow[500]),
              buildContainerThird(Icons.share, Colors.green[400]),
            ],
          ),
          buildContainerThird(Icons.thumb_up, Colors.lightBlue[500]),
        ],
      ),
    ),
  );
}

Container buildContainerThird(IconData icon, Color color) {
  return Container(
      width: 100,
      height: 100,
      child: FittedBox(
        child: Icon(
          icon,
        ),
        fit: BoxFit.contain,
      ),
      decoration: BoxDecoration(
        color: color,
      ));
}

// Second Question
Scaffold buildScaffoldSecondQuestion() {
  return Scaffold(
      backgroundColor: Colors.lightBlue[600],
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
              radius: 50, backgroundImage: AssetImage('images/eu.jpg')),
          Text(
            'André Rabelo',
            style: TextStyle(
                fontFamily: 'Lobster',
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
          Text('Junior Developed',
              style: TextStyle(
                  color: Colors.lightBlue[100],
                  fontSize: 20,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20.0,
            width: 160.0,
            child: Divider(
              color: Colors.white70,
            ),
          ),
          buildCardSecond('+55 86 9 8888-8888', Icons.phone, 18.0),
          buildCardSecond('andrerabelo1001@gmail.com', Icons.email, 16.5)
        ],
      )));
}

Card buildCardSecond(String text, IconData icon, double size) {
  return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: ListTile(
          leading: Icon(icon, color: Colors.purple[300]),
          title: Text(text,
              style: TextStyle(
                color: Colors.purple[300],
                fontSize: size,
              ))));
}

// First Question
Scaffold buildScaffoldFirstQuestion() {
  return Scaffold(
    backgroundColor: Colors.lightBlue[700],
    body: SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          buildContainerFirst(
              Icons.network_wifi, Colors.lightBlue[500], Colors.teal[100]),
          buildContainerFirst(
              Icons.bluetooth, Colors.blueGrey[400], Colors.teal[100]),
          buildContainerFirst(
              Icons.location_on, Colors.lightBlue[500], Colors.teal[100]),
          buildContainerFirst(
              Icons.highlight, Colors.blueGrey[400], Colors.teal[100]),
          buildContainerFirst(Icons.airplanemode_active, Colors.blueGrey[400],
              Colors.teal[100]),
        ],
      ),
    ),
  );
}

Container buildContainerFirst(
    IconData icon, Color color, Color backgroundColor) {
  return Container(
    margin: const EdgeInsets.only(top: 10.0),
    width: 55,
    height: 55,
    child: FittedBox(
      child: Icon(
        icon,
        color: color,
      ),
      fit: BoxFit.scaleDown,
    ),
    decoration: BoxDecoration(
      color: backgroundColor,
      shape: BoxShape.circle,
    ),
  );
}
