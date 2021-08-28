import 'package:flutter/material.dart';
import 'package:flutter_calculator/Widgets/CalculatorButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  CalcApp({Key? key}) : super(key: key);

  @override
  _CalcAppState createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  String _history = "";
  String _expression = "";
  bool clearText = false;
  void numClick(String text){
    setState(() {
      _expression = clearText?_expression = text : _expression += text;
      clearText = false;
    });
  }

  void allClear(String text){
    setState(() {
      _expression = '';
      _history = '';
    });
  }

  void clear(String text){
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text){
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expression;
      _expression = eval.toString();
      clearText = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Calculator',
      home: new Scaffold(
        backgroundColor: Color(0xFF283637),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
          children: [
             Container(
              padding: EdgeInsets.only(right: 12),
              child: Text(
                _history,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF545F61)
                  )
                ),                
              ),
              alignment: Alignment(1, 1),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                _expression,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 48,
                    color: Color(0XFFFFFFFF)
                  )
                ),                
              ),
              alignment: Alignment(1, 1),
            ),
            SizedBox(height: 40,),
            // ignore: todo
            // TODO: AC C % /
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new CalcButton(
                  text: "AC",
                  backgroundColor: 0xFF6C807F,
                  textSize: 20,
                  callBack: allClear,
                ),
                new CalcButton(
                  text: "C",
                  backgroundColor: 0xFF6C807F,
                  callBack: clear,
                ),
                new CalcButton(
                  text: "%",
                  backgroundColor: 0xFFFFFFFF,
                  colorText: 0XFF65BDAC,
                  callBack: numClick,
                ),
                new CalcButton(
                  text: "/",
                  backgroundColor: 0xFFFFFFFF,
                  colorText: 0XFF65BDAC,
                  callBack: numClick,
                ),
              ],
            ),
            // ignore: todo
            // TODO: 7 8 9 *
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new CalcButton(
                  text: "7",
                  callBack: numClick,
                ),
                new CalcButton(
                  text: "8",
                  callBack: numClick,
                ),
                new CalcButton(
                  text: "9",
                  callBack: numClick,
                ),
                new CalcButton(
                  text: "*",
                  backgroundColor: 0xFFFFFFFF,
                  colorText: 0XFF65BDAC,
                  textSize: 30,
                  callBack: numClick,
                ),
              ],
            ),
            // ignore: todo
            // TODO: 4 5 6 -
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new CalcButton(
                  text: "4",
                  callBack: numClick,
                ),
                new CalcButton(
                  text: "5",
                  callBack: numClick,
                ),
                new CalcButton(
                  text: "6",
                  callBack: numClick,
                ),
                new CalcButton(
                  text: "-",
                  callBack: numClick,
                  backgroundColor: 0xFFFFFFFF,
                  colorText: 0XFF65BDAC,
                  textSize: 38,
                ),
              ],
            ),
            // ignore: todo
            // TODO: 1 2 3 +
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new CalcButton(
                  text: "1",
                  callBack: numClick,
                ),
                new CalcButton(
                  text: "2",
                  callBack: numClick,
                ),
                new CalcButton(
                  text: "3",
                  callBack: numClick,
                ),
                new CalcButton(
                  text: "+",
                  backgroundColor: 0xFFFFFFFF,
                  colorText: 0XFF65BDAC,
                  textSize: 30,
                  callBack: numClick,
                ),
              ],
            ),
            // ignore: todo
            // TODO: . 0 00 =
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new CalcButton(
                  text: ".",
                  callBack: numClick,
                ),
                new CalcButton(
                  text: "0",
                  callBack: numClick,
                ),
                new CalcButton(
                  text: "00",
                  callBack: numClick,
                ),
                new CalcButton(
                  text: "=",
                  callBack: evaluate,
                  backgroundColor: 0xFFFFFFFF,
                  colorText: 0XFF65BDAC,
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
