import 'package:code_compass/gradientbox_mentor.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'gradientbox.dart';

class NeedResponses extends StatefulWidget {
  @override
  _NeedResponsesState createState() => _NeedResponsesState();
  String language;
  NeedResponses(this.language);
}

class _NeedResponsesState extends State<NeedResponses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Column(
      children: <Widget>[
        Container(
          child: Text(
            "Interview Grading",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
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
                var cur = snapshot.data.documents[index];
                print(cur.documentID);
                print(cur['answer']);
                print(cur['response']);
                if (cur['answer'] != null &&
                    cur['answer'].length > 0 &&
                    (cur['response'] == null || cur['response'].length == 0)) {
                  return GradientBoxMen(
                      snapshot.data.documents[index]['question'],
                      snapshot.data.documents[index].documentID,
                      widget.language,
                      snapshot.data.documents[index]['answer']);
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
