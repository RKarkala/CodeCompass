import 'package:code_compass/interview.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';
import 'questions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(

          appBar: new GetAppBar(),
          body: TabBarView(
            children: [

              Interview(),

              new Questions(),
            ],
          ),
        ),
      ),
    );
  }
}

