import 'package:flutter/material.dart';
import 'package:diaryappp/ui/viewPage.dart';
import 'package:diaryappp/Quiz/pages/landing_page.dart';

class choosePage extends StatelessWidget {
  final List<Color> tileColors = [
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.indigo,
    Colors.lightBlue,
    Colors.amber,
    Colors.deepOrange,
    Colors.red,
    Colors.brown,
    Color(0xFFC7B8F5)
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Color(0xFFC7B8F5),
        appBar: AppBar(
          backgroundColor:  Color(0xFFC7B8F5),
          elevation: 0.0,
          centerTitle: true,
          title: Text('Doctor TEA',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {},
          ),
        ),
        body: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 100, left: 50),
              child: Column(
                children: <Widget>[

                  IconButton(
                    icon: Image.asset("assets/images/list.png"),
                    iconSize: 150,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LandingPage()),
                      );
                    },
                  ),
                  Text(
                    "Check Your Depression",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),

                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 370, left: 50),
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: Image.asset("assets/images/diary.png"),
                    iconSize: 150,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    },
                  ),
                  Text(
                    "If you check already click this botton",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),

                  ),

                ],
              ),
            )


          ],

        )
    );
  }

}