import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:core';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DicesWidget(),
    );
  }
}

class DicesWidget extends StatefulWidget {
  @override
  State<DicesWidget> createState() => _DicesWidgetState();
}

class _DicesWidgetState extends State<DicesWidget> {
  Random r = Random(DateTime.now().millisecondsSinceEpoch);

  int _leftRoll = 1;
  int _rightRoll = 1;

  int getNextRoll()
  {
    return r.nextInt(6) + 1;
  }

  _DicesWidgetState()
  {
    _leftRoll = getNextRoll();
    _rightRoll = getNextRoll();
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        setState(() {
          _leftRoll = getNextRoll();
          _rightRoll = getNextRoll();
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Image.asset('images/dice$_leftRoll.png'),
            ),
          ),
          Expanded(
            flex: 1,
            child:  Container(
              padding: EdgeInsets.all(16),
              child: Image.asset('images/dice$_rightRoll.png'),
            ),
          ),
        ],
      ),
    );
  }
}