import 'package:ch_8_calculator/compoments/button.dart';
import 'package:ch_8_calculator/compoments/constant.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var textInput = '';
  var result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerRight,
                child: Text(
                  '$textInput',
                  style: myStyle,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerRight,
                child: Text(
                  '${textInput.isEmpty ? result = '' : result}',
                  style: myStyle,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Row(children: [
                CButton(
                  title: 'AC',
                  onPress: () {
                    setState(() {
                      textInput = '';
                    });
                  },
                ),
                CButton(
                  title: '+/-',
                  onPress: () {
                    setState(() {
                      textInput += '+/-';
                    });
                  },
                ),
                CButton(
                  title: '%',
                  onPress: () {
                    setState(() {
                      textInput += '%';
                    });
                  },
                ),
                CButton(
                  title: '/',
                  colors: Colors.amber,
                  onPress: () {
                    setState(() {
                      textInput += '/';
                    });
                  },
                )
              ]),
              Row(children: [
                CButton(
                  title: '7',
                  onPress: () {
                    setState(() {
                      textInput += '7';
                    });
                  },
                ),
                CButton(
                  title: '8',
                  onPress: () {
                    setState(() {
                      textInput += '8';
                    });
                  },
                ),
                CButton(
                  title: '9',
                  onPress: () {
                    setState(() {
                      textInput += '9';
                    });
                  },
                ),
                CButton(
                  title: 'x',
                  colors: Colors.amber,
                  onPress: () {
                    setState(() {
                      textInput += 'x';
                    });
                  },
                )
              ]),
              Row(children: [
                CButton(
                  title: '4',
                  onPress: () {
                    setState(() {
                      textInput += '4';
                    });
                  },
                ),
                CButton(
                  title: '5',
                  onPress: () {
                    setState(() {
                      textInput += '5';
                    });
                  },
                ),
                CButton(
                  title: '6',
                  onPress: () {
                    setState(() {
                      textInput += '6';
                    });
                  },
                ),
                CButton(
                  title: '-',
                  colors: Colors.amber,
                  onPress: () {
                    setState(() {
                      textInput += '-';
                    });
                  },
                )
              ]),
              Row(children: [
                CButton(
                  title: '1',
                  onPress: () {
                    setState(() {
                      textInput += '1';
                    });
                  },
                ),
                CButton(
                  title: '2',
                  onPress: () {
                    setState(() {
                      textInput += '2';
                    });
                  },
                ),
                CButton(
                  title: '3',
                  onPress: () {
                    setState(() {
                      textInput += '3';
                    });
                  },
                ),
                CButton(
                  title: '+',
                  colors: Colors.amber,
                  onPress: () {
                    setState(() {
                      textInput += '+';
                    });
                  },
                )
              ]),
              Row(children: [
                CButton(
                  title: '0',
                  onPress: () {
                    setState(() {
                      textInput += '0';
                    });
                  },
                ),
                CButton(
                  title: '.',
                  onPress: () {
                    setState(() {
                      textInput += '.';
                    });
                  },
                ),
                CButton(
                  title: 'del',
                  onPress: () {
                    setState(() {
                      textInput = textInput.substring(0, textInput.length - 1);
                    });
                  },
                ),
                CButton(
                  title: '=',
                  colors: Color(0xffffa00a),
                  onPress: () {
                    setState(() {
                      // equalPressed();
                      equalPress();
                    });
                  },
                )
              ]),
            ],
          ),
        )
      ])),
    );
  }

  void equalPress() {
    String finalTextInput = textInput;
    finalTextInput = textInput.replaceAll('x', '*');
    Parser parser = Parser();
    Expression expression = parser.parse(finalTextInput);
    ContextModel cm = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, cm);
    result = eval.toString();
  }
}
