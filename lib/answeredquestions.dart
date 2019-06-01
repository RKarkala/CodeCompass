import 'package:code_compass/ansgradientbox.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'gradientbox.dart';

class AnsweredQuestions extends StatefulWidget {
  @override
  _AnsweredQuestionsState createState() => _AnsweredQuestionsState();
  String language;
  AnsweredQuestions(this.language);
}

class _AnsweredQuestionsState extends State<AnsweredQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: <Widget>[
          
          Container(
            child: Text(
                "Answered Questions",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              margin: EdgeInsets.only(left: 20.0, top: 20.0),
          ),
          StreamBuilder(
        stream: Firestore.instance.collection(widget.language).snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData) {
            return Text('Questions are loading');
          }
          return Expanded(
            child: ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index){
              var cur = snapshot.data.documents[index];
              if(cur['answer']!=null && cur['answer'].length > 0 && cur['response'] != null && cur['response'].length > 0){
                return AnsGradientBox(snapshot.data.documents[index]['question'], snapshot.data.documents[index].documentID,
                widget.language, cur['answer'],cur['response'],cur['score']);
              }else{
                return SizedBox.shrink();
              }
            },
            
          ));
        },
      ),
        ],
      )
      
    );
  }
}