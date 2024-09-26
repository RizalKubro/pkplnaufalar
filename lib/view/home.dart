import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mppl_prak/view/bottom_navigator_bar.dart';
import 'package:mppl_prak/widgets/items_widgets.dart';
import 'package:mppl_prak/view/kripik.dart';
import 'package:mppl_prak/view/lauk.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Icon(
                        FontAwesomeIcons.user,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.notifications,
                        color: Color(0xFFFF26767),
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5, bottom: 70),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 175,
                          width: 380,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFEBB7),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 30, left: 20),
                                    child: Text(
                                      "CemalCemil",
                                      style: GoogleFonts.merriweather(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Snack ",
                                                style: GoogleFonts.archivoBlack(
                                                  color: Colors.red[600],
                                                  fontSize: 18,
                                                ),
                                              ),
                                              TextSpan(
                                                text: "and ",
                                                style: GoogleFonts.archivoBlack(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              TextSpan(
                                                text: "Shake",
                                                style: GoogleFonts.archivoBlack(
                                                  color: Colors.red[600],
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          height: 40,
                                          width: 180,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFF26767),
                                            borderRadius:
                                                BorderRadius.circular(35),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.locationDot,
                                                color: Colors.white,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: 2, left: 2, bottom: 2),
                                                child: Text(
                                                  "Location On",
                                                  style:
                                                      GoogleFonts.merriweather(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 0,
                                right: 10,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 25, left: 700, bottom: 80),
                                  child: Transform.rotate(
                                    angle: -0.3,
                                    child: Image.asset(
                                      'images/logo2.png',
                                      height: 120,
                                      width: 120,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Category",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigasi ke halaman keripik
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Kripik()),
                            );
                          },
                          child: Container(
                            height: 60,
                            width: 190,
                            decoration: BoxDecoration(
                              color: Color(0xFFFF26767),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/kripik.png",
                                  width: 80,
                                  height: 60,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 2, bottom: 2, right: 8),
                                  child: Text(
                                    "Keripik",
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 2),
                        InkWell(
                            onTap: () {
                              // Navigasi ke halaman keripik
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => lauk()),
                              );
                            },
                            child: Container(
                              height: 60,
                              width: 190,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 212, 205, 205),
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "images/lauk.png",
                                    width: 60,
                                    height: 60,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 2, bottom: 2, right: 8),
                                    child: Text(
                                      "Lauk",
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Populer this week",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Text(
                                  "View All",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFFFB800)),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 15),
                                child: FaIcon(
                                  FontAwesomeIcons.squareArrowUpRight,
                                  size: 20,
                                  color: Color(0xFFFFB800),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ItemWidget(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
