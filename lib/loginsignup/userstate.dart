import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialbuddy/dimensions/mobilescreen.dart';
import 'package:socialbuddy/dimensions/responceui.dart';
import 'package:socialbuddy/dimensions/webscreen.dart';
import 'package:socialbuddy/loginsignup/login.dart';

class Userstate extends StatelessWidget {
  const Userstate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, usersnapshot) {
          if (usersnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else if (usersnapshot.hasData) {
            return ResponsiveUi(
              mobileScreeenlayout: MobileScreen(),
              webScreeenlayout: WebScreen(),
            );
          } else if (usersnapshot.hasError) {
            return Center(
              child: Text('Some Error'),
            );
          } else
            return LoginUi();
        },
      ),
    );
  }
}
