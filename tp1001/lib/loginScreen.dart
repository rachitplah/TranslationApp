import 'package:flutter/material.dart';

class LoginScreen1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginScreen1State();
  }
}
class LoginScreen1State extends State<LoginScreen1>{
  
//class LoginScreen1 extends StatelessWidget{
   var _formKey=GlobalKey<LoginScreen1State>();
   Color primaryColor=Colors.lightBlueAccent;
   Color backgroundColor=Colors.white;
   AssetImage backgroundImage=AssetImage('assests/images/languages.jpg');
   TextEditingController emailTController=TextEditingController();
   TextEditingController passTController=TextEditingController();

/*
  LoginScreen1({
    Key key,
    this.primaryColor, this.backgroundColor, this.backgroundImage
  });
*/
  @override
  Widget build(BuildContext context) {
    return 
    WillPopScope(
     onWillPop: (){
       moveToLastScreen(context);
     },
      child:
    Scaffold(
      body:Material(
      child:Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: this.backgroundColor,
      ),
      child: 
      Form(
        key: _formKey,
        child:
      ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: this.backgroundImage,
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 150.0, bottom: 100.0),
              child: 
              Container(
                             margin: EdgeInsets.only(left: 10.0,top: 30.0,right: 10.0),
                             
                             decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(30.0),
                         color: Colors.white.withOpacity(0.5),
                         //border: Border.all(
                           //     color: Colors.blue[400],
                             //   width: 2.0,
                               // style: BorderStyle.solid,
                         //),
                       ),
                       child:
              Column(
                children: <Widget>[
                  Text(
                    "𑀅𑀪𑀺𑀯𑀸𑀤𑀺𑀦𑁆",
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: this.primaryColor,
                        shadows: [
                             Shadow(
                               offset: Offset(-1.5, -1.5),
                               color: Colors.black
                             ),
                             Shadow(
                               offset: Offset(1.5, -1.5),
                               color: Colors.black
                             ),
                             Shadow(
                               offset: Offset(1.5, 1.5),
                               color: Colors.black
                             ),
                             Shadow(
                               offset: Offset(-1.5, 1.5),
                               color: Colors.black
                             ),
                        ],
                        ),
                  ),
                  Text(
                    "abhivadin",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: this.primaryColor,
                        shadows: [
                             Shadow(
                               offset: Offset(-1.5, -1.5),
                               color: Colors.black
                             ),
                             Shadow(
                               offset: Offset(1.5, -1.5),
                               color: Colors.black
                             ),
                             Shadow(
                               offset: Offset(1.5, 1.5),
                               color: Colors.black
                             ),
                             Shadow(
                               offset: Offset(-1.5, 1.5),
                               color: Colors.black
                             ),
                        ],
                        ),
                  ),
                ],
              ),
              ),
            ),
          ),
          Padding(
            padding:
                  EdgeInsets.only(left:20.0,right:20.0,bottom: 10.0,top:30.0),
            child:
          Row(
              children: <Widget>[
                  Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0),
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: Container(
              //padding: EdgeInsets.only(left:10.0,right:10.0,bottom: 10.0,top:30.0),
              child:
            TextFormField(
              style: TextStyle(color: Colors.grey),
              controller: emailTController,
              validator: (String value){
                if(value.isEmpty){
                  return 'Please enter email address';
                }
              },
              //onSubmitted: (String userInput) {},
              decoration: InputDecoration(
                labelText: 'Enter email here',
                labelStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0)
                ),
              ),
            ),
            ),
                )
              ],
            ),
          ),
          
           Padding(
            padding:
                  EdgeInsets.only(left:20.0,right:20.0,bottom: 10.0,top:20.0),
            child:
          Row(
              children: <Widget>[
                  Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 10.0),
                  child: Icon(
                    Icons.lock_open,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: Container(
              //padding: EdgeInsets.only(left:10.0,right:10.0,bottom: 10.0,top:30.0),
              child:
            TextFormField(
              style: TextStyle(color: Colors.grey),
              //onSubmitted: (String userInput) async{
                   
                  // resultListState().changeResult(res);
                   
              //},
              controller: passTController,
              validator: (String value){
                if(value.isEmpty){
                  return 'Please enter password';
                }
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Enter password here',
                labelStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0)
                ),
              ),
            ),
            ),
                )
              ],
            ),
          ),
          Padding(
                   padding: EdgeInsets.only(top:20,left:20,right:20),
                   child:
                   Container(
                     child: RaisedButton(
                               child: Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white),
                          ),
                              color: Colors.blue[400],
                              padding: EdgeInsets.all(0),
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(30.0)),
                              onPressed: (){
                                //Navigator.of(context).pushReplacementNamed('/screen2');
                                //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => mScreen()));
                               // if(_formKey.currentState) {
                                moveToLastScreen(context);
                                //}                                
                              },
                           ),
                      // width: 50.0,
                       height: 50.0,
                   ),
                 ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20.0),
                      alignment: Alignment.center,
                      child: Text(
                        "DON'T HAVE AN ACCOUNT?",
                        style: TextStyle(color: this.primaryColor),
                      ),
                    ),
                    onPressed: () => {},
                  ),
                ),
              ],
            ),
          ),


        ],
      ),
      ),
      ),
      ),
    ),
    );
  }
  void moveToLastScreen(BuildContext context)
  { String ss=emailTController.text;
    Navigator.pop(context,ss);
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = new Path();
    p.lineTo(size.width, 0.0);
    p.lineTo(size.width, size.height * 0.85);
    p.arcToPoint(
      Offset(0.0, size.height * 0.85),
      radius: const Radius.elliptical(50.0, 10.0),
      rotation: 0.0,
    );
    p.lineTo(0.0, 0.0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}