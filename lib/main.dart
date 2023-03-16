import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState(); //  The leading "_" marks a class, property or method as private, which means that you can only use it in the same library. Typically, a file is treated as a separate library.
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ]
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 2},
        {'text': 'Bird', 'score': 6},
        {'text': 'Rabitt', 'score': 1},
      ]
    },
    {
      'questionText': 'What is your favorite song?',
      'answers': [
        {'text': 'In the End', 'score': 10},
        {'text': 'Bring me to Life', 'score': 8},
        {'text': 'Lose Yourself', 'score': 9},
        {'text': 'Remember the Name', 'score': 7},
      ]
    },
  ];

  var _questionIndex = 0; // private property
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
      print(_questionIndex);
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First Flutter App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(),
      ),
    );
  }
}
