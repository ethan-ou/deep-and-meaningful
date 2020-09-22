import 'package:deep_and_meaningful/models/question.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  int _category = 0;
  List<Question> _questions = [];

  get category {
    return _category;
  }

  set category(int category) {
    _category = category;
    notifyListeners();
  }

  void populateQuestions(List<Question> questions) {
    _questions = questions;
    notifyListeners();
  }

  List<Question> getQuestions() {
    List<Question> newQuestions = _questions.where((question) {
      // For Intimate category, return all Deep questions too
      if (_category == 3) {
        return question.category == 2 || question.category == 3;
      } else {
        return question.category == _category;
      }
    }).toList();

    newQuestions.shuffle();

    return newQuestions;
  }
}
