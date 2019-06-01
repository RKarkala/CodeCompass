import 'package:code_compass/interview_clicked.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Interview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Interview();
  }
}

class _Interview extends State<Interview> {
  List<String> _products = ['Laptop'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                  onPressed: () {
                    
                  },
                  child: Text('Interview Question'))),
        ]),
      ),
    );
  }
}