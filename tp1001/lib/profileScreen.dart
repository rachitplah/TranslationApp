import 'package:flutter/material.dart';
class profileScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return profileScreenState();
  }
}
class profileScreenState extends State<profileScreen> with AutomaticKeepAliveClientMixin{
  static var aa1,aa2,aa3;
  var a1=Padding(
              padding: EdgeInsets.only(left:10.0,right:10.0,bottom: 10.0,top:30.0),
              child:
            TextField(
              style: TextStyle(color: Colors.blue[400]),
              onSubmitted: (String userInput) {
                aa1=userInput;
              },
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.blue[400]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                ),
              ),
            ),
            );
  var a2=Padding(
              padding: EdgeInsets.only(left:10.0,right:10.0,bottom: 10.0,top:30.0),
              child:
            TextField(
              style: TextStyle(color: Colors.blue[400]),
              onSubmitted: (String userInput) {
                                aa2=userInput;
              },
              decoration: InputDecoration(
                labelText: 'Living Area',
                labelStyle: TextStyle(color: Colors.blue[400]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                ),
              ),
            ),
            );
  var a3=Padding(
              padding: EdgeInsets.only(left:10.0,right:10.0,bottom: 10.0,top:30.0),
              child:
            TextField(
              style: TextStyle(color: Colors.blue[400]),
              onSubmitted: (String userInput) {
                  aa3=userInput;
              },
              decoration: InputDecoration(
                labelText: 'Language Profeciency',
                labelStyle: TextStyle(color: Colors.blue[400]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                ),
              ),
            ),
            );
  @override
  bool get wantKeepAlive=>true;
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
             a1,
            a2,
            a3,
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
                                /*
                              setState(() {
                                a1=
                               Paddind(
                                 padding:EdgeInsets.only(left:10.0,right:10.0,bottom: 10.0,top:30.0),
                                 child:
                                Container(                             
                             decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(5.0),
                         color: Colors.lightBlueAccent,
                         border: Border.all(
                                color: Colors.blue[400],
                                width: 2.0,
                                style: BorderStyle.solid,
                         ),
                         
                       ),
                       
                       width: 266.0,
                       height: 30.0,
                             child:
                             
                           Text(aa1,
                             style: TextStyle(color: Colors.white,fontSize: 19.0,),
                             textAlign: TextAlign.center,
                        ),
                        ),
                           );
                           a2=
                               Paddind(
                                 padding:EdgeInsets.only(left:10.0,right:10.0,bottom: 10.0,top:30.0),
                                 child:
                                Container(                             
                             decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(5.0),
                         color: Colors.lightBlueAccent,
                         border: Border.all(
                                color: Colors.blue[400],
                                width: 2.0,
                                style: BorderStyle.solid,
                         ),
                         
                       ),
                       
                       width: 266.0,
                       height: 30.0,
                             child:
                             
                           Text(aa2,
                             style: TextStyle(color: Colors.white,fontSize: 19.0,),
                             textAlign: TextAlign.center,
                        ),
                        ),
                           );
                           a3=
                               Paddind(
                                 padding:EdgeInsets.only(left:10.0,right:10.0,bottom: 10.0,top:30.0),
                                 child:
                                Container(                             
                             decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(5.0),
                         color: Colors.lightBlueAccent,
                         border: Border.all(
                                color: Colors.blue[400],
                                width: 2.0,
                                style: BorderStyle.solid,
                         ),
                         
                       ),
                       
                       width: 266.0,
                       height: 30.0,
                             child:
                             
                           Text(aa3,
                             style: TextStyle(color: Colors.white,fontSize: 19.0,),
                             textAlign: TextAlign.center,
                        ),
                        ),
                           );
                              
                              });*/
                               
                               _showSnackBar(context, 'CHANGES SAVED');
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
  void _showSnackBar(BuildContext context, String  message){
    final snackBar = SnackBar(content: Text(message),);
    Scaffold.of(context).showSnackBar(snackBar);
  }
}