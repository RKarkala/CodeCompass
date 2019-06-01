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
      body: StreamBuilder(
        stream: Firestore.instance.collection(widget.language).snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData) {
            return Text('Questions are loading');
          }
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index){
              print('data');
              print(snapshot.data.documents[index]['question']);
              return GradientBox(snapshot.data.documents[index]['question']);
            },
          );

        },
      ),
    );
  }
}