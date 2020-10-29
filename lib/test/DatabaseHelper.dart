

import 'dart:core';

import 'package:flutter_quiz_score_example/test/AssessmentPojo.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

const String TABLE_NAME = "demo_table";
const String SET_NAME = "set_name";
const String QUESTION_SET  = "set_question";
const  ID = "_id";

class DatabaseHelper {

  static var _databaseHelper;
  var _database;

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializedDatabase();
    }
    return _database;
  }

  Future<Database> initializedDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = directory.path + 'notes.db';

    /// create the database

    var notesDatabase =
    await openDatabase(path, version: 1, onCreate: _createDatabase);
    return notesDatabase;
  }

  void _createDatabase(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $TABLE_NAME($ID INTEGER PRIMARY KEY AUTOINCREMENT, $SET_NAME TEXT, $QUESTION_SET TEXT )');
  }


  Future<int> insertQuestion(String name , String question) async {
    var database = await this.database;
    var result = database.insert(TABLE_NAME, AssessmentPojo(questions: question , questionSet: name).toDatabaseMap());
    return result;
  }

  Future<List<AssessmentPojo>> getAssessmentList() async {
    var notePrepareMap = await getPrepareList();
    var noteList = List<AssessmentPojo>();
    for (var item in notePrepareMap) {
      noteList.add(AssessmentPojo.fromMapObjectToPrepareObject(item));
    }
    return noteList;
  }

  Future<List<Map<String, dynamic>>> getPrepareList() async {
    var database = await this.database;
    //var result = await database.rawQuery('SELECT * FROM $TABLE_NAME order by ${PRIORITY} ASC');
    var result = await database.query(TABLE_NAME);
    return result;
  }



}