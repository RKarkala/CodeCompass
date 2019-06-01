import 'package:code_compass/progress_button/reveal_progress_button.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class AnsClicked extends StatefulWidget {
  var ans;

  var response;

  var score;

  @override
  State<StatefulWidget> createState() {
    return _AnsClicked();
  }
  String id;
  String question;
  String language;
  AnsClicked(this.question, this.id, this.language,this.ans,this.response,this.score);
}

class _AnsClicked extends State<AnsClicked> {
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
                margin: EdgeInsets.only(top: 35, bottom: 20),
                child: Text(
                  widget.question,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                )), //use backend to fix
          ),SizedBox(
            height: 10,
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
              height: 150,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Center(

                    child: Container(
                      margin: EdgeInsets.all(2),
                      child: Text(
                      "Answer",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                      
                    )),
                  
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Text(
                    widget.ans,
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ))
                ],
              )), ), SizedBox(
            height: 30,
          ),   Opacity(opacity: opa,child:Container(
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
              height: 150,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(2),
                      child: Text(
                      "Result",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Text(
                    widget.response,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ))
                ],
              )), ), SizedBox(height: 10,),



        Container(
          margin: EdgeInsets.all(20.0),
            child: Center(child: Text(widget.score, style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),),
            width: 120,
            height: 50.0,
            decoration: BoxDecoration(gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xff3F70DC), Color(0xff28B0D3)]),borderRadius: BorderRadius.circular(25.0), boxShadow: [
              BoxShadow(
                color: Colors.grey[500],
                offset: Offset(0.0, 1.5),
                blurRadius: 1.5,
              ),
            ]))])
    )),
      );
     }
}
