import 'package:flutter/material.dart';
import 'interview_clicked.dart';

class GradientBox extends StatefulWidget {
  @override
  _GradientBoxState createState() => _GradientBoxState();
  String question;
  String id;
  GradientBox(this.question, this.id);
}

class _GradientBoxState extends State<GradientBox> {
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
                  MaterialPageRoute(builder: (context) => InterviewClicked(widget.question, widget.id)),
                );
              },
              child: Center(
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.question,
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    )),
              )),
        ));
  }
}
