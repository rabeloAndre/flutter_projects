import 'package:flutter/material.dart';
import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question('1 + 1 = 2', false),
    Question('The chicken came first that egg', true),
    Question('Will still snow in Teresina', false),
    Question('Brazil will cacinate everyone the population by tje end 0f 2021',
        true),
    Question('O Palmeiras não tem mundial', true),
    Question('The life of programmer is hard', true),
    Question(
        'The pandemic is under control in most developed countries', false),
    Question(
        'After taking the second dose of the vaccine from Covid-19 it is more necessary for us to protect ourselves',
        false),
    Question('The pandemic in Brazil is in a way', false),
    Question('Covid-19 is just a little flu', false),
  ];

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
