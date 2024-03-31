import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> questions = [
    'Do you like ice cream?',
    'What do you think about Flutter?',
    'Which programming language do you prefer?',
    'Are you having fun?',
  ];

  final List<List<String>> options = [
    ['Yes', 'No'],
    ['Great', 'Good', 'Average', 'Poor'],
    ['Dart', 'Java', 'Python', 'JavaScript'],
    ['Yes', 'No']
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Questionnaire'),
        ),
        body: QuestionPage(questions, options),
      ),
    );
  }
}

class QuestionPage extends StatefulWidget {
  final List<String> questions;
  final List<List<String>> options;

  QuestionPage(this.questions, this.options);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int _currentPage = 0;
  List<String> _answers = List.filled(4, '');

  void navigateToNextPage() {
    if (_answers.every((answer) => answer.isNotEmpty)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CongratulationPage()),
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Please answer all questions first!',
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: widget.questions.length,
            controller: PageController(initialPage: _currentPage),
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.questions[index],
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 20.0),
                  // Display options as radio buttons for the third question
                  if (index == 2)
                    Column(
                      children: widget.options[index]
                          .map(
                            (option) => RadioListTile(
                          title: Text(option),
                          value: option,
                          groupValue: _answers[index],
                          onChanged: (value) {
                            setState(() {
                              _answers[index] = value.toString();
                            });
                          },
                        ),
                      )
                          .toList(),
                    )
                  else // Display Yes/No buttons for other questions
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _answers[index] = 'Yes';
                            });
                          },
                          child: Text('Yes'),
                        ),
                        SizedBox(width: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _answers[index] = 'No';
                            });
                          },
                          child: Text('No'),
                        ),
                      ],
                    ),
                ],
              );
            },
            onPageChanged: (index) {
              if (_answers[index].isEmpty && index != 2) {
                Fluttertoast.showToast(
                  msg: 'Please answer the current question first!',
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.red,
                );
                // Prevent navigation if the question is not answered
                Future.delayed(Duration(milliseconds: 100), () {
                  // Delay to avoid multiple toasts in quick succession
                  setState(() {
                    _currentPage = _currentPage; // Stay on the same page
                  });
                });
              } else {
                setState(() {
                  _currentPage = index;
                });
              }
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _currentPage > 0
                  ? () {
                setState(() {
                  _currentPage--;
                });
              }
                  : null,
              child: Text('Previous'),
            ),
            ElevatedButton(
              onPressed: _currentPage < widget.questions.length - 1
                  ? () {
                setState(() {
                  _currentPage++;
                  if (_currentPage == widget.questions.length) {
                    navigateToNextPage();
                  }
                });
              }
                  : null,
              child: Text('Next'),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        Text('Answers: $_answers'),
      ],
    );
  }
}

class CongratulationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Congratulations!'),
      ),
      body: Center(
        child: Text(
          'Congratulations! You have answered all questions.',
          style: TextStyle(fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
