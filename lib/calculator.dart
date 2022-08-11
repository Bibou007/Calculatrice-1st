import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String userInput = "";
  String result = "0";
  List<String> buttonsList = [
    'C',
    '(',
    ')',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '-',
    'AC',
    '0',
    '.',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Flexible(
              child: resultWidget(),
              flex: 1,
            ),
            Flexible(
              child: buttonsWidget(),
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget resultWidget() {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(20),
          child: Text(
            userInput,
            style: const TextStyle(fontSize: 38),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(20),
          child: Text(
            result,
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget buttonsWidget() {
    return GridView.builder(
      itemCount: buttonsList.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (BuildContext context, int index) {
        return button(buttonsList[index]);
      },
    );
  }

  Widget button(String text) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: MaterialButton(
        onPressed: () {
          setState(() {
            handleButoonPress(text);
          });
        
        },
        color: getColor(text),
        child: Text(
          text,
          style: const TextStyle(fontSize: 25),
        ),
        shape: const CircleBorder(),
      ),
    );
  }

  handleButoonPress(String text) {
    if (text == "AC") {
//Reset All
      userInput = "";
      result = "0";
      return;
    }
    if (text == "C") {
      //remove last char
      userInput = userInput.substring(0, userInput.length-1);
      return;
    }
    if (text == "=") {
      //Calculate the result
      result = calculate();
      //Rmove Decimal
      if (result.endsWith(".0")) {
        result.replaceAll(".0", "");
        return;
      }
      return;
    }
    userInput = userInput + text;
  }

  String calculate() {
    try {
      var exp = Parser().parse(userInput);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "Error";
    }
  }

  getColor(String text) {
    if (text == "/" ||
        text == "*" ||
        text == "+" ||
        text == "-" ||
        text == "-" ||
        text == "=") {
      return Colors.orangeAccent;
    }
    if (text == "C" || text == "AC") {
      return Colors.red;
    }
    if (text == "(" || text == ")") {
      return Colors.blueGrey;
    }
    return Colors.lightBlue;
  }
}
