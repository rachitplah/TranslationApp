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
                        child:dropDown(), 
                    ),
               ),
              // Expanded(
                 //child: 
                 Center(
                        child: swapButton(),
                 ),
               //),
               Expanded(
                 child: Center(
                        child: dropDown(),
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
class swapButtonImage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('assests/icons/swap_horiz.png');
    Image image = Image(image: assetImage);
    return Container(child: image,);
  }
             
}
class swapButton extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: RaisedButton(
        child: swapButtonImage(),
        color: Colors.blue[400],
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
    // TODO: implement createState
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
    return Container(
              child: DropdownButton<String>(
                     items:_languages.map((String dropDownStringItem) {
                       return DropdownMenuItem<String>(
                           value: dropDownStringItem,
                           child: Text(dropDownStringItem),
                       );
                     }).toList(),
                     onChanged: (String newValueSelected){
                       _onDropDownItemSelected(newValueSelected);
                       
                     },
                     value: _currentItemSelected,
            ),
       );
  }
  void _onDropDownItemSelected(String newValueSelected)
  {
       setState(() {
                        this._currentItemSelected=newValueSelected; 
    });
  }
}
