import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class frontpage extends StatefulWidget {
  const frontpage({Key? key}) : super(key: key);

  @override
  State<frontpage> createState() => _frontpageState();
}

class _frontpageState extends State<frontpage> {
  var dribbleuri =
      'https://dribbble.com/shots/16364210-Piqobe-Social-Media-App/attachments/9140466?mode=media';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xfffef9f1),
            Color(0xfffff2f1),
            Color(0xffffffff),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 100,
            right: 20,
            left: 20,
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Best Social Media App \nTo Make New Friend',
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                'Find People with The Same Interest\n As You',
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 18,
                  //fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 360,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/front.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: (() {}),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Center(
                    child: Text(
                      'Log In',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 18,
                        //fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: (() {}),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xfff8a622),
                          Color(0xfff8323f),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 18,
                        //fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
