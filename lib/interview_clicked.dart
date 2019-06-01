import 'package:code_compass/progress_button/reveal_progress_button.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class InterviewClicked extends StatefulWidget {
  var ans;

  @override
  State<StatefulWidget> createState() {
    return _InterviewClicked();
  }
  String id;
  String question;
  String language;
  InterviewClicked(this.question, this.id, this.language,this.ans);
}

class _InterviewClicked extends State<InterviewClicked> {
  String description = '';
  var children = [];
  String done = '';
  var opa = 0.0;
var opaaa = 1.0;
  var col = 'Java';
  var doc ='R4qM4MnA9J9bIsYRb6qR';
  var textController = new TextEditingController();



  callback(newDone) {
    setState(() {
      done = newDone;
      opa = 1.0;

      Firestore.instance.collection(widget.language).document(widget.id).updateData({ 'answer': description})
          .then((result) => {
      print(description + "done")
      });

    });
  }

  @override
  Widget build(BuildContext context) {

    if(widget.ans==null ){

    }else{
      if(widget.ans!=''){
        textController.text =  widget.ans;
        setState(() {
          opa = 1.0;
          opaaa = 0;
        });
      }
    }


    return MaterialApp(
        home: Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Container(
                margin: EdgeInsets.only(top: 35),
                child: Text(
                  widget.question,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                )), //use backend to fix
          ),
          Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 5),
              child: TextField(
                controller: textController ,
                decoration: InputDecoration(
                  labelText: 'Answer',
                ),
                maxLines: 4,
                onChanged: (String value) {
                  description = value;
                },

              )),

      Container(
            margin: EdgeInsets.all(20),
            child: Opacity(opacity: opaaa,child: RevealProgressButton(done, callback),),
          ),
          Opacity(opacity: opa,child:Container(
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    new BoxShadow(
                      color: Color(0xffE2E2E2),
                      blurRadius: 6,
                      spreadRadius: 1,
                    )
                  ]),
              width: MediaQuery.of(context).size.width * .90,
              height: 250,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Result",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Your results will come soon...",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  )
                ],
              )) ),
        ]),
      ),
    ));
  }
}
