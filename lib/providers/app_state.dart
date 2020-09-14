import 'package:deep_and_meaningful/models/question.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  int _category = 0;
  int _index = 0;
  List<Question> _questions = [];
  List<Question> _activeQuestions = [];

  Question get question {
    if (_activeQuestions.length == 0) {
      _activeQuestions = _filterQuestions(_questions, _category);
    }

    return _activeQuestions[_index];
  }

  get category {
    return _category;
  }

  set category(int category) {
    _category = category;
    notifyListeners();
  }

  void next() {
    if (_index == _activeQuestions.length - 1) {
      addQuestions();
    }

    _index++;
    notifyListeners();
  }

  void prev() {
    if (_index > 0) {
      _index--;
      notifyListeners();
    }
  }

  void populateQuestions(List<Question> questions) {
    _questions = questions;
    notifyListeners();
  }

  void addQuestions() {
    _activeQuestions.addAll(_filterQuestions(_questions, _category));
    notifyListeners();
  }

  void loadQuestions() {
    _activeQuestions = _filterQuestions(_questions, _category);
    notifyListeners();
  }

  List<Question> _filterQuestions(List<Question> questionList, int category) {
    List<Question> newQuestions = questionList
        .where((question) => question.category == category)
        .toList();

    newQuestions.shuffle();

    return newQuestions;
  }
}
