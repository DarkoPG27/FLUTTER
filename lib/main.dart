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
  var _questionIndex = 0; // private property

  final _questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': ['Black', 'Red', 'Green', 'White']
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': ['Dog', 'Cat', 'Bird', 'Rabitt']
    },
    {
      'questionText': 'What is your favorite song?',
      'answers': [
        'In the End',
        'Bring me to Life',
        'Lose Yourself',
        'Remember the Name'
      ]
    },
  ];

  void _answerQuestion() {
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
