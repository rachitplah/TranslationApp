import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tp1001/models/dataModel.dart';
import 'package:tp1001/utils/database_helper.dart';
import 'package:tp1001/api.dart';
import 'package:translator/translator.dart';
import 'package:sqflite/sqflite.dart';
var l1,l2;
String results="";
var resu;
class mScreen extends StatelessWidget
{ TextEditingController inputTController=TextEditingController();
  //var l1,l2;
  DataModel data;
  DatabaseHelper helper=DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Abhivadin"),),
      body: Material(
        child: Container(
          padding: EdgeInsets.only(top:30.0),
          color: Colors.lightBlueAccent,
          child: Center(
            child: ListView(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                   child:
                  dropDown(), 
                    ),
              //Expanded(
               // child: 
                   swapButton(),
                // ),
               Expanded(
                      child: 
                        dropDown2(), 
               ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left:10.0,right:10.0,bottom: 10.0,top:30.0),
              child:
            TextField(
              style: TextStyle(color: Colors.white),
              onSubmitted: (String userInput) async{
                   print(userInput);
                   print(l1);
                     print(l2);
                  results=await (convert1(userInput,l1,l2,context) as String);
                   print('This is $results');

                  // resultListState().changeResult(res);
                   
              },
              controller: inputTController,
              decoration: InputDecoration(
                labelText: 'Enter text here',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                ),
              ),
            ),
            ),
            Row(
              //mainAxisSize: MainAxisSize.min,
             // mainAxisAlignment: MainAxisAlignment.end,
               children: <Widget>[
                 Padding(
                   padding: EdgeInsets.only(top:30,left:10),
                   child:
                   Container(
                     child: RaisedButton(
                               child: Icon(Icons.mic,color: Colors.white,),
                              color: Colors.blue[400],
                              padding: EdgeInsets.all(0),
                              elevation: 10.0,
                              shape: CircleBorder(),
                              onPressed: ()=>micInp(context)
                           ),
                       width: 50.0,
                       height: 50.0,
                   ),
                 ),
                // Expanded(
                  // child: 
                   dropDown3(),
                 //),
               ],
            ),
            Container(
                             margin: EdgeInsets.only(left: 10.0,top: 30.0,right: 10.0),
                             
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
                             
                           Text(
                             "Suggested Translations:",
                             style: TextStyle(color: Colors.white,fontSize: 19.0,),
                             textAlign: TextAlign.center,
                        ),
                           ),
                    //resu=resultList(firstWidget: Text("Hello")),
                    resu=resultList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void micInp(BuildContext context)
  {
    var alertDialog= AlertDialog(
            //title: Text("Languages swapped!!"),
            content: Text("Listening now!"),
    );
    showDialog(
            context: context,
            builder: (BuildContext context) => alertDialog
    );
  }
  Future<String> convert1(String input,String l1, String l2,BuildContext context) async{
                   GoogleTranslator translator =GoogleTranslator();
                   //translator.translate(input, from: 'en', to: 'ru').then((s)
                   //{
                    // print(s);
                   //});
                   var translation = await translator.translate(input, from: l1, to: l2);
                   print(translation);
                  // results=translation as String;
                  //resu=resultList(firstWidget: Text(translation));
                  // resu.changeResult1(translation);
                  _save(context);
                  return 
                  translation;
                  }
  void _save(BuildContext context) async{
    int result;
    //Navigator.pop(false);
    if(data.id!=null){
      result=await helper.updateData(data);
    } else{
      result=await helper.insertData(data);
    }
    if(result!=0){
      _showSnackBar(context,'Translation saved successfully');
    } else{
      _showSnackBar(context,'Translation not saved');
    }
    resu.updateListView();
  }
  void _showSnackBar(BuildContext context, String  message){
    final snackBar = SnackBar(content: Text(message),);
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
class swapButtonImage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('assests/icons/swap_horiz.png');
    Image image = Image(image: assetImage, height: 19.0,width: 19.0,);
    return Container(child: image,);
  }        
}
class swapButton extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: swapButtonImage(),
        color: Colors.blue[400],
        padding: EdgeInsets.all(0),
        elevation: 6.0,
        shape: CircleBorder(),
        onPressed: ()=>swapLan(context)
      ),
    );
  }

  void swapLan(BuildContext context)
  {
    var snackBar=SnackBar(
        content: Text("Swapped Successfuly"),
        action: SnackBarAction(
          label: "UNDO",
          onPressed: (){
            debugPrint("Dummy undo");
          },
        ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
  
}
class dropDown extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _dropDownState();
  }
}
class _dropDownState extends State<dropDown>
{
  var _languages=['Arabic','Bengali','Chinese Simplified','Chinese Traditional','Czech','English','Finnish','French','Gujarati',
                   'German','Hindi','Indonesian','Italian','Japanese','Korean','Portuguese','Russian','Spanish','Turkish','Urdu'];
  var _currentItemSelected = 'English';
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
             // Expanded(
               // child: 
              DropdownButton<String>(
                     items:_languages.map((String dropDownStringItem) {
                       _setFun(_currentItemSelected);
                       return DropdownMenuItem<String>(
                           value: dropDownStringItem,
                           
                           child:
                           Padding(
                             padding: EdgeInsets.only(left: 10.0),
                             child:
                           Container(
                             decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(5.0),
                         color: Colors.blue[400],
                       ),
                       
                       width: 102.0,
                             child:
                           Text(
                             dropDownStringItem,
                             style: TextStyle(color: Colors.white,fontSize: 20.0,),
                             textAlign: TextAlign.center,
                        ),
                           ),
                           ),
                       );
                     }).toList(),
                     onChanged: (String newValueSelected){
                       _onDropDownItemSelected(newValueSelected);
                       _setFun(_currentItemSelected);
                      // mScreen.l1=_currentItemSelected;
                     },
                     value: _currentItemSelected,
                     //mScreen.l1=_currentItemSelected;
            );       
      // );
  }
  void _onDropDownItemSelected(String newValueSelected)
  {
       setState(() {
                        this._currentItemSelected=newValueSelected; 
    });
  }
  void _setFun(var val)
  {
  var lanG=['Arabic','Bengali','Chinese Simplified','Chinese Traditional','Czech','English','Finnish','French','Gujarati',
                   'German','Hindi','Indonesian','Italian','Japanese','Korean','Portuguese','Russian','Spanish','Turkish','Urdu'];
  var lanC=['ar','bn','zh-CN','zh-TW','cs','en','fi','fr','gu','de','hi','id','it','ja','ko','pt','ru','es','tr','ur'];
  for(int i=0;i<lanG.length;i++)
  {
      if(val==lanG[i])
      {
        l1=lanC[i];
        break;
      }
  }
  }
}
class dropDown2 extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _dropDownState2();
  }
}
class _dropDownState2 extends State<dropDown2>
{
  var _languages=['Arabic','Bengali','Chinese Simplified','Chinese Traditional','Czech','English','Finnish','French','Gujarati',
                   'German','Hindi','Indonesian','Italian','Japanese','Korean','Portuguese','Russian','Spanish','Turkish','Urdu'];
  var _currentItemSelected = 'English';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
             // Expanded(
               // child: 
              DropdownButton<String>(
                     items:_languages.map((String dropDownStringItem) {
                       _setFun(_currentItemSelected);
                       return DropdownMenuItem<String>(
                           value: dropDownStringItem,
                           
                           child:
                           Padding(
                             padding: EdgeInsets.only(left: 10.0),
                             child:
                           Container(
                             decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(5.0),
                         color: Colors.blue[400],
                       ),
                       
                       width: 102.0,
                             child:
                           Text(
                             dropDownStringItem,
                             style: TextStyle(color: Colors.white,fontSize: 20.0,),
                             textAlign: TextAlign.center,
                        ),
                           ),
                           ),
                       );
                     }).toList(),
                     onChanged: (String newValueSelected){
                       _onDropDownItemSelected(newValueSelected);
                       _setFun(_currentItemSelected);
                     },
                     value: _currentItemSelected,
                     
            );       
      // );
  }
  void _onDropDownItemSelected(String newValueSelected)
  {
       setState(() {
                        this._currentItemSelected=newValueSelected; 
    });
  }
  void _setFun(var val)
  {
  var lanG=['Arabic','Bengali','Chinese Simplified','Chinese Traditional','Czech','English','Finnish','French','Gujarati',
                   'German','Hindi','Indonesian','Italian','Japanese','Korean','Portuguese','Russian','Spanish','Turkish','Urdu'];
  var lanC=['ar','bn','zh-CN','zh-TW','cs','en','fi','fr','gu','de','hi','id','it','ja','ko','pt','ru','es','tr','ur'];
  for(int i=0;i<lanG.length;i++)
  {
      if(val==lanG[i])
      {
        l2=lanC[i];
        break;
      }
  }
  }
}
class dropDown3 extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _dropDownState3();
  }
}
class _dropDownState3 extends State<dropDown3>
{
  var _languages=['😃 Grinning Face With Big Eyes','😆 Grinning Squinting Face','😅 Grinning Face With Sweat',
                  '😂 Face With Tears of Joy','🙂 Slightly Smiling Face','😍 Smiling Face & Heart-Eyes','😘 Face Blowing a Kiss',
                   '🤩 Star-Struck','😐 Neutral Face','😑 Expressionless Face','😶 Face Without Mouth','🙄 Face With Rolling Eyes',
                   '😋 Face Savoring Food','😔 Pensive Face','😟 Worried Face','😮 Face With Open Mouth','😨 Fearful Face',
                   '😢 Crying Face','😠 Angry Face'];
  var _currentItemSelected = '🙂 Slightly Smiling Face';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
              DropdownButton<String>(
                     items:_languages.map((String dropDownStringItem) {
                       return DropdownMenuItem<String>(
                           value: dropDownStringItem,
                           child:
                          // Padding(
                            // padding: EdgeInsets.only(left: 10.0,top: 0.0),
                             //child:
                           Container(
                             margin: EdgeInsets.only(left: 10.0,top: 5.0),
                             decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(5.0),
                         color: Colors.blue[400],
                       ),
                       
                       width: 266.0,
                       height: 25.0,
                             child:
                           Text(
                             dropDownStringItem,
                             style: TextStyle(color: Colors.white,fontSize: 19.0,),
                             textAlign: TextAlign.center,
                        ),
                           ),
                          // ),
                       );
                     }).toList(),
                     onChanged: (String newValueSelected){
                       _onDropDownItemSelected(newValueSelected);
                       
                     },
                     value: _currentItemSelected,
                     
            );       
      // );
  }
  void _onDropDownItemSelected(String newValueSelected)
  {
       setState(() {
                        this._currentItemSelected=newValueSelected; 
    });
  }
}

