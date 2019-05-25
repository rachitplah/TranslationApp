import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tp1001/models/data.dart';
import 'package:tp1001/utils/database_helper.dart';
import 'package:tp1001/loginScreen.dart';
import 'package:tp1001/editScreen.dart';
import 'package:tp1001/profileScreen.dart';
import 'package:tp1001/api.dart';
import 'package:translator/translator.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tp1001/utils/firebase_helper1.dart';
var l1,l2;
var emoti,exists=0;
String results="";
var resu,resu2;
class mScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return mScreenState();
  }
}
class mScreenState extends State<mScreen> with AutomaticKeepAliveClientMixin{
  
 TextEditingController inputTController=TextEditingController();
  //var l1,l2;
  String useId=null;
  DataModel data;
  DatabaseHelper helper=DatabaseHelper();
  //String
  void loginId(BuildContext context)async{
     useId=await Navigator.push(context,MaterialPageRoute(builder: (context) {
       return LoginScreen1();
     }));
  }
  void checkUseId()
  async{ 
    if(useId==null)
     {await(loginId(context));
      setState(() {});
     }
  }
  void editS(BuildContext context) async{
    await Navigator.push(context,MaterialPageRoute(builder: (context) {
       return editScreen();
     }));
  }
  @override
  bool get wantKeepAlive=>true;

