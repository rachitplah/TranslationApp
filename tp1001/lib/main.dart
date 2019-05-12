// Copyright 2019 REPA Authors. All rights reserved.
// Use of this source code is governed by REPA developers license DEV1MA that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:tp1001/mainScreen.dart';
import 'package:tp1001/loginScreen.dart';

/// The function that is called when main.dart is run.
void main()=>runApp(tp101App());

/// This widget is the root of our application.
class tp101App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Abhivadin',
      home: LoginScreen1(),
    );
  }
}