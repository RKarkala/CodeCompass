import 'package:code_compass/progress_button/reveal_progress_button.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class MentorClicked extends StatefulWidget {
  var ans;

  @override
  State<StatefulWidget> createState() {
    return _MentorClicked();
  }
  String id;
  String question;
  String language;
  MentorClicked(this.question, this.id, this.language,this.ans);
}

class _MentorClicked extends State<MentorClicked> {
  String description = '';
  var children = [];
  String done = '';
  var opa = 1.0;
var opaaa = 1.0;
  var col = 'Java';
  var doc ='R4qM4MnA9J9bIsYRb6qR';
  var textController = new TextEditingController();
  var dropDownVal = "10/10";


  callback(newDone) {
    setState(() {
      done = newDone;
      opa = 1.0;

      Firestore.instance.collection(widget.language).document(widget.id).updateData({ 'response': description,'score': dropDownVal})
          .then((result) => {
      print(description + "done")
      });

    });
  }

  @override
  Widget build(BuildContext context) {
/*
    if(widget.ans!=''){
      textController.text =  widget.ans;
      setState(() {
        opa = 1.0;
        opaaa = 0;
      });
    }
*/
    return MaterialApp(
        home: Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Container(
                margin: EdgeInsets.only(top: 35),
                child: Text(
                  widget.question,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                )), //use backend to fix
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
                    widget.ans,
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  )
                ],
              )), ),  Container(
    margin: EdgeInsets.only(left: 15, right: 15, top: 5),
    child: TextField(
    controller: textController ,
    decoration: InputDecoration(
    labelText: 'Give Feedback',
    ),
    maxLines: 4,
    onChanged: (String value) {
    description = value;
    },



    )),
    DropdownButton<String>(
    value: dropDownVal,
    onChanged: (String newValue) {
    setState(() {
    dropDownVal = newValue;
    });
    },
    items: <String>["0/10","1/10","2/10","3/10","4/10","5/10","6/10","7/10","8/10","9/10","10/10"]
        .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
    );
    })
        .toList(),
    )
          ,

          Container(
            margin: EdgeInsets.all(20),
            child: Opacity(opacity: opaaa,child: RevealProgressButton(done, callback),),
          )])
    )),
      );
     }
}
