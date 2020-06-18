import 'package:flutter/material.dart';
import 'package:diaryappp/doctor/constants.dart';
import 'package:diaryappp/doctor/screens/product/products_screen.dart';


void main() {
  runApp(DoctoePage());
}

class DoctoePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture app',
      theme: ThemeData(
        // We set Poppins as our default font
      ),
      home: ProductsScreen(),
    );
  }
}
