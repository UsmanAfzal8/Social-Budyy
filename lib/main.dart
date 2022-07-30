import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:socialbuddy/dimensions/mobilescreen.dart';
import 'package:socialbuddy/dimensions/responceui.dart';
import 'package:socialbuddy/dimensions/webscreen.dart';
import 'package:socialbuddy/loginsignup/userstate.dart';
import 'package:socialbuddy/pages/frontpage.dart';

import 'loginsignup/login.dart';
import 'loginsignup/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: 'AIzaSyCLXKxNlLMveFlzHVWwzjrbDRBK0FZXosk',
      appId: 'socialbudyy',
      messagingSenderId: '605140764667',
      projectId: 'socialbudyy',
      storageBucket: "socialbudyy.appspot.com",
    ));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: ResponsiveUi(
      //     mobileScreeenlayout: MobileScreen(), webScreeenlayout: WebScreen()),
      //home: Userstate(),
      initialRoute: '/',
      routes: {
        '/': (context) => Userstate(),
        '/Loginscreen': (context) => LoginUi(),
        '/Signupscreen': (context) => SignupPage(),
      },
    );
  }
}
