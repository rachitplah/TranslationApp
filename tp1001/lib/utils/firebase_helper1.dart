import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tp1001/models/data.dart';
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
  void createRecord(String id, var input,var iCode, var output, var oCode, var emotion, var rating,var userId){
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
  }*/
  void createRecord(String id, var input,var iCode, var output, var oCode, var emotion, var rating,var userId){
    databaseReference.child('iCode').child(iCode).child('oCode').child(oCode).child('emotion').child(emotion).child('input').child(input).child('output').child(output).set({
      'rating': rating,
      'userId': userId
    });
  }
  //Future<List<DataModel>> getData(String input,String iCode, String oCode, String emotion) async{
  DataModel getData(String input,String iCode, String oCode, String emotion) {
    var  output,userId;
    int ratin;
    print('hnfhnhgnhgmhjjh,jmhj');
     databaseReference.child("iCode").child(iCode).child('oCode').child(oCode).child('emotion').child(emotion).child('input').child(input).child('output').once().then((DataSnapshot snapshot) {
      output=snapshot.value;
      print('Data : $output');
    });
   databaseReference.child("iCode").child(iCode).child('oCode').child(oCode).child('emotion').child(emotion).child('input').child(input).child('output').child(output).child('rating').once().then((DataSnapshot snapshot) {
      ratin=snapshot.value as int;
      print('Data : $ratin');
    });
    databaseReference.child('iCode').child(iCode).child('oCode').child(oCode).child('emotion').child(emotion).child('input').child(input).child('output').child(output).child('userId').once().then((DataSnapshot snapshot) {
      userId=snapshot.value;
      print('Data : $userId');
    });/*
    databaseReference.child(aaa).child('oCode').once().then((DataSnapshot snapshot) {
      oCode=snapshot.value;
      print('Data : $oCode');
    });
    databaseReference.child(aaa).child('emotion').once().then((DataSnapshot snapshot) {
      emotion=snapshot.value;
      print('Data : $emotion');
    });
    databaseReference.child(aaa).child('rating').once().then((DataSnapshot snapshot) {
      rating=snapshot.value;
      print('Data : $rating');
    });
    databaseReference.child(aaa).child('userId').once().then((DataSnapshot snapshot) {
      userId=snapshot.value;
      print('Data : $userId');
    });*/
    //var rating =(ratin as int);
    DataModel dd=DataModel(input, iCode, output, oCode, emotion,ratin,userId);
    //List<DataModel> dl;
    //dl[0]=dd;
    //return (dl as Future<List<DataModel>>);
    return dd;
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