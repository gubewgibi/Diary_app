
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'addpage.dart';

import 'informationPage.dart';

import 'package:diaryappp/relax/Relax.dart';
import '../SettingPage.dart';





void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'View Page',

      home: new MyHomePage(),
    );
  }
}

class CommonThings {
  static Size size;
}
final pages =[MyHomePage() , RelaxPage() , MyAddPage() ,  settingPage() ];


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController recipeInputController;
  TextEditingController nameInputController;
  String id;
  final db = Firestore.instance;
  //final _formKey = GlobalKey<FormState>();
  String name;
  String recipe;
  String date;
  String emoji;


  //create function for delete one register
  void deleteData(DocumentSnapshot doc) async {
    await db.collection('colrecipes').document(doc.documentID).delete();
    setState(() => id = null);
  }

  //create tha funtion navigateToDetail


  //create tha funtion navigateToDetail
  navigateToInfo(DocumentSnapshot ds) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyInfoPage(
              ds: ds,
            )));
  }



  @override
  Widget build(BuildContext context) {
    CommonThings.size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:Color(0xFFC7B8F5),
      appBar: AppBar(
        backgroundColor:  Color(0xFFC7B8F5),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        title: Text('DEAR DIARY',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection("colrecipes").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

            if (!snapshot.hasData) {
              return Text('"Loading...', style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),);
            }
            int length = snapshot.data.documents.length;
             new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  new Image.asset("assets/images/c6afb20942212299fbb4698bdbf66363.jpg")
                ]
            );
             new Container(

             );

            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, //two columns
                  mainAxisSpacing: 70, //space the card
                  childAspectRatio: 0.8, //space largo de cada card

                ),
                itemCount: length,
                padding: EdgeInsets.all(100.0),
                itemBuilder: (_, int index) {
                  final DocumentSnapshot doc = snapshot.data.documents[index];


                 return new Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3.0,
                                blurRadius: 5.0)
                          ],
                          color: Colors.white),

                      child: Column(children: [

                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 50 ) ,
                        ),

                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 18),
                            ),


                            Center(
                              child: InkWell(
                                onTap: () => navigateToInfo(doc),
                                child: new Container(
                                  child: Image.network(
                                    '${doc.data["image"]}' + '?alt=media',
                                    fit:BoxFit.fill,
                                  ),
                                  width: 180,
                                  height: 120,

                                ),
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: Center(
                            child: ListTile(
                              title: Text(
                                doc.data["name"],
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  color: Colors.black,
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                doc.data["date"],
                                style: TextStyle(
                                    fontFamily: 'Varela',
                                    color: Colors.grey, fontSize: 12.0),
                              ),

                              onTap: () => navigateToInfo(doc),
                            ),
                          ),
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 65.0),
                                child: ListTile(
                                  title: Text(
                                    doc.data["emoji"],
                                    style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Colors.black,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onTap: () => navigateToInfo(doc),
                                ),
                              ),
                            ),
                            Container(
                              child: new Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.redAccent,
                                    ),
                                    onPressed: () => deleteData(doc), //funciona
                                  ),

                                ],
                              ),

                            ),

                          ],
                        ),

                      ],

                      ),

                 );

                }
            );
          }
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyAddPage()),
          );
        },
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Image.asset("assets/images/pencil.png"),
              iconSize: 40,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAddPage()),
                );
              },
            ),
          ],


        ),
        backgroundColor: Color(0xFF817DC0),


      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 15 ,vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Image.asset("assets/images/diary.png"),
                iconSize: 40,
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
              ),
              IconButton(
                icon: Image.asset("assets/images/relax.png"),
                iconSize: 40,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RelaxPage()),
                  );
                },
              ),
              IconButton(
                icon: Image.asset("assets/images/video.png"),
                iconSize: 40,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
              ),
              IconButton(
                icon: Image.asset("assets/images/gear.png"),
                iconSize: 40,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => settingPage()),
                  );
                },
              ),




            ],
          ),
        ),
      ),
    );
  }
}