import 'package:code_compass/progress_button/reveal_progress_button.dart';
import 'package:flutter/material.dart';

class InterviewClicked extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InterviewClicked();
  }
}

class _InterviewClicked extends State<InterviewClicked> {
  String description = '';
  var children = [];
  String done = '';
  var opa = 0.0;

  callback(newDone) {
    setState(() {
      done = newDone;
      opa = 1.0;
      print(description);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Container(
                margin: EdgeInsets.only(top: 35),
                child: Text(
                  "Interview question...",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                )), //use backend to fix
          ),
          Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 5),
              child: TextField(
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
            child: RevealProgressButton(done, callback),
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
                    "You got {amount correct} right, here is the feedback from your mentor. \nmentor stuff",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  )
                ],
              )) ),
        ]),
      ),
    ));
  }
}
