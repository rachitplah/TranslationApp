import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
class FirebaseDemoScreen extends StatelessWidget {

  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    //getData();
    return null;}
    /*
    Scaffold(
        appBar: AppBar(
            title: Text('Firebase Connect'),
            ),
        body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  RaisedButton(
                      child: Text('Create Record'),
                      onPressed: () {
                        createRecord();
                      },
                  ),

                  RaisedButton(
                      child: Text('View Record'),
                      onPressed: () {
                        getData();
                      },
                  ),
                  RaisedButton(
                      child: Text('Udate Record'),
                      onPressed: () {
                        updateData();
                      },
                  ),
                  RaisedButton(
                      child: Text('Delete Record'),
                      onPressed: () {
                        deleteData();
                      },
                  ),
                ],
            )
        ), //center
    );
  }
  */
  void createRecord(var id, var input,var iCode, var output, var oCode, var emotion, var rating,var userId){
    databaseReference.child(id).set({
      'id': id,
      'iCode': iCode,
      'oCode':oCode,
      'input': input,
      'output': output,
      'emotion': emotion,
      'rating': rating,
      'userId': userId
    });
  }
  void getData(){
    databaseReference.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }

  void updateData(){
    databaseReference.child('1').update({
      'description': 'J2EE complete Reference'
    });
  }

  void deleteData(){
    databaseReference.child('1').remove();
  }
}