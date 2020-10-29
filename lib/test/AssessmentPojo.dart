

import 'package:flutter_quiz_score_example/test/DatabaseHelper.dart';

class AssessmentPojo{

  String questionSet;
  String questions;


  AssessmentPojo({this.questionSet, this.questions});

  AssessmentPojo.fromMapObjectToPrepareObject(Map<String , dynamic> map){
    this.questionSet = map[SET_NAME];
    this.questions = map[QUESTION_SET];
  }

   Map<String , dynamic> toDatabaseMap(){
    var map = Map<String , dynamic>();
    map[SET_NAME] = this.questionSet;
    map[QUESTION_SET] = this.questions;
    return map;
  }

}