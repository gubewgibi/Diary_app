import 'dart:async';
import 'package:flutter/material.dart';
import 'loderPage.dart';
import 'choosePage.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();

}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 6),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
      return choosePage();
    })));
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFC7B8F5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              child: Image.asset('assets/images/Logo.png'),
              
            ),
          ),
          SizedBox(height: 0,),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Container(
            ),
          ),
          Loading(
            radius: 30.0,
            dotRadius: 15.0,
          )
        ],),
    );
  }
}