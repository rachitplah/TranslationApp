import 'package:flutter/material.dart';
class profileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        title: Text('Edit Translation'),
      ),
      body: Material(
        child: ListView(
          children: <Widget>[
            
            Padding(
              padding: EdgeInsets.all(20.0),
              child: 
              Center(
                child: Icon(Icons.person,
                         size:80.0,
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.only(left:10.0,right:10.0,bottom: 10.0,top:30.0),
              child:
            TextField(
              style: TextStyle(color: Colors.white),
              onSubmitted: (String userInput) {
              },
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                ),
              ),
            ),
            ),
            Padding(
              padding: EdgeInsets.only(left:10.0,right:10.0,bottom: 10.0,top:30.0),
              child:
            TextField(
              style: TextStyle(color: Colors.white),
              onSubmitted: (String userInput) {
              },
              decoration: InputDecoration(
                labelText: 'Living Area',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                ),
              ),
            ),
            ),
            Padding(
              padding: EdgeInsets.only(left:10.0,right:10.0,bottom: 10.0,top:30.0),
              child:
            TextField(
              style: TextStyle(color: Colors.white),
              onSubmitted: (String userInput) {
              },
              decoration: InputDecoration(
                labelText: 'Language Profeciency',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                ),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }  
}