import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mppl_prak/SignUp.dart';
import 'package:mppl_prak/view/home.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}


class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
    void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUp()),
      );
    });
  }
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.only(top: 30, bottom: 70),
        decoration: BoxDecoration(
          color: Color(0xFFFFE0B2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "CEMALCEMIL",
              style: GoogleFonts.concertOne(color: Colors.black, fontSize: 60),
            ),
            SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              Text(
                "Snack",
                style: GoogleFonts.archivoBlack(color: Colors.red[600], fontSize: 35),
              ),
              SizedBox(width: 4,),
              Text(
                "and",
                style: GoogleFonts.archivoBlack(color: Colors.black, fontSize: 35),
              ),
              SizedBox(width: 4,),
              Text(
                "Shake",
                style: GoogleFonts.archivoBlack(color: Colors.red[600], fontSize: 35),
              ),
            ],
          ),
          SizedBox(height: 70,),
          Center(
            child: Image.asset("images/LOGO.png",width: 300, height: 300,),
          ) // Spasi antara teks
          ],
        ),
      ),
    );
  }
}
