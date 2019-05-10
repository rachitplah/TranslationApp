class DataModel{
  int _id;
  String _input;
  String _iCode;
  String _output;
  String _oCode;
  String _emotion;
  String _userId;
  int _rating;
  
  //Constructors defined
  DataModel(this._input,this._iCode,this._output,this._oCode,this._rating,this._emotion,[this._userId]);
  DataModel.withId(this._id,this._input,this._iCode,this._output,this._oCode,this._rating,this._emotion,[this._userId]);
  
  //Getters defined
  int get id => _id;
  String get input => _input;
  String get iCode => _iCode;
  String get output => _output;
  String get oCode => _oCode;
  String get emotion => _emotion;
  String get userId => _userId;
  int get rating => _rating;
  
  //Setters defined
  set input(String newInput)
  {
    if(newInput.length<=255){
      this._input=newInput;
    }
  }
  set iCode(String newICode)
  {
    if(newICode.length<=255){
      this._iCode=newICode;
    }
  }
  set output(String newOutput)
  {
      this._output=newOutput;
  }
  set oCode(String newOCode)
  {
    if(newOCode.length<=255){
      this._oCode=newOCode;
    }
  }
  set emotion(String newEmotion)
  {
      this._emotion=newEmotion;
  }
  set userId(String newUserId)
  {
      this._userId=newUserId;
  }
  set rating(int newRating)
  {
      this._rating=newRating;
  }

  //Conversion to MAP Object
  Map<String, dynamic> toMap(){
    var map=Map<String, dynamic>();
    if (id!=null){
  map['id']= _id;
    }
  map['input']= _input;
  map['iCode']= _iCode;
  map['output']= _output;
  map['oCode']= _oCode;
  map['emotion']= _emotion;
  map['userId']= _userId;
  map['rating']= _rating;
  return map;
  }

  //To extract from MAP Object
  DataModel.fromMapObject(Map<String, dynamic> map){
    this._id=map['id'];
    this._input=map['input'];
    this._iCode=map['iCode'];
    this._output=map['output'];
    this._oCode=map['oCode'];
    this._emotion=map['emotion'];
    this._userId=map['userId'];
    this._rating=map['rating'];
  }
}