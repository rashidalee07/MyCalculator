import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sliverappbar/cal_history.dart';
import 'package:sliverappbar/divider_line.dart';
import 'package:sliverappbar/scientific_mode.dart';
import 'package:sliverappbar/unit_converter.dart';

import 'global_variables.dart';



class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
  
}



class _MyCalculatorState extends State<MyCalculator> {
  
  final List<String> buttons = [
    "C",
    "( )",
    "%",
    "/",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "+/-",
    "0",
    ".",
    "="
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              height: 255,
              color: Colors.black,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        userQuestion,
                        style: TextStyle(
                            color: isOperator(userQuestion.substring(
                                    userQuestion.isEmpty
                                        ? 0
                                        : userQuestion.length - 1,
                                    userQuestion.length))
                                ? Colors.green
                                : Colors.white,
                            fontSize: 32),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        userAnswer,
                        style:
                            const TextStyle(color: Colors.green, fontSize: 32),
                      ),
                    )
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CalculationHistory(),
                const UnitConverter(),
                const ScientificMode(),
                Tooltip(
                  message: "Close",
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(16)),
                  child: IconButton(
                    splashColor: Colors.grey,
                    splashRadius: 24,
                    icon: const Icon(Icons.close),
                    color: userQuestion.isEmpty ? Colors.white : Colors.green,
                    iconSize: 28,
                    onPressed: userQuestion.isNotEmpty
                        ? () {
                            setState(() {
                              try {
                                userQuestion = userQuestion.substring(
                                    0, userQuestion.length - 1);
                              } catch (e) {
                                userAnswer = "";
                              }
                            });
                          }
                        : () {},
                  ),
                ),
              ],
            ),
            const DividerLine(),
            Expanded(
              flex: 2,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
                child: Container(
                  color: Colors.black,
                  height: 430,
                  width: double.infinity,
                  child: GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: buttons.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4,

                              // mainAxisExtent: 64,
                              childAspectRatio: 1 / .8,
                              crossAxisCount: 4),
                      itemBuilder: ((context, index) {
                        // Clear button

                        if (index == 0) {
                          return GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Tooltip(
                                //height: 40,
                                padding: const EdgeInsets.only(
                                    top: 8, left: 16, right: 16, bottom: 8),
                                // padding: EdgeInsets.all(16),
                                margin: const EdgeInsets.only(
                                    bottom: 16, right: 48),
                                message: "Clear",
                                textStyle: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                                decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    borderRadius: BorderRadius.circular(24)),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey[900],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(48),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        userQuestion = "";
                                        userAnswer = "";
                                        operator = "";
                                      });
                                    },
                                    child: Text(
                                      buttons[index],
                                      style: const TextStyle(
                                          fontSize: 32, color: Colors.red),
                                    )),
                              ),
                            ),
                          );
                        }

                        //Equals button

                        else if (index == buttons.length - 1) {
                          return GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Tooltip(
                                //height: 40,
                                padding: const EdgeInsets.only(
                                    top: 8, left: 16, right: 16, bottom: 8),
                                // padding: EdgeInsets.all(16),
                                margin: const EdgeInsets.only(
                                    bottom: 16, right: 48),
                                message: "Equal",
                                textStyle: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                                decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    borderRadius: BorderRadius.circular(24)),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(48),
                                      ),
                                    ),

                                    //Equal Button Pressed
                                    onPressed: () {
                                      String checkOperator = "";
                                      if (userQuestion.isNotEmpty) {
                                        checkOperator = userQuestion.substring(
                                            userQuestion.length - 1,
                                            userQuestion.length);
                                      }
                                      //Handling empty expression
                                      setState(() {
                                        if (isOperator("=") &&
                                            (userQuestion.isEmpty ||
                                                userQuestion.isEmpty)) {
                                          Fluttertoast.showToast(
                                              backgroundColor: Colors.grey[900],
                                              gravity: ToastGravity.TOP,
                                              msg: "Empty Expression");
                                        }

                                        // Toast Message Check for Please Enter Second operand

                                        else if (isOperator(checkOperator) &&
                                            isOperator("=")) {
                                          Fluttertoast.showToast(
                                              backgroundColor: Colors.grey[900],
                                              gravity: ToastGravity.TOP,
                                              msg:
                                                  "Please Enter Second Operand ");
                                        }

                                        // Expression = First Operand Op Second Operand than Equal button

                                        else if (isOperator("=") &&
                                            userQuestion.isNotEmpty) {
                                          equalPressed();

                                          ///userQuestion = userAnswer;
                                          //userAnswer=;
                                          userQuestion = "";
                                        } else if (isOperator("=") &&
                                            userAnswer.isNotEmpty) {
                                          userQuestion = userAnswer;
                                          userAnswer = "";
                                          equalPressed();

                                          //userQuestion+=userQuestion;

                                        }

                                      });
                                    },
                                    child: Text(
                                      buttons[index],
                                      style: const TextStyle(
                                          fontSize: 32, color: Colors.white),
                                    )),
                              ),
                            ),
                          );
                        }

                        // other buttons
                        else {
                          return GestureDetector(
                            child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey[900],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(28),
                                      )),
                                  onPressed: () {
                                    // on pressing operator assigning answer to question
                                    setState(() {
                                      if (isOperator(buttons[index]) &&
                                          userAnswer.isNotEmpty) {
                                        userQuestion = userAnswer;
                                        userQuestion += buttons[index];
                                        userAnswer = "";
                                      }

                                      //Toast msg for entering operator first in expression
                                      else if (isOperator(buttons[index]) &&
                                          userQuestion.isEmpty) {
                                        Fluttertoast.showToast(
                                            backgroundColor: Colors.grey[900],
                                            gravity: ToastGravity.TOP,
                                            msg: "Please Enter Operand First");
                                      }

                                      //length of operand
                                      else {
                                        // This check is tracing operator
                                        if (userQuestion.length < 15) {
                                          //dealing with numpad values enter by user
                                          if (!isOperator(buttons[index])) {
                                            userQuestion += buttons[index];
                                            
                                          }
                                          // dealing with first operator in expression
                                          else if (isOperator(buttons[index]) &&
                                              operator.isEmpty) {
                                            operator = buttons[index];
                                            userQuestion += buttons[index];
                                          }

                                          //dealing with same operator enter by user
                                          else if (operator == buttons[index]) {
                                            return;
                                          }

                                          // dealing with two different operators enter by user at the end of exp.
                                          else if (operator != buttons[index]) {
                                            userQuestion =
                                                userQuestion.substring(
                                                    0, userQuestion.length - 1);
                                            userQuestion += buttons[index];
                                            operator = buttons[index];
                                          }
                                        } else {
                                          Fluttertoast.showToast(
                                              backgroundColor: Colors.grey[900],
                                              gravity: ToastGravity.TOP,
                                              msg:
                                                  "Can't enter more than 15 digits");
                                        }

                                        //userAnswer=userQuestion;//old comment
                                      }
                                    });
                                  },
                                  child: Text(
                                    buttons[index],
                                    style: TextStyle(
                                        fontSize: 32,
                                        color: isOperator(buttons[index])
                                            ? Colors.green
                                            : Colors.white),
                                  ),
                                )),
                          );
                        }
                      })),
                ),
              ),
            )
          ],
        ));
  }
}

