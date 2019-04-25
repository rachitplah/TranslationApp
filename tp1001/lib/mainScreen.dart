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
          padding: EdgeInsets.only(top:30.0),
          color: Colors.lightBlueAccent,
          child: Center(
            child: Column(
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
                        dropDown(), 
               ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left:10.0,right:10.0,bottom: 10.0,top:30.0),
              child:
            TextField(
              style: TextStyle(color: Colors.white),
              onChanged: null,
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
              mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.end,
               children: <Widget>[
                 Padding(
                   padding: EdgeInsets.only(top:30),
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
               ],
            ),
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
    var alertDialog= AlertDialog(
            //title: Text("Languages swapped!!"),
            content: Text("Swapped Successfully!"),
    );
    showDialog(
            context: context,
            builder: (BuildContext context) => alertDialog
    );
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
  var _languages=['Arabic','Chinese(Simplified)','Chinese(Traditional)','Czech','Danish','Dutch','English','Finnish','French',
                   'German','Hebrew','Indonesian','Italian','Japanese','Korean','Polish','Portuguese','Russian','Spanish','Swedish','Turkish'];
  var _currentItemSelected = 'English';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
             // Expanded(
               // child: 
              DropdownButton<String>(
                     items:_languages.map((String dropDownStringItem) {
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
class dropDown3 extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return _dropDownState();
  }
}
class _dropDownState3 extends State<dropDown>
{
  var _languages=['😃 Grinning Face With Big Eyes','😆 Grinning Squinting Face','😅 Grinning Face With Sweat','🤣 Rolling on the Floor Laughing',
                  '😂 Face With Tears of Joy','🙂 Slightly Smiling Face','😍 Smiling Face With Heart-Eyes','😘 Face Blowing a Kiss',
                   '🤩 Star-Struck','😐 Neutral Face','😑 Expressionless Face','😶 Face Without Mouth','🙄 Face With Rolling Eyes',
                   '😋 Face Savoring Food','😔 Pensive Face','😟 Worried Face','😮 Face With Open Mouth','😨 Fearful Face',
                   '😢 Crying Face','😠 Angry Face'];
  var _currentItemSelected = '🙂 Slightly Smiling Face';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
             // Expanded(
               // child: 
              DropdownButton<String>(
                     items:_languages.map((String dropDownStringItem) {
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