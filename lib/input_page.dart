import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: new ReusableCard(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.mars, size: 96,),
                        SizedBox(height: 8,),
                        Text("MALE", style: TextStyle(
                          fontSize: 24
                        ),)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: new ReusableCard(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.venus, size: 96,),
                        SizedBox(height: 8,),
                        Text("FEMALE", style: TextStyle(
                            fontSize: 24
                        ),)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: new ReusableCard(),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: new ReusableCard(),
                ),
                Expanded(
                  child: new ReusableCard(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  ReusableCard({this.color = const Color(0xFF1D1F31), this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF1D1F31),
        borderRadius: BorderRadius.all(Radius.circular(12),),),
      child: child,
    );
  }
}