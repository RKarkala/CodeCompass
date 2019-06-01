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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        height: height * .15,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffEE82D4), Color(0xff2C87FF)]),
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
                      style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
              )),
        ));
  }
}
