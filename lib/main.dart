import "package:flutter/material.dart";
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questions = [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 5},
        {"text": "Green", "score": 3},
        {"text": "White", "score": 1}
      ],
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {"text": "Rabbit", "score": 3},
        {"text": "Snake", "score": 11},
        {"text": "Elephant", "score": 5},
        {"text": "Lion", "score": 9}
      ]
    },
    {
      "questionText": "Who's your favorite instructor?",
      "answers": [
        {"text": "Max", "score": 1},
        {"text": "Max", "score": 1},
        {"text": "Max", "score": 1},
        {"text": "Max", "score": 1}
      ],
    },
  ];

  int questionIndex = 0;
  int _totalScore = 0;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(
                resultScore: _totalScore,
                resetQuiz: _resetQuiz,
              ),
      ),
    );
  }

  void _resetQuiz() {
    setState(() {
      questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      questionIndex = questionIndex + 1;
      _totalScore += score;
    });
  }
}
