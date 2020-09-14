import 'package:flutter/material.dart';

class Question {
  String question;
  int category;
  String type;

  Question(
      {@required this.question, @required this.category, @required this.type});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'] as String,
      category: json['category'] as int,
      type: json['type'] as String,
    );
  }
}
