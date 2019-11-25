import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableCard.dart';

class GenderCard extends StatefulWidget {
  
  @override
  _GenderCardState createState() => _GenderCardState();
}

enum Gender { male, female }
const TextStyle kLabelNumberStyle =
    TextStyle(fontSize: 42, fontWeight: FontWeight.bold);
const TextStyle kLabelTextStyle = TextStyle(fontSize: 24,letterSpacing: 1,color: Colors.grey,fontWeight: FontWeight.bold);

class _GenderCardState extends State<GenderCard> {
  Gender gender;
  Color inactiveCardColor = Color(0xFF1D1F31);
  Color activeCardColor = Color(0xFF111328);
  Color activeTextColor = Colors.white;
  Color inactiveTextColor = Colors.white70;
  @override
  Widget build(BuildContext context) {
                return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                Expanded(
                  flex: 2,
                  child: ReusableCard(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.mars, size: 100),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'MALE',
                          style: TextStyle(
                              fontSize: 24,
                              color: gender == Gender.male
                                  ? activeTextColor
                                  : inactiveTextColor),
                        )
                      ],
                    ),
                    color: gender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
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
                          style: TextStyle(
                              fontSize: 24,
                              color: gender == Gender.female
                                  ? activeTextColor
                                  : inactiveTextColor),
                        )
                      ],
                    ),
                    color: gender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    tapCallback: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                  ),
                )
              ],
            );
  }
}
