// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// You can read about packages here: https://flutter.io/using-packages/
import 'package:flutter/material.dart';

// You can use a relative import, i.e. `import 'category.dart;'` or
// a package import, as shown below.
// More details at http://dart-lang.github.io/linter/lints/avoid_relative_lib_imports.html
import 'package:tp1001/mainScreen.dart';


/// The function that is called when main.dart is run.
void main()=>runApp(tp101App());

/// This widget is the root of our application.
/// Currently, we just show one widget in our app.
class tp101App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Abhivadin',
      home: Scaffold(
        appBar: AppBar(title: Text("Abhivadin"),),
        body: mScreen()
      )
    );
  }
}