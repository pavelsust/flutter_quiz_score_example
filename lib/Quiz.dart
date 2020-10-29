


import 'package:flutter/material.dart';
import 'package:flutter_quiz_score_example/Answer.dart';
import 'package:flutter_quiz_score_example/Question.dart';


//
// class Quiz extends StatefulWidget{
//
//   final List<Map<String, Object>> questions;
//   final int questionIndex;
//   final Function answerQuestion;
//
//   Quiz({
//     @required this.questions,
//     @required this.answerQuestion,
//     @required this.questionIndex,
//   });
//
//   @override
//   State<StatefulWidget> createState() {
//     return _Quiz();
//   }
//
// }
//
//
// class _Quiz extends State<Quiz> {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Question(
//           widget.questions[widget.questionIndex]['questionText'],
//         ), //Question
//         ...(widget.questions[widget.questionIndex]['answers'] as List<Map<String, Object>>)
//             .map((answer) {
//           // return Answer(() => answerQuestion(answer['score']), answer['text']);
//           print("${answer['text']}");
//           return RadioListTile(
//             title: Text("${answer['text']}"),
//               value: answer,
//               groupValue: answer['text'],
//               onChanged: (value){
//                 widget.answerQuestion(answer['score']);
//               });
//         })
//       ],
//     ); //Column
//   }
// }


// class Quiz extends StatelessWidget {
//   final List<Map<String, Object>> questions;
//   final int questionIndex;
//   final Function answerQuestion;
//
//   Quiz({
//     @required this.questions,
//     @required this.answerQuestion,
//     @required this.questionIndex,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Question(
//           questions[questionIndex]['question_en'],
//         ), //Question
//         ...(questions[questionIndex]['options'] as List<Map<String, Object>>)
//             .map((answer) {
//           return Answer(() => answerQuestion(answer['weight']), answer['option_en']);
//         }).toList()
//       ],
//     ); //Column
//   }
// }


class Quiz extends StatelessWidget {
  var questions = [];
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['question_en'],
        ), //Question
        ...(questions[questionIndex]['options'])
            .map((answer) {
          return Answer(() => answerQuestion(answer['weight']), answer['option_en']);
        }).toList()
      ],
    ); //Column
  }
}