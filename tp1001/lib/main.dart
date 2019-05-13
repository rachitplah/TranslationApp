// Copyright 2019 REPA Authors. All rights reserved.
// Use of this source code is governed by REPA developers license DEV1MA that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:tp1001/mainScreen.dart';
import 'package:tp1001/loginScreen.dart';

/// The function that is called when main.dart is run.
void main()=>runApp(tp101App());
var useId=null;
/// This widget is the root of our application.
/*
class tp101App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return tp101AppState();
  }
}
class tp101AppState extends State<tp101App>{
*/
class tp101App extends StatelessWidget{
  var aa;
  @override
  Widget build(BuildContext context) {
      loginCheck();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Abhivadin',
      routes: <String,WidgetBuilder>
      {
        '/screen1':(BuildContext context)=>LoginScreen1(),
        '/screen2':(BuildContext context)=>mScreen(),
      },
      home: aa,
    );
  }
  void loginCheck()
  {
     if(useId==null)
     aa=LoginScreen1();
     else
     aa=mScreen();
  }
}