  @override
  Widget build(BuildContext context)
   {
    //checkUseId();
    return DefaultTabController(
      length: 3,
    child: Scaffold(
      appBar: AppBar(
        title: Text("abhivadin"),
        actions: <Widget>[
          Padding(
           padding: EdgeInsets.only(right: 10.0,top: 10.0),
           child: //Icon(Icons.translate),
           Text(
                    "𑀅𑀪𑀺𑀯𑀸𑀤𑀺𑀦𑁆",
                    style: TextStyle(
                        fontSize: 30.0,),),
          ),
        ],
        bottom: TabBar(
          tabs: <Widget>[
            Tab(child: Text('Translate'),),
            Tab(child: Text('Community'),),
            Tab(child: Text('Profile'),),
          ],
          indicatorColor: Colors.white,
        ),
        ),
      body: 
      TabBarView(
        children:[
      Material(
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
              onTap:() {checkUseId();},
              onSubmitted: (String userInput) async{
                   print(userInput);
                   print(l1);
                     print(l2);
                  convert1(userInput,l1,l2,context,data);
                   //print('This is $results');

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
                      
                    Container(
                      margin: EdgeInsets.only(left: 10.0,top: 30.0,right: 10.0,bottom: 10.0),
                      child:
                    resu=resultList(),
                    height: 150.0,
                    //width: 100.0,
                    ),
                    Padding(
                   padding: EdgeInsets.only(left:20,right:20),
                   child:
                   Container(
                     child: RaisedButton(
                               child: 
                               Padding(
                                 padding: EdgeInsets.only(left: 70.0,right: 10.0),
                                 child:
                               Row(
                                 children: <Widget>[
                                    Text(
                                         "Write a translation",
                                        style: TextStyle(color: Colors.white,
                                               fontSize: 20.0,
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0,right: 10.0),
                                    ),
                                    Icon(Icons.edit,
                                        color: Colors.white,
                                    ),
                                 ],
                               ),   
                               ),                           
                              color: Colors.blue[400],
                              padding: EdgeInsets.all(0),
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(5.0)),
                              onPressed: (){
                                editS(context);
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
      ),
      resu2=resultList2(),
      profileScreen(),
        ],
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
  Future<String> convert1(String input,String l1, String l2,BuildContext context,DataModel data) async{
                   resu2.updateListView();
                   await resu.updateListView2(input,l1,l2);
                   if(exists==0)
                     {
                   GoogleTranslator translator =GoogleTranslator();
                   //translator.translate(input, from: 'en', to: 'ru').then((s)
                   //{
                    // print(s);
                   //});
                   var translation = await translator.translate(input, from: l1, to: l2);
                   print(translation);
                  //resu=resultList(firstWidget: Text(translation));
                  data=DataModel(input,l1,translation,l2,emoti,0,useId);
                 // dd=data;
                 int result;
                  result=await helper.insertData(data);
                 await FirebaseDemoScreen().createRecord(data.id,input,l1,translation,l2,emoti,0,useId);
                 if(result!=0)
                  print('Translation saved successfully');
                  //_save(context,data,input,l1,l2);
                  await resu.updateListView2(input,l1,l2);
                  return 
                  translation;
                     }
                     else
                     return 'false';
                  }
 /* void _save(BuildContext context,DataModel data,String i,String iC,String oC) async{
    int result;
    result=await helper.insertData(data);
    if(result!=0){
      print('Translation saved successfully');
      resu2.updateListView();
    } else{
      print('Translation not saved succesfully');
    }
    resu.updateListView2(i,iC,oC);
    //exists=0;
    }*/
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
                       _setEmo(_currentItemSelected);
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
                       _setEmo(_currentItemSelected);
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
  void _setEmo(var val)
  {
     emoti=val;
  }  
}

class resultList extends StatefulWidget{
  var rr;
  @override
  State<StatefulWidget> createState() {
    return rr=resultListState();
  }
  void updateListView2(String i,String iC,String oC)
  {
    if(rr!=null)
    rr.updateListView2(i,iC,oC);
  }
  void updateListView()
  {
    if(rr!=null)
    rr.updateListView();
  }
}
class resultListState extends State<resultList> with AutomaticKeepAliveClientMixin{
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<DataModel> dataList;
  int count=0;
  @override
  bool get wantKeepAlive=>true;
  @override
  Widget build(BuildContext context) {
    if (dataList==null){
      dataList=List<DataModel>();
     // updateListView(1);
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
                  leading: GestureDetector(
                       child:Icon(Icons.arrow_upward),
                      onTap:(){
                        _increaseRating(1,this.dataList[position]);
                      }
                    ),
                  title: Text(this.dataList[position].output),
                  trailing: GestureDetector(
                      child:Icon(Icons.arrow_downward),
                      onTap:(){
                        _increaseRating(0,this.dataList[position]);
                      }
                    ),
                  onTap: (){
                    debugPrint("List Tapped");
                  }
                ),
            );
          },
      );
  }
  /*
  void _delete(BuildContext context,DataModel data) async{
    int result=await databaseHelper.deleteData(data.id);
    if(result!=0){
    _showSnackBar(context,'Note Deleted Successfully');
    // TODO update list view.
    //updateListView(1);
    }
  }
  void _showSnackBar(BuildContext context, String  message){
    final snackBar = SnackBar(content: Text(message),);
    Scaffold.of(context).showSnackBar(snackBar);
  }
  */
  void _increaseRating(int i,DataModel data)
  { 
    if(i==1)
      data.rating=data.rating+1;
    else
      data.rating=data.rating-1;
      databaseHelper.updateData(data);
  }
  void updateListView2(String i,String iC,String oC){
    final Future<Database> dbFuture= databaseHelper.initializeDatabase();
    dbFuture.then((database){
        Future<List<DataModel>> dataListFuture = databaseHelper.getDataList2(i,iC,oC);
        dataListFuture.then((dataList){
            setState(() {
              this.dataList=dataList;
              this.count=dataList.length;
              if(dataList.length>0)
              exists=1;
              else
              exists=0;
            });
        });
    });
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
class resultList2 extends StatefulWidget{
  var rr;
  @override
  State<StatefulWidget> createState() {
    return rr=resultListState2();
  }
  void updateListView2(String i,String iC,String oC)
  {
    if(rr!=null)
    rr.updateListView2(i,iC,oC);
  }
  void updateListView()
  {
    if(rr!=null)
    rr.updateListView();
  }
}
class resultListState2 extends State<resultList2> with AutomaticKeepAliveClientMixin{
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<DataModel> dataList;
  int count=0;
  @override
  bool get wantKeepAlive=>true;
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
                  leading: GestureDetector(
                       child:Icon(Icons.arrow_upward),
                      onTap:(){
                        _increaseRating(1,this.dataList[position]);
                      }
                    ),
                  title: 
                  Row(
                      children: <Widget>[
                            Expanded(
                               child: Text(this.dataList[position].input),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.0,right: 5.0,top: 10.0,bottom: 10.0),
                              child: Icon(Icons.arrow_right,
                                     size:35.0,),
                            ),
                            Expanded(
                              child:    Text(this.dataList[position].output),
                            )
                      ],
                  ),
                  subtitle: Row(
                      children: <Widget>[
                            Text(this.dataList[position].iCode+'->'+this.dataList[position].oCode),
                            Padding(
                              padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 10.0),
                            ),
                            Text(this.dataList[position].emotion),
                      ],
                  ),
                  trailing: GestureDetector(
                      child:Icon(Icons.edit),
                      onTap:(){
                        editS(context);
                      }
                    ),
                  onTap: (){
                    debugPrint("List Tapped");
                  }
                ),
            );
          },
      );
  }
  void editS(BuildContext context) async{
    await Navigator.push(context,MaterialPageRoute(builder: (context) {
       return editScreen();
     }));
  }
  void _increaseRating(int i,DataModel data)
  { 
    if(i==1)
      data.rating=data.rating+1;
    else
      data.rating=data.rating-1;
      databaseHelper.updateData(data);
  }
  void updateListView2(String i,String iC,String oC){
    final Future<Database> dbFuture= databaseHelper.initializeDatabase();
    dbFuture.then((database){
        Future<List<DataModel>> dataListFuture = databaseHelper.getDataList2(i,iC,oC);
        dataListFuture.then((dataList){
            setState(() {
              this.dataList=dataList;
              this.count=dataList.length;
              if(dataList.length>0)
              exists=1;
              else
              exists=0;
            });
        });
    });
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