import 'dart:math';

import 'package:code_compass/mentor_clicked.dart';
import 'package:flutter/material.dart';
import 'interview_clicked.dart';

class GradientBoxMen extends StatefulWidget {


  @override
  _GradientBoxStateM createState() => _GradientBoxStateM();
  String question;
  String id;
  String language;
  var ans;
  GradientBoxMen(this.question, this.id, this.language, this.ans);
}

class _GradientBoxStateM extends State<GradientBoxMen> {

  @override
  Widget build(BuildContext context) {

    var list;
    var num  = new Random().nextInt(6);
    print(num.toString() + " woah");
    if(num==0){
      list = [Color(0xffEE82D4), Color(0xff2C87FF)];
    }else if(num==1){
      list = [Color(0xff8298EE), Color(0xff2CDBFF)];
    }else if(num==2){
      list = [Color(0xffEE82D4), Color(0xffFF2C2C)];
    }else if(num==3){
      list = [Color(0xffEE82D4), Color(0xff2C87FF)];
    }else if(num==4){
      list = [Color(0xff8289EE), Color(0xff2CFFBE)];
    }else if(num==5){

      list = [Color(0xff9382EE), Color(0xffFF2C2C)];
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        height: height * .25,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: list),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MentorClicked(widget.question, widget.id, widget.language,widget.ans)),
                );
              },
              child: Center(
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.question,
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
              )),
        ));
  }
}
