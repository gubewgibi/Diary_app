import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class MyInfoPage extends StatefulWidget {
  final DocumentSnapshot ds;
  MyInfoPage({this.ds});
  @override
  _MyInfoPageState createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {
  String productImage;
  String id;
  String name;
  String recipe;
  String date;
  String emoji;
  final db = Firestore.instance;


  TextEditingController nameInputController;
  TextEditingController recipeInputController;
  TextEditingController dateInputController;
  TextEditingController emojiInputController;

  Future getPost() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("colrecipes").getDocuments();
    return qn.documents;

  }

  @override
  void initState() {
    super.initState();
    recipeInputController =
    new TextEditingController(text: widget.ds.data["recipe"]);
    emojiInputController =
    new TextEditingController(text: widget.ds.data["emoji"]);
    dateInputController =
    new TextEditingController(text: widget.ds.data["date"]);
    nameInputController =
    new TextEditingController(text: widget.ds.data["name"]);
    productImage = widget.ds.data["image"];
    print(productImage);

  }
  void deleteData(DocumentSnapshot doc) async {
    await db.collection('colrecipes').document(doc.documentID).delete();
    setState(() => id = null);
  }



  @override
  Widget build(BuildContext context) {
    getPost();
    return Scaffold(
      appBar: AppBar(
        title: Text('Information Page'),
        backgroundColor: Color(0xFFC7B8F5),

      ),
      body: Container(
        color: Color(0xFFC7B8F5),
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 35),
                      child: Container(
                        height: 300.0,
                        width: 300.0,
                        decoration: new BoxDecoration(
                            border: new Border.all(color: Colors.blueAccent)),
                        padding: new EdgeInsets.all(5.0),
                        child: productImage == ''
                            ? Text('Edit')
                            : Image.network(productImage + '?alt=media'),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: new TextFormField(
                            controller: nameInputController ,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25
                            ),
                            validator: (value) {
                              if (value.isEmpty) return "Ingresa un nombre";
                            },

                          ),
                        ),



                      ],
                    ),
                  ),
                ),


                new ListTile(

                  title: new TextFormField(
                    maxLines: 10,
                    controller: recipeInputController,
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa un nombre";
                    },

                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: TextField(
                    controller: dateInputController,

                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}




class IconoMenu extends StatelessWidget {
  IconoMenu({this.icon, this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          new Text(
            label,
            style: new TextStyle(fontSize: 12.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}
