import 'package:antonx_calculator/core/constants/colors.dart';
import 'package:antonx_calculator/ui/custom_widgets/green_rounded_button.dart';
import 'package:antonx_calculator/ui/custom_widgets/grey_rounded_button.dart';
import 'package:antonx_calculator/ui/custom_widgets/white_rounded_button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String valueText = '';
  String answerText = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainThemeColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            /// Result section
            Padding(
              padding: const EdgeInsets.only(top: 100, right: 10),
              child: Text(
                answerText,
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),

            /// Values display section
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  valueText,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(
                    Icons.backspace,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    valueText = valueText.substring(0, valueText.length - 1);
                    setState(() {});
                    print('Backspace pressed');
                  },
                )
              ],
            ),

            /// buttons
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: darkGreyBgColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                ),
                child: Row(
                  children: [
                    /// Column-1
                    Expanded(
                      child: Column(
                        children: [
                          WhiteRoundedButton(
                            value: 'AC',
                            onPressed: () {
                              print('0 pressed');
                            },
                          ),
                          GreyRoundedButton(
                            value: '1',
                            onPressed: () {
                              valueText = valueText + '1';
                              setState(() {});
                              print('1 pressed');
                            },
                          ),
                          GreyRoundedButton(
                            value: '4',
                            onPressed: () {
                              print('1 pressed');
                            },
                          ),
                          GreyRoundedButton(
                            value: '7',
                            onPressed: () {
                              print('1 pressed');
                            },
                          ),
                          WhiteRoundedButton(
                            value: '+|-',
                            onPressed: () {
                              print('0 pressed');
                            },
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      ),
                    ),

                    /// Column-2
                    Expanded(
                      child: Column(
                        children: [
                          WhiteRoundedButton(
                            value: 'AC',
                            onPressed: () {
                              print('0 pressed');
                            },
                          ),
                          GreyRoundedButton(
                            value: '1',
                            onPressed: () {
                              print('1 pressed');
                            },
                          ),
                          GreyRoundedButton(
                            value: '4',
                            onPressed: () {
                              print('1 pressed');
                            },
                          ),
                          GreyRoundedButton(
                            value: '7',
                            onPressed: () {
                              print('1 pressed');
                            },
                          ),
                          WhiteRoundedButton(
                            value: '+|-',
                            onPressed: () {
                              print('0 pressed');
                            },
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      ),
                    ),

                    /// Column-3
                    Expanded(
                      child: Column(
                        children: [
                          WhiteRoundedButton(
                            value: 'AC',
                            onPressed: () {
                              print('0 pressed');
                            },
                          ),
                          GreyRoundedButton(
                            value: '1',
                            onPressed: () {
                              print('1 pressed');
                            },
                          ),
                          GreyRoundedButton(
                            value: '4',
                            onPressed: () {
                              print('1 pressed');
                            },
                          ),
                          GreyRoundedButton(
                            value: '7',
                            onPressed: () {
                              print('1 pressed');
                            },
                          ),
                          WhiteRoundedButton(
                            value: '+|-',
                            onPressed: () {
                              print('0 pressed');
                            },
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      ),
                    ),

                    /// Column-4
                    Expanded(
                      child: Column(
                        children: [
                          WhiteRoundedButton(
                            value: 'AC',
                            onPressed: () {
                              print('0 pressed');
                            },
                          ),
                          GreyRoundedButton(
                            value: '1',
                            onPressed: () {
                              print('1 pressed');
                            },
                          ),
                          GreyRoundedButton(
                            value: '4',
                            onPressed: () {
                              print('1 pressed');
                            },
                          ),
                          GreenRoundedButton(
                            value: '=',
                            onPressed: () {},
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
