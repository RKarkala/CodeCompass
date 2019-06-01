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
      
      body: StreamBuilder(
        stream: Firestore.instance.collection(widget.language).snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData) {
            return Text('Questions are loading');
          }
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index){
              var cur = snapshot.data.documents[index];
              if(cur['answer']!=null && cur['answer'].length > 0 && (cur['response'] == null || cur['response'].length==0)){
                return GradientBox(snapshot.data.documents[index]['question'], snapshot.data.documents[index].documentID,
                widget.language);        
              }
            },
            
          );

        },
      ),
    );
  }
}