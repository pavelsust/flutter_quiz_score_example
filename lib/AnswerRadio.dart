

import 'package:flutter/material.dart';


class AnswerRadio extends StatefulWidget{

  final Function selectHandler;
  final String answerText;

  AnswerRadio(this.selectHandler, this.answerText);

  @override
  State<StatefulWidget> createState() {
    return _AnswerRadio();
  }

}


class _AnswerRadio extends State<AnswerRadio> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Color(0xFF00E676),
        textColor: Colors.white,
        child: Text(widget.answerText),
        onPressed: widget.selectHandler,
      ), //RaisedButton
    ); //Container
  }
}