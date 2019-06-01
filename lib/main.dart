import 'package:flutter/material.dart';
import 'widgets.dart';
import 'questions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() => runApp(MyApp());



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String language = '';
  callback(newLang){
    setState(() {
      language = newLang;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: new GetAppBar(language, callback),
          body: TabBarView(
            children: [
              new Questions(language),
              Icon(Icons.directions_transit)
            ],
          ),
        ),
      ),
    );
  }
}
