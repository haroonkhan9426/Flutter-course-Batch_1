import 'package:flutter/material.dart';

import 'models/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  Widget tick = Icon(Icons.check, color: Colors.lightGreen);

  Widget cross = Icon(Icons.clear, color: Colors.redAccent);

  final List<Question> questions = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  List<Widget> answers = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black38,

        ///
        /// Column_1
        ///
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 150),

            ///
            /// Question Widget
            ///
            Center(
                child: Text(
              questions[count].text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            )),

            Spacer(),

            ///
            /// True Button
            ///
            RaisedButton(
              color: Colors.lightGreen,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              onPressed: () {
                if (questions[count].answer == true) {
                  print('Correct answer');
                  answers.add(tick);
                } else {
                  print('Wrong answer');
                  answers.add(cross);
                }
                print('True Pressed');
                count++;
                count = count % questions.length;
                setState(() {});
              },
            ),
            SizedBox(height: 10),

            ///
            /// False Button
            ///
            RaisedButton(
              color: Colors.redAccent,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              onPressed: () {
                if (questions[count].answer == false) {
                  print('Correct answer');
                  answers.add(tick);
                } else {
                  print('Wrong answer');
                  answers.add(cross);
                }
                count++;
                count = count % questions.length;
                print('False Pressed');
                setState(() {});
              },
            ),

            ///
            /// Tick and Cross Icons
            ///
            Row(
              children: answers,
            )
          ],
        ),
      ),
    );
  }
}
