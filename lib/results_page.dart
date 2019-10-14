import 'package:flutter/material.dart';
import 'reusableCard.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {
  double bmi;
  ResultPage(this.bmi);

  String BmiCategory, category, range, note;
  Color color;

  @override
  Widget build(BuildContext context) {
    if (bmi < 18.5) {
      BmiCategory = "UNDERWEIGHT";
      category = "Underweight";
      range = '0 - 18.5';
      note = "Increase Your Diet, Take More Protein and do some exercise.";
      color = Colors.red;

    } else if (bmi < 24.9) {
      BmiCategory = "NORMAL";
      category = "Normal";
      range = "18.5 - 24.9";
      note = "Your BMI is normal, keep it up.";
      color = Colors.green;
    } else  {
      BmiCategory = "OVERWEIGHT";
      category = "Overweight";
      range = "24.9 - ";
      note = "Do exercise, prepare a diet plan.";
      color = Colors.red;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULT'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8, bottom: 8),
                child: Text(
                  'Your Result',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              )),
          Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8, bottom: 8),
                child: ReusableCard(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Text(
                                '$BmiCategory',
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: color),
                              ))),
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Text(
                                '${bmi.toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontSize: 80, fontWeight: FontWeight.bold),
                              ))),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            '$category BMI range:',
                            style: TextStyle(
                                color: Color(0xFF8D909C), fontSize: 24),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Center(
                              child: Text(
                                '$range kg/m2',
                                style: TextStyle(fontSize: 24),
                              ))),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                                  '$note',
                                  style: TextStyle(fontSize: 24),
                                  textAlign: TextAlign.center,
                                )),
                          )),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 40.0, right: 40, bottom: 16),
                            child: ReusableCard(
                              color: Color(0xFF111328),
                              child: Center(
                                  child: Text(
                                    'SAVE RESULT',
                                    style: TextStyle(fontSize: 16,),
                                  )),
                            ),
                          ))
                    ],
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: FlatButton(
                child: Text(
                  'CALCULATE YOUR BMI AGAIN',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => InputPage()));
                },
                color: Color(0xFFD93559),
              ))
        ],
      ),
    );
  }
}