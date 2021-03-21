// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to My Application',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Welcome to My Application'),
            actions: [
              Icon(Icons.favorite),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.search),
              ),
            ],
            backgroundColor: Colors.purple,
          ),
          body: Column(children: [
            androidImage,
            helloWorld,
            titleSection,
          ])),
    );
  }

  Widget androidImage = Container(
      child: (Image.asset(
    'images/android.png',
    width: 300,
    height: 297,
    fit: BoxFit.cover,
  )));

  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Teresina, Piauí',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Brazil',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        /*3*/
        Icon(
          Icons.favorite,
          color: Colors.purple[500],
        ),
        Text('This is my city'),
      ],
    ),
  );

  Widget helloWorld = Center(
    child: Container(
      height: 50.0,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.lightGreen[500],
      ),
      child: Center(
        child: Text(
          'Hello World',
          style: TextStyle(
            fontSize: 32,
            color: Colors.black87,
          ),
        ),
      ),
    ),
  );
}
