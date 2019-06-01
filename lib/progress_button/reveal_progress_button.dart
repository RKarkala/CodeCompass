import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_compass/progress_button/progress_button.dart';
import 'package:code_compass/progress_button/reveal_progress_button_painter.dart';
import 'package:flutter/material.dart';


class RevealProgressButton extends StatefulWidget {
  var callback;

  var newDone;

  var col;

  var doc;

  var description;

  RevealProgressButton(this.newDone, this.callback,this.col,this.doc,this.description);
  @override
  State<StatefulWidget> createState() => _RevealProgressButtonState();
}

class _RevealProgressButtonState extends State<RevealProgressButton>
    with TickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  double _fraction = 0.0;

  @override
  Widget build(BuildContext context) {

    return CustomPaint(
      child: ProgressButton(reveal),
    );
  }

  @override
  void deactivate() {
    reset();
    super.deactivate();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  void reveal() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {
          _fraction = _animation.value;
        });
      })
      ..addStatusListener((AnimationStatus state) {
    print(state);

if(state == AnimationStatus.completed){
  widget.callback(AnimationStatus.completed.toString());
}

      });
    _controller.forward();
  }

  void reset() {
    _fraction = 0.0;
  }

}
