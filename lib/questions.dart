import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'gradientbox.dart';

class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
  String language;
  Questions(this.language);
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Column(
      children: <Widget>[
        Container(
          child: Text(
            "Interview Questions",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'GoogleSans'),
          ),
          margin: EdgeInsets.only(left: 20.0, top: 20.0),
        ),
        StreamBuilder(
          stream: Firestore.instance.collection(widget.language).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text('Questions are loading');
            }
            return Expanded(
                child: ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                print('id is ' + snapshot.data.documents[index].documentID);
                print('language is ' + widget.language);
                var cur = snapshot.data.documents[index];
                if((cur['answer'] == null || cur['answer'].length == 0) &&
                  (cur['response'] == null || cur['response'].length == 0)){
                return GradientBox(
                    cur['question'],
                    cur.documentID,
                    widget.language,
                    cur['answer']);
                }else{
                  return SizedBox.shrink();
                }
              },
            ));
          },
        ),
      ],
    ));
  }
}
