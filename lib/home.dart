import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'MyButton.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userInput = '';
  var result = '';
  double inputSize = 30;
  double answerSize = 15;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userInput.toString(),
                          style: TextStyle(
                              fontSize: inputSize, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            result.toString(),
                            style: TextStyle(
                                fontSize: answerSize, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                            title: 'C',
                            onPress: () {
                              size();
                              userInput = '';
                              result = '';
                              setState(() {});
                            },
                            colors: const Color.fromARGB(255, 4, 199, 234)),
                        MyButton(
                            title: '%',
                            onPress: () {
                              size();
                              userInput += '%';
                              setState(() {});
                            },
                            colors: const Color.fromARGB(255, 4, 199, 234)),
                        MyButton(
                            title: 'DEL',
                            onPress: () {
                              size();
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                              setState(() {});
                            },
                            colors: const Color.fromARGB(255, 4, 199, 234)),
                        MyButton(
                          title: '/',
                          onPress: () {
                            size();
                            userInput += '/';
                            setState(() {});
                          },
                          colors: const Color.fromARGB(255, 4, 199, 234),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '7',
                            onPress: () {
                              size();
                              userInput += '7';
                              setState(() {});
                            }),
                        MyButton(
                            title: '8',
                            onPress: () {
                              size();
                              userInput += '8';
                              setState(() {});
                            }),
                        MyButton(
                            title: '9',
                            onPress: () {
                              size();
                              userInput += '9';
                              setState(() {});
                            }),
                        MyButton(
                          title: 'x',
                          onPress: () {
                            size();
                            userInput += '*';
                            setState(() {});
                          },
                          colors: const Color.fromARGB(255, 4, 199, 234),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '4',
                            onPress: () {
                              size();
                              userInput += '4';
                              setState(() {});
                            }),
                        MyButton(
                            title: '5',
                            onPress: () {
                              size();
                              userInput += '5';
                              setState(() {});
                            }),
                        MyButton(
                            title: '6',
                            onPress: () {
                              size();
                              userInput += '6';
                              setState(() {});
                            }),
                        MyButton(
                          title: '-',
                          onPress: () {
                            size();
                            userInput += '-';
                            setState(() {});
                          },
                          colors: const Color.fromARGB(255, 4, 199, 234),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '1',
                            onPress: () {
                              size();
                              userInput += '1';
                              setState(() {});
                            }),
                        MyButton(
                            title: '2',
                            onPress: () {
                              size();
                              userInput += '2';
                              setState(() {});
                            }),
                        MyButton(
                            title: '3',
                            onPress: () {
                              size();
                              userInput += '3';
                              setState(() {});
                            }),
                        MyButton(
                          title: '+',
                          onPress: () {
                            size();
                            userInput += '+';
                            setState(() {});
                          },
                          colors: const Color.fromARGB(255, 4, 199, 234),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '00',
                            onPress: () {
                              size();
                              userInput += '00';
                              setState(() {});
                            }),
                        MyButton(
                            title: '0',
                            onPress: () {
                              size();
                              userInput += '0';
                              setState(() {});
                            }),
                        MyButton(
                            title: '.',
                            onPress: () {
                              size();
                              userInput += '.';
                              setState(() {});
                            }),
                        MyButton(
                          title: '=',
                          onPress: () {
                            equalPress();
                            setState(() {});
                          },
                          colors: const Color.fromARGB(255, 4, 199, 234),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();

    var evaluate = expression.evaluate(EvaluationType.REAL, contextModel);
    result = '=$evaluate';
    inputSize = 15;
    answerSize = 30;
  }

  void size() {
    inputSize = 30;
    answerSize = 15;
  }
}
