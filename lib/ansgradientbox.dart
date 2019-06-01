import 'package:code_compass/answered_clicked.dart';
import 'package:flutter/material.dart';

class AnsGradientBox extends StatefulWidget {
  var response;

  var score;



  @override
  _AnsGradientBoxState createState() => _AnsGradientBoxState();
  String question;
  String id;
  String language;
  var ans;
  AnsGradientBox(this.question, this.id, this.language, this.ans,this.response,this.score);
}

class _AnsGradientBoxState extends State<AnsGradientBox> {
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
                  MaterialPageRoute(builder: (context) => AnsClicked(widget.question, widget.id, widget.language,widget.ans,widget.response,widget.score)),
                );
              },
              child: Center(
                    child: Text(
                      widget.question,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
              )),
        ));
  }
}
