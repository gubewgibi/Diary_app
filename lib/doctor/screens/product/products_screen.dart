import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:diaryappp/doctor/constants.dart';

import 'components/body.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: kPrimaryColor,
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(0xFFC7B8F5),
      centerTitle: true,
      title: Text('Psychiatrist',
        style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white) ,),

    );
  }
}
