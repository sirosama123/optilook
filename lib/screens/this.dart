import 'package:cupertino_rounded_corners/cupertino_rounded_corners.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedCupertinoCard extends StatefulWidget {
  @override
  _AnimatedCupertinoCardState createState() => _AnimatedCupertinoCardState();
}

class _AnimatedCupertinoCardState extends State<AnimatedCupertinoCard> {
  bool _isCardOpen = false;
  double _cardHeight = 100.0;

  void _toggleCard() {
    setState(() {
      _isCardOpen = !_isCardOpen;
      _cardHeight = _isCardOpen ? 300.0 : 100.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Cupertino Card'),
      ),
      body: GestureDetector(
        onTap: _toggleCard,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          height: _cardHeight,
          child: CupertinoCard(
            splashColor: Colors.green,
            child: Container(
              constraints: BoxConstraints.expand(
                height: _cardHeight,
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: const Text(
                  'This is a button',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 0.2, 0.8, 1.0],
                colors: [
                  Color.fromRGBO(240, 40, 180, 1.0),
                  Color.fromRGBO(220, 40, 200, 1.0),
                  Color.fromRGBO(200, 40, 220, 1.0),
                  Color.fromRGBO(180, 40, 240, 1.0),
                ],
              ),
            ),
            elevation: 2.0,
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.all(0.0),
            radius: BorderRadius.all(
              new Radius.circular(40.0),
            ),
            onPressed: () {
              print("Clicked");
            },
          ),
        ),
      ),
    );
  }
}




