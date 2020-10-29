import 'package:flutter_quiz_score_example/test/DatabaseHelper.dart';

class AssessmentResponse {
  int success;
  List<Data> data;

  AssessmentResponse({this.success, this.data});

  AssessmentResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class Data {
  int id;
  String setName;
  int isActive;
  List<Question> question;

  Data({this.id, this.setName, this.isActive, this.question});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    setName = json['set_name'];
    isActive = json['is_active'];
    if (json['question'] != null) {
      question = new List<Question>();
      json['question'].forEach((v) {
        question.add(new Question.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['set_name'] = this.setName;
    data['is_active'] = this.isActive;
    if (this.question != null) {
      data['question'] = this.question.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Question {
  int id;
  String questionEn;
  String questionBn;
  int isActive;
  List<Options> options;

  Question(
      {this.id, this.questionEn, this.questionBn, this.isActive, this.options});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionEn = json['question_en'];
    questionBn = json['question_bn'];
    isActive = json['is_active'];
    if (json['options'] != null) {
      options = new List<Options>();
      json['options'].forEach((v) {
        options.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question_en'] = this.questionEn;
    data['question_bn'] = this.questionBn;
    data['is_active'] = this.isActive;
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  int id;
  String optionEn;
  String optionBn;
  int weight;
  int isActive;

  Options({this.id, this.optionEn, this.optionBn, this.weight, this.isActive});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    optionEn = json['option_en'];
    optionBn = json['option_bn'];
    weight = json['weight'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['option_en'] = this.optionEn;
    data['option_bn'] = this.optionBn;
    data['weight'] = this.weight;
    data['is_active'] = this.isActive;
    return data;
  }
}