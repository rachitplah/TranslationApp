import 'package:flutter/material.dart';
class editScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return 
    WillPopScope(
     onWillPop: (){
       moveToLastScreen(context);
     },
      child:
    Scaffold(
      appBar: AppBar(
        title: Text('Edit Translation'),
      ),
      body: Material(
        child: Padding(
              padding: EdgeInsets.only(left:10.0,right:10.0,bottom: 10.0,top:30.0),
              child:
            TextField(
              style: TextStyle(color: Colors.blue[400]),
              onSubmitted: (String userInput) {
                         moveToLastScreen(context);
              },
              decoration: InputDecoration(
                labelText: 'Enter translation here',
                labelStyle: TextStyle(color: Colors.blue[400]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                ),
              ),
            ),
            ),
      ),
    ),
    );
  }
  void moveToLastScreen(BuildContext context)
  { 
    Navigator.pop(context);
  }
}