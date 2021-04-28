import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyHomePage(title: 'hommework',),
    ),
  );
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  Matter createState() => Matter();




}

class Matter extends State<MyHomePage>{
  String output = '0';
  final List <String> operators = <String>['+','-','*','/'];
  double getFontSize() {
    int step = (output.length / 4).floor() + 1;
    return (144 / step);
  }

  void appendDigit( String digit){
    if( output!='0' || digit !='0'){
      if (output =='0'){
        setState(() {
          output = digit;
        });
      }else{
        setState((){
          output += digit;
        });
      }
    }

  }
  void appendOperator( String operator) {
    evaluate();
    if (operators.contains(output[output.length - 1])) {
      setState(() {

        output=output;

      });
    } else {
      setState(() {
        output += operator;
      });
    }
  }
  void evaluate(){
    operators.forEach((operator) {
      int index = output.indexOf(operator);
      if (index != -1){
        try {
          String op1string = output.substring(0, index);
          String op2string = output.substring(index + 1);

          double op1 = double.parse(op1string);
          double op2 = double.parse(op2string);

          switch (operator) {
            case '+':
              output = (op1 + op2).toString();
              break;
            case '-':
              output = (op1 - op2).toString();
              break;

            case '*':
              output = (op1 * op2).toString();
              break;
            case '/' :
              output = (op1 / op2).toString();
              break;
          }
          setState(() {

          });
        }catch(ex){
          debugPrint(ex.toString());
          setState(() {
            output ='INVALID';
          });

        }
      }

    });
  }
    void clear() {
      setState(() {
        output ='0';
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              child: Text(output,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .merge(TextStyle(fontSize: getFontSize()))),
            ),
          ),
          Table(
            children: [
              TableRow(children: [
                CustomButton(
                  text: "1",
                  onTap: () {appendDigit('1');},
                ),
                CustomButton(
                  text: '2',
                  onTap: () {appendDigit('2');},
                ),
                CustomButton(
                  text: '3',
                  onTap: () {appendDigit('3');},
                ),
                CustomButton(
                  text: '+',
                  onTap: () {appendOperator('+');},
                  color: Colors.orange,
                )
              ]),
              TableRow(children: [
                CustomButton(text: '4', onTap: () {appendDigit('4');}),
                CustomButton(text: '5', onTap: () {appendDigit('5');}),
                CustomButton(text: '6', onTap: () {appendDigit('6');}),
                CustomButton(
                  text: '-',
                  onTap: () {appendOperator('-');},
                  color: Colors.orange,
                )
              ]),
              TableRow(children: [
                CustomButton(
                  text: '7',
                  onTap: () {appendDigit('7');},
                ),
                CustomButton(
                  text: '8',
                  onTap: () {appendDigit('8');},
                ),
                CustomButton(
                  text: '9',
                  onTap: () {appendDigit('9');},
                ),
                CustomButton(
                  text: '*',
                  onTap: () {appendOperator('*');},
                  color: Colors.orange,
                )
              ]),
              TableRow(children: [
                CustomButton(
                  text: 'C',
                  onTap: () {clear();},
                  color: Colors.red,
                ),
                CustomButton(
                  text: '0',
                  onTap: () {appendDigit('0');},
                ),
                CustomButton(
                  text: '=',
                  onTap: () {evaluate();},
                  color: Colors.green,
                ),
                CustomButton(
                  text: '/',
                  onTap: () {appendOperator('/');},
                  color: Colors.orange,
                )
              ])
            ],
          )
        ],
      ),
    );
  }

  
}

class CustomButton extends StatelessWidget {
  CustomButton({Key key, @required this.text, @required this.onTap, this.color})
      : super(key: key);

  final text;
  final onTap;
  final color;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: InkWell(
        onTap: onTap,
        child: Center(
            child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline4
              .merge(TextStyle(color: color)),
        )),
      ),
    );
  }
}
