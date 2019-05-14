import 'package:flutter/material.dart';
class profileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        title: Text('Profile details'),
      ),
      body: Material(
        child: ListView(
          children: <Widget>[
            
            Padding(
              padding: EdgeInsets.only(top:20),
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
              style: TextStyle(color: Colors.blue[400]),
              onSubmitted: (String userInput) {
              },
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.blue[400]),
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
              style: TextStyle(color: Colors.blue[400]),
              onSubmitted: (String userInput) {
              },
              decoration: InputDecoration(
                labelText: 'Living Area',
                labelStyle: TextStyle(color: Colors.blue[400]),
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
              style: TextStyle(color: Colors.blue[400]),
              onSubmitted: (String userInput) {
              },
              decoration: InputDecoration(
                labelText: 'Language Profeciency',
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
                               // editS(context);
                              },
                           ),
                      // width: 50.0,
                       height: 50.0,
                   ),
                 ),
          ],
        ),
      ),
    );
  }  
}