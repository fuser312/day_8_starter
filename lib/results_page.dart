import 'package:flutter/material.dart';
import 'reusableCard.dart';
import 'package:share/share.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {
  double bmi;

  BuildContext context;
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
      color = Colors.red[200];

    } else if (bmi < 24.9) {
      BmiCategory = "NORMAL";
      category = "Normal";
      range = "18.5 - 24.9";
      note = "Your BMI is normal, keep it up.";
      color = Colors.green;
    } else if (bmi < 35 && bmi > 24.9){
      BmiCategory = "OVERWEIGHT";
      category = "Overweight";
      range = "24.9 - 35";
      note = "Do exercise, prepare a diet plan.";
      color = Colors.red[200];
    }

    else if(bmi > 35){
      BmiCategory = "Severely Obese";
      category = "Severely Obese";
      range = "Over 35";
      note = "Please see a doctor immediately.";
      color = Colors.red;
    }

     if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return portrait();
    } else {
      return landscape();
    }
  }

    
    Widget portrait(){
    return Scaffold(
      appBar: AppBar(
        title: Text('Your BMI RESULT'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
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
                      shareResult(2, 24)
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
                Navigator.pop(context);
                },
                color: Color(0xFFD93559),
              ))
        ],
      ),
    );
    }
    Widget landscape(){
    return Scaffold(
      appBar: AppBar(
        title: Text('Your BMI RESULT'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          
          Expanded(
              flex: 15,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16, top: 4, bottom: 4),
                child: ReusableCard(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Text(
                                '$BmiCategory',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: color),
                              ))),
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Text(
                                '${bmi.toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.bold),
                              ))),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            '$category BMI range:',
                            style: TextStyle(
                                color: Color(0xFF8D909C), fontSize: 16),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Center(
                              child: Text(
                                '$range kg/m2',
                                style: TextStyle(fontSize: 16),
                              ))),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                                  '$note',
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                )),
                          )),
                      shareResult(3, 16)
                    ],
                  ),
                ),
              )),
          Expanded(
              flex: 2,
              child: FlatButton(
                child: Text(
                  'CALCULATE YOUR BMI AGAIN',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                   Navigator.pop(context);
                },
                color: Color(0xFFD93559),
              ))
        ],
      ),
    );
    }

    Expanded shareResult(int flexNum, double fontSizeNum) {
      return Expanded(
            flex: flexNum,
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40, bottom: 16),
              child: InkWell(
                child: RaisedButton(
                  color: Color(0xFF111328),
                  onPressed: ()=> Share.share("$BmiCategory  ${bmi.toStringAsFixed(2)}  $category BMI range $range kg/m2 $note"),
                  child: Text(
                    "Share Result", style: TextStyle(fontSize: fontSizeNum),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ));
}

  }
  
