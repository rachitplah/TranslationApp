import 'package:flutter/material.dart';
class mScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Abhivadin"),),
      body: Material(
        child: Container(
          padding: EdgeInsets.only(left:10.0,top:20.0,right:10.0),
          color: Colors.lightBlueAccent,
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
              children: <Widget>[
               Expanded(
                 child: Center(
                        child: Text(
                               "1st dDown",
                                textDirection: TextDirection.ltr,
                                style: TextStyle(color: Colors.white, fontSize:25.0),
                        ),
                    )
               ),
               Expanded(
                 child: Center(
                        child: Text(
                               "2nd dDown",
                                textDirection: TextDirection.ltr,
                                style: TextStyle(color: Colors.white, fontSize:25.0),
                        ),
                    ),    
               ),
              ],
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
