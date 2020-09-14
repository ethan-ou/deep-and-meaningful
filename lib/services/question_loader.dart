import 'dart:async' show Future;
import 'dart:convert';
import 'package:deep_and_meaningful/models/question.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

class QuestionLoader {
  static Future<List<Question>> load() async {
    final response = await rootBundle.loadString('assets/questions.json');

    return compute(_parse, response);
  }

  static List<Question> _parse(String response) {
    final parsed = jsonDecode(response).cast<Map<String, dynamic>>();

    return parsed.map<Question>((json) => Question.fromJson(json)).toList();
  }
}
