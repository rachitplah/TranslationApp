import 'package:flutter/material.dart';
class mScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
          color: Colors.lightBlueAccent,
          child: Center(
            child: Text(
              "Hi, People",
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.white, fontSize:40.0),
            ),
          ),
        );
  }
}
