


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quiz_score_example/test/AssessmentResponse.dart';
import 'package:flutter_quiz_score_example/test/DatabaseHelper.dart';

class ReadJsonScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ReadJsonScreen();
  }

}


class _ReadJsonScreen extends State<ReadJsonScreen>{

  var databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadJson();
    });
  }

  loadJson() async {

    String dataJson = await rootBundle.loadString('assets/demo.json');

    Map<String, dynamic> map = json.decode(dataJson);
    List<dynamic> data = map["data"];

    for(var item in data){
      Data data = Data.fromJson(item);
      print("question is : ${json.encode(data.question)}");
      databaseHelper.insertQuestion(data.setName, json.encode(data.question));
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Bar"),
      ),
      body: Container(

      ),
    );
  }

}