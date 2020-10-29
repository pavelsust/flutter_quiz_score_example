import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quiz_score_example/Quiz.dart';
import 'package:flutter_quiz_score_example/Result.dart';
import 'package:flutter_quiz_score_example/test/AssessmentPojo.dart';
import 'package:flutter_quiz_score_example/test/DatabaseHelper.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyQuiz(),
    );
  }
}

// class MyQuiz extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     return _MyQuiz();
//   }
//
// }
//
//
// class _MyQuiz extends State<MyQuiz> {
//   final _questions = const [
//     {
//       "id": 1,
//       "question_en": "test",
//       "question_bn": "test",
//       "is_active": 0,
//       "options": [
//         {
//           "id": 1,
//           "option_en": "test",
//           "option_bn": "test",
//           "weight": 2,
//           "is_active": 1
//         },
//         {
//           "id": 2,
//           "option_en": "test2",
//           "option_bn": "test2",
//           "weight": 1,
//           "is_active": 1
//         }
//       ]
//     },
//     {
//       "id": 2,
//       "question_en": "test",
//       "question_bn": "test",
//       "is_active": 0,
//       "options": [
//         {
//           "id": 1,
//           "option_en": "test",
//           "option_bn": "test",
//           "weight": 2,
//           "is_active": 1
//         },
//         {
//           "id": 2,
//           "option_en": "test2",
//           "option_bn": "test2",
//           "weight": 1,
//           "is_active": 1
//         }
//       ]
//     },
//     {
//       "id": 1,
//       "question_en": "test",
//       "question_bn": "test",
//       "is_active": 0,
//       "options": [
//         {
//           "id": 1,
//           "option_en": "test",
//           "option_bn": "test",
//           "weight": 2,
//           "is_active": 1
//         },
//         {
//           "id": 2,
//           "option_en": "test2",
//           "option_bn": "test2",
//           "weight": 1,
//           "is_active": 1
//         }
//       ]
//     }
//   ];
//
//   var _questionIndex = 0;
//   var _totalScore = 0;
//
//   void _resetQuiz() {
//     setState(() {
//       _questionIndex = 0;
//       _totalScore = 0;
//     });
//   }
//
//   void _answerQuestion(int score) {
//     _totalScore += score;
//
//     setState(() {
//       _questionIndex = _questionIndex + 1;
//     });
//
//     print(_questionIndex);
//
//     if (_questionIndex < _questions.length) {
//       print('We have more questions!');
//     } else {
//       print('No more questions!');
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Geeks for Geeks'),
//           backgroundColor: Color(0xFF00E676),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: _questionIndex < _questions.length
//               ? Quiz(
//             answerQuestion: _answerQuestion,
//             questionIndex: _questionIndex,
//             questions: _questions,
//           ) //Quiz
//               : Result(_totalScore, _resetQuiz),
//         ), //Padding
//       ), //Scaffold
//       debugShowCheckedModeBanner: false,
//     ); //MaterialApp
//   }
// }
//
//

class MyQuiz extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyQuiz();
  }
}

class _MyQuiz extends State<MyQuiz> {

  var databaseHelper = DatabaseHelper();
  var _questions = [];
  List<AssessmentPojo> assessmentList;

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  void initState() {
    super.initState();

    if(_questions==null){

    }else{
      print("Not null");
    }
    getQuestionList();
  }



  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Geeks for Geeks'),
          backgroundColor: Color(0xFF00E676),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions,
          ) : Result(_totalScore, _resetQuiz),
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }

  void getQuestionList() async {

    var result  = await databaseHelper.getAssessmentList();
    setState(() {
      _questions = json.decode(result[0].questions);
    });

    print("question size ${_questions.length}");

  }

}