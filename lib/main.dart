import 'package:flutter/material.dart';
import 'splash/splashPage.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mega Hd Filmes',
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

