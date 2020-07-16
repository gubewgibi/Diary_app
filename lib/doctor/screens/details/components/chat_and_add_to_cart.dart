import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants.dart';
import 'package:diaryappp/doctor/models/product.dart';

class ChatAndAddToCart extends StatelessWidget {
  const ChatAndAddToCart({
    Key key, this.product
  }) : super(key: key);

  void customLunch(command) async{
    if(await canLaunch(command)){
      await launch(command);
    }else{
      print('can not lunch $command');
    }
  }
  final Product product;



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: <Widget>[
          FlatButton.icon(
            onPressed: () {
              customLunch('mailto:gubewgibi@gmail.com?subject=want%20to%20hire%20a%20Psychiatrist%20&body=I%20want%20to%20hire%20a%20Psychiatrist%20');
            },
            icon: Image.asset(
              "assets/images/email.png",
              height: 18,
            ),
            label: Text(
              "Contact us to hire our Psychiatrist",
              style: TextStyle(
                  color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 20,),
          FlatButton.icon(
            onPressed: () {
              customLunch('tel://0806355602');
            },
            icon: Image.asset(
              "assets/images/phone.png",
              height: 18,
            ),
            label: Text(
              "Call to us to hire our Psychiatrist",
              style: TextStyle(
                  color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }
}
