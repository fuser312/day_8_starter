import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableCard.dart';
import 'button.dart';
import 'results_page.dart';
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender{
  male, female
}

const TextStyle kLabelNumberStyle =  TextStyle(fontSize: 42, fontWeight: FontWeight.bold);
const TextStyle kLabelTextStyle = TextStyle(fontSize: 24, letterSpacing: 1, color: Colors.grey, fontWeight: FontWeight.bold);

class _InputPageState extends State<InputPage> {
  Gender gender;
  Color inactiveCardColor =  Color(0xFF1D1F31);
  Color activeCardColor =  Color(0xFF111328);
  Color activeTextColor = Colors.white;
  Color inactiveTextColor = Colors.white70;
  double heightValue = 110;
  int weight = 68;
  int age = 25;
  double bmi;
  @override
  Widget build(BuildContext context) {
  bmi = weight/((heightValue/100 * heightValue/100));
  
  if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return portrait();
    } else {
      return landscape();
    }
  }

    Widget portrait(){
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: ReusableCard(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mars,
                          size : 100
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'MALE',
                          style: TextStyle(fontSize: 24, color: gender == Gender.male ? activeTextColor : inactiveTextColor),
                        )
                      ],
                    ),
                    color: gender == Gender.male ? activeCardColor : inactiveCardColor,
                    tapCallback: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ReusableCard(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 100,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'FEMALE',
                          style: TextStyle(fontSize: 24, color: gender == Gender.female ? activeTextColor : inactiveTextColor),
                        )
                      ],
                    ),
                    color: gender == Gender.female ? activeCardColor : inactiveCardColor,
                    tapCallback: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: ReusableCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text("HEIGHT", style: TextStyle(fontSize: 20),textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text("${heightValue.toInt()}", style: kLabelNumberStyle,
                      ),
                      Text("cm", style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(thumbColor: Colors.pink,
                      activeTrackColor: activeTextColor,
                      inactiveTrackColor: inactiveTextColor,

                    ),
                    child: Slider(
                      min: 110,
                      max: 210,
                      value: heightValue,
                      onChanged: (newHeightValue){
                        setState(() {
                          heightValue = newHeightValue;
                        });
                      },

                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("WEIGHT", style: kLabelTextStyle,),
                        Text("$weight", style: kLabelNumberStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                             Button(
                               icon: Icon(Icons.remove, size: 32,),
                               callback: (){
                                 setState(() {
                                   weight--;
                                 });
                               },
                             ),
                            Button(
                              icon: Icon(Icons.add, size: 32,),
                              callback: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ReusableCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("AGE", style: kLabelTextStyle,),
                          Text("$age", style: kLabelNumberStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Button(
                                icon: Icon(Icons.remove, size: 32,),
                                callback: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              Button(
                                icon: Icon(Icons.add, size: 32,),
                                callback: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                  ),
                )
              ],
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
              color: Colors.pink,
              width: double.infinity,
              height: 8,
              child: FlatButton(
                onPressed: (){
                Navigator.of(context).push(FadeRouteBuilder(bmi));
                 },
                child: Text(
                  "CALCULATE YOUR BMI",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


    Widget landscape(){
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height*0.50,
            width: MediaQuery.of(context).size.width*0.25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 2,
                      child: ReusableCard(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.mars,
                            size : 100
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'MALE',
                            style: TextStyle(fontSize: 24, color: gender == Gender.male ? activeTextColor : inactiveTextColor),
                          )
                        ],
                      ),
                      color: gender == Gender.male ? activeCardColor : inactiveCardColor,
                      tapCallback: () {
                        setState(() {
                          gender = Gender.male;
                        });
                      },
                    ),
                ),
                  Expanded(
                    flex: 2,
                      child: ReusableCard(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.venus,
                            size: 100,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'FEMALE',
                            style: TextStyle(fontSize: 24, color: gender == Gender.female ? activeTextColor : inactiveTextColor),
                          )
                        ],
                      ),
                      color: gender == Gender.female ? activeCardColor : inactiveCardColor,
                      tapCallback: () {
                        setState(() {
                          gender = Gender.female;
                        });
                      },
                    ),
                  ),

              ],
            ),

          ),
          Container(
            height: MediaQuery.of(context).size.height*0.50,
            width: MediaQuery.of(context).size.width*0.25,
            child: ReusableCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text("HEIGHT", style: TextStyle(fontSize: 20),textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text("${heightValue.toInt()}", style: kLabelNumberStyle,
                      ),
                      Text("cm", style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(thumbColor: Colors.pink,
                      activeTrackColor: activeTextColor,
                      inactiveTrackColor: inactiveTextColor,

                    ),
                    child: Slider(
                      min: 110,
                      max: 210,
                      value: heightValue,
                      onChanged: (newHeightValue){
                        setState(() {
                          heightValue = newHeightValue;
                        });
                      },

                    ),
                  )
                ],
              ),
            ),
          
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.50,
            width: MediaQuery.of(context).size.width*0.25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("WEIGHT", style: kLabelTextStyle,),
                        Text("$weight", style: kLabelNumberStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                             Button(
                               icon: Icon(Icons.remove, size: 32,),
                               callback: (){
                                 setState(() {
                                   weight--;
                                 });
                               },
                             ),
                            Button(
                              icon: Icon(Icons.add, size: 32,),
                              callback: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ),
                Expanded(
                  flex: 2,
                  child: ReusableCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("AGE", style: kLabelTextStyle,),
                          Text("$age", style: kLabelNumberStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Button(
                                icon: Icon(Icons.remove, size: 32,),
                                callback: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              Button(
                                icon: Icon(Icons.add, size: 32,),
                                callback: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                  ),

                ),
              ],
            ),
          ),
          Container(
              color: Colors.pink,
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.15,
              child: FlatButton(
                onPressed: (){
                 Navigator.of(context).push(FadeRouteBuilder(bmi));
                 },
                child: Text(
                  "CALCULATE YOUR BMI",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      )
    );
  }
}

Route FadeRouteBuilder(bmi) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ResultPage(bmi),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
