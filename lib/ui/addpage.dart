import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';//formateo hora

File image;
String filename;

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Add Page',
      theme: new ThemeData(
        primarySwatch: Colors.black,
      ),
      home: new MyAddPage(),
    );
  }
}

class CommonThings {
  static Size size;
}

class MyAddPage extends StatefulWidget {
  @override
  _MyAddPageState createState() => _MyAddPageState();
}

class _MyAddPageState extends State<MyAddPage> {
  TextEditingController recipeInputController;
  TextEditingController nameInputController;
  TextEditingController imageInputController;
  TextEditingController emojiInputController;

  String id;
  final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  String name;
  String recipe;
  String emoji;

  pickerCam() async {
    // ignore: deprecated_member_use
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    if (img != null) {
      image = img;
      setState(() {});
    }
  }

  pickerGallery() async {
    // ignore: deprecated_member_use
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = img;
      setState(() {});
    }
  }
  DateTime _dueDate = new DateTime.now();
  String _dateText = "";
  Future<Null> _selectDueDate(BuildContext context) async {
    final picked = await showDatePicker(context: context, initialDate: _dueDate, firstDate: DateTime(2020), lastDate: DateTime(2100));
    if(picked != null){
      setState(() {
        _dueDate=picked;
        _dateText =  "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }
  @override
  void initState(){
    super.initState();
    _dateText =  "${_dueDate.day}/${_dueDate.month}/${_dueDate.year}";
  }

  Widget divider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        width: 0.8,
        color: Colors.black,
      ),
    );
  }

  void createData() async {
    DateTime now = DateTime.now();
    String nuevoformato = DateFormat('kk:mm:ss:MMMMd').format(now);
    var fullImageName = 'nomfoto-$nuevoformato' + '.jpg';
    var fullImageName2 = 'nomfoto-$nuevoformato' + '.jpg';
    final StorageReference ref =
    FirebaseStorage.instance.ref().child(fullImageName);
    final StorageUploadTask task = ref.putFile(image);

    var part1 = 'https://firebasestorage.googleapis.com/v0/b/dbdiary-6c0fd.appspot.com/o/';

    var fullPathImage = part1 + fullImageName2;
    print(fullPathImage);

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      DocumentReference ref = await db.collection('colrecipes').add(
          {'name': '$name', 'recipe': '$recipe', 'image': '$fullPathImage' , 'date': "$_dueDate" , 'emoji': "$emoji"});
      setState(() => id = ref.documentID);
      Navigator.of(context).pop(); //regrese a la pantalla anterior
    }
  }

  @override
  Widget build(BuildContext context) {

    CommonThings.size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 234, 208, 1),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[

              Container(
                height: 100,
                decoration: BoxDecoration(
                    color:  Color.fromRGBO(255, 234, 208, 1),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25)
                    )
                ),
              ),
              SizedBox(height: 50,),
              Padding(
                padding: EdgeInsets.only(top: 40 , left: 20),
                child: Text(
                    "WRITE ME WHAT YOU WANT",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,

                  ),
                ),
              ),
            ],

          ),
          SizedBox(height: 30,),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    new Container(
                      height: 150.0,
                      width: 150.0,

                      decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.black),
                      ),
                      padding: new EdgeInsets.all(5.0),
                      child: image == null ? Text('Add') : Image.file(image),
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 150),
                          child: Row(
                            children: <Widget>[
                              new IconButton(
                                icon: new Icon(Icons.camera_alt), onPressed: pickerCam , color:  Colors.black,),
                              new IconButton(
                                icon: new Icon(Icons.image), onPressed: pickerGallery ,color:  Colors.black,),
                            ],
                          ),
                        )
                      ],
                    )

                  ],
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      border: InputBorder.none,
                      icon: Icon(Icons.insert_emoticon,color: Colors.black,),
                      hintText: 'Emoji of this Story',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                    onSaved: (value) => emoji = value,
                  ),
                ),
                Row(
                  children: <Widget>[
                    new Expanded(child: Text("Today", style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold,
                    ),),),
                    new FlatButton(
                      onPressed: ()=>_selectDueDate(context),
                      child: Text(_dateText, style: TextStyle(
                        color: Colors.black,
                      ),),
                    )

                  ],
                ),

                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      border: InputBorder.none,
                      hintText: 'Topic',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                    onSaved: (value) => name = value,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  child: TextFormField(
                    maxLines: 10,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      border: InputBorder.none,
                      hintText: 'Story',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some recipe';
                      }
                    },
                    onSaved: (value) => recipe = value,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('Back', style: TextStyle(color: Colors.black)),
                color: Colors.white,
              ),
              RaisedButton(
                onPressed: createData,
                child: Text('Create', style: TextStyle(color: Colors.white)),
                  color: Colors.black,
              ),

            ],)
        ],
      ),

    );
  }
}