class resultList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return resultListState();
  }
}
class resultListState extends State<resultList>{
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<DataModel> dataList;
  int count=0;
  @override
  Widget build(BuildContext context) {
    if (dataList==null){
      dataList=List<DataModel>();
      updateListView();
    }
    return getListView();
  }
    ListView getListView(){
      return
       ListView.builder(
          itemCount: count,
          itemBuilder: (BuildContext context,int position){
            return Card(
                color: Colors.white,
                elevation: 8.0,
                child: ListTile(
                  leading: Icon(Icons.chevron_right),
                  title: Text(this.dataList[position].output),
                  trailing: GestureDetector(
                      child:Icon(Icons.arrow_upward),
                      onTap:(){}
                  ),
                  onTap: (){
                    debugPrint("List Tapped");
                  }
                ),
            );
          },
      );
  }
  void _delete(BuildContext context,DataModel data) async{
    int result=await databaseHelper.deleteData(data.id);
    if(result!=0){
    _showSnackBar(context,'Note Deleted Successfully');
    // TODO update list view.
    updateListView();
    }
  }
  void _showSnackBar(BuildContext context, String  message){
    final snackBar = SnackBar(content: Text(message),);
    Scaffold.of(context).showSnackBar(snackBar);
  }
  void updateListView(){
    final Future<Database> dbFuture= databaseHelper.initializeDatabase();
    dbFuture.then((database){
        Future<List<DataModel>> dataListFuture = databaseHelper.getDataList();
        dataListFuture.then((dataList){
            setState(() {
              this.dataList=dataList;
              this.count=dataList.length;
            });
        });
    });
  }
}

/*
class resultList extends StatefulWidget{
  resultList({this.firstWidget});
  final Widget firstWidget;
  @override
  State<StatefulWidget> createState() {
    return resultListState();
  }
 // void changeResult1(State<resultList>,String result)
 // {
 //     resultListState().changeResult(context,result);
 // }
}
class resultListState extends State<resultList>{
  String res="See results here";
  @override
  Widget build(BuildContext context) {
    return Container (
                      height: 100.0,
                        child: 
                           ListView(
                             children: <Widget>[
                                ListTile(                               
                                leading: Icon(Icons.chevron_right),
                                title: widget.firstWidget,
                                //Text(res),
                                trailing: GestureDetector(
                                     child:Icon(Icons.arrow_upward),
                                onTap:(){}
                                 ),
                                ),
                               ],
                           ),
                    );
  }
  //String 
  void changeResult(String result)
  {
       setState(() {
                        this.res=results; 
    });
    //return res;
  }
}
*/