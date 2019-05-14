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
        child: 
        Column(
          children: <Widget>[
Padding(
              padding: EdgeInsets.only(left:10.0,right:10.0,bottom: 10.0,top:30.0),
              child:
            TextField(
              style: TextStyle(color: Colors.blue[400]),
              onSubmitted: (String userInput) {
                         //moveToLastScreen(context);
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
            Padding(
                   padding: EdgeInsets.only(top:30,left:20,right:20),
                   child:
                   Container(
                     child: RaisedButton(
                               child: 
                                    Text(
                                         "SAVE",
                                        style: TextStyle(color: Colors.white),
                                      ),                          
                              color: Colors.blue[400],
                              padding: EdgeInsets.all(0),
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(5.0)),
                              onPressed: (){
                                moveToLastScreen(context);
                              },
                           ),
                      // width: 50.0,
                       height: 50.0,
                   ),
                 ),
          ],
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