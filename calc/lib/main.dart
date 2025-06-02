import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double size = 0;
  String inputtext = "";
  String calculated = "";
  String operator = "";
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width / 5;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              child: Text(
                inputtext,
                style: TextStyle(color: Colors.white, fontSize: 100),
              ),
              alignment: Alignment.bottomRight,
            ),
            Column(
              children: [
                Row(
                  children: [
                    calculateButton("7", Colors.white60),
                    calculateButton("8", Colors.white60),
                    calculateButton("9", Colors.white60),
                    calculateButton(
                      "/",
                      const Color.fromARGB(255, 231, 120, 34),
                    ),
                  ],
                ),
                Row(
                  children: [
                    calculateButton("4", Colors.white60),
                    calculateButton("5", Colors.white60),
                    calculateButton("6", Colors.white60),
                    calculateButton(
                      "*",
                      const Color.fromARGB(255, 231, 120, 34),
                    ),
                  ],
                ),
                Row(
                  children: [
                    calculateButton("1", Colors.white60),
                    calculateButton("2", Colors.white60),
                    calculateButton("3", Colors.white60),
                    calculateButton(
                      "-",
                      const Color.fromARGB(255, 231, 120, 34),
                    ),
                  ],
                ),
                Row(
                  children: [
                    calculateButton("0", Colors.white60),
                    calculateButton(".", Colors.white60),
                    calculateButton(
                      "=",
                      const Color.fromARGB(255, 231, 120, 34),
                    ),
                    calculateButton(
                      "+",
                      const Color.fromARGB(255, 231, 120, 34),
                    ),
                  ],
                ),
                calculateButton("clear", Colors.black),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget calculateButton(String text, Color bgcolor) {
    return InkWell(
      onTap: () {
        if (text == "clear") {
          setState(() {
            inputtext = "";
            calculated = "";
            operator = "";
          });
        } else if (text == "+" || text == "-" || text == "*" || text == "/") {
          setState(() {
            calculated = inputtext;
            inputtext = "";
            operator = text;
          });
        } else if (text == "=") {
          if (calculated.isNotEmpty && inputtext.isNotEmpty) {
            double num1 = double.parse(calculated);
            double num2 = double.parse(inputtext);
            double result = 0;

            switch (operator) {
              case "+":
                result = num1 + num2;
                break;
              case "-":
                result = num1 - num2;
                break;
              case "*":
                result = num1 * num2;
                break;
              case "/":
                if (num2 != 0) {
                  result = num1 / num2;
                } else {
                  result = 0;
                }
                break;
            }

            setState(() {
              inputtext = result.toString();
              calculated = "";
              operator = "";
            });
          }
        } else {
          setState(() {
            inputtext += text;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(100),
        ),
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        height: size,
        width: size,
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );
  }
}
