import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'constants.dart';
import 'details_screen.dart';
import 'category_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:diaryappp/ui/addpage.dart';
import '../vdoCallPage.dart';
import 'package:diaryappp/ui/viewPage.dart';
import 'package:diaryappp/doctor/main.dart';
import 'package:diaryappp/Yoka/yokaPage.dart';
import 'package:diaryappp/monk/monkPage.dart';



class RelaxPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditation App',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                    ),
                  ),
                  Text(
                    "Now Let's ReLax",
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 100,),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Diet Recommendation",
                          svgSrc: "assets/icons/Hamburger.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Meditate",
                          svgSrc: "assets/icons/Meditation.svg",
                         press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return MonkPage();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Broadcast Meditation",
                          svgSrc: "assets/icons/yoga.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Yoga Meditation",
                          svgSrc: "assets/icons/Excrecises.svg",
                          press: () {
                           Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) {
                           return YokaPage();
                           }
                           ),
                           );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
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
        backgroundColor: Color(0xFFF2BEA1),


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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VdoPage()),
                  );
                },
              ),
              IconButton(
                icon: Image.asset("assets/images/doctor.png"),
                iconSize: 40,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DoctoePage()),
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