bool isOperator(String op) {
  if (op == "C" ||
      op == "( )" ||
      op == "%" ||
      op == "/" ||
      op == "x" ||
      op == "-" ||
      op == "+" ||
      op == "=") {
    return true;
  } else {
    return false;
  }
}

void equalPressed() {
  String tempAnswer;
  String finalQuestion = userQuestion;
  finalQuestion = finalQuestion.replaceAll("x", "*");

  Parser p = Parser();
  Expression exp = p.parse(finalQuestion);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);

  tempAnswer = eval.toString();

  //This check is converting double to integer value
  if (tempAnswer.endsWith(".0")) {
    //userAnswer = tempAnswer.substring(0, tempAnswer.length-2);
    userAnswer = eval.toInt().toString();
  } else {
    int stringFixedLength = decimalLength(tempAnswer);
    userAnswer = eval.toStringAsFixed(stringFixedLength);

    userQuestion = userAnswer;
  }

  // return userAnswer;
}

int decimalLength(String expression) {
  int stringLength = expression.length;
  int fixedString = 0;
  int index = 0;

  for (int i = 0; i < expression.length; i++) {
    if (expression[i] == ".") {
      index = i;
      fixedString = stringLength - (index + 1);
      // exp = expression.substring(index + 1, expression.length);
      // print("Expression: $exp");
      break;
    }
  }

  if (fixedString < 10) {
    return fixedString;
  } else {
    fixedString = 10;
  }
  return fixedString;
}

