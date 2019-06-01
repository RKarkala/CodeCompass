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
                print('id is ' + snapshot.data.documents[index].documentID);
                if(snapshot.data.documents[index]['answer'] == null || snapshot.data.documents[index]['answer'].length == 0){
                return GradientBox(
                    snapshot.data.documents[index]['question'],
                    snapshot.data.documents[index].documentID,
                    widget.language,
                    snapshot.data.documents[index]['answer']);
                }else{
                  return null;
                }
              },
            ));
          },
        ),
      ],
    ));
  }
}
