import 'package:day_8_starter/reusableCard.dart';
import 'package:flutter/material.dart';

class Height extends StatefulWidget {
  @override

    _HeightState createState() => _HeightState();
}

const TextStyle kLabelNumberStyle =
    TextStyle(fontSize: 42, fontWeight: FontWeight.bold);
const TextStyle kLabelTextStyle = TextStyle(
    fontSize: 24,
    letterSpacing: 1,
    color: Colors.grey,
    fontWeight: FontWeight.bold);

class _HeightState extends State<Height> {
  Color activeTextColor = Colors.white;
  Color inactiveTextColor = Colors.white70;
  int weight = 68;
  double heightValue = 110;
  int age = 25;
  double bmi;
  @override
  Widget build(BuildContext context) {
    bmi = weight / ((heightValue / 100 * heightValue / 100));
            return ReusableCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        "${heightValue.toInt()}",
                        style: kLabelNumberStyle,
                      ),
                      Text(
                        "cm",
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      thumbColor: Colors.pink,
                      activeTrackColor: activeTextColor,
                      inactiveTrackColor: inactiveTextColor,
                    ),
                    child: Slider(
                      min: 110,
                      max: 210,
                      value: heightValue,
                      onChanged: (newHeightValue) {
                        setState(() {
                          heightValue = newHeightValue;
                        });
                      },
                    ),
                  )
                ],
              ),
            );
          
  }
}