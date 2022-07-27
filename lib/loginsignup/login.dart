import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialbuddy/loginsignup/logo.dart';
import 'package:socialbuddy/resources/Auth_method.dart';
import 'package:socialbuddy/widgets/textfield.dart';

import '../utils/imagepicker.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({Key? key}) : super(key: key);

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool _isloading = false;
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  void signinh() async {
    setState(() {
      _isloading = true;
    });
    String res = await AuthMethods().Signin(
        email: _emailcontroller.text, password: _passwordcontroller.text);
    setState(() {
      _isloading = false;
    });
    showSnackBar(context, res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 32, right: 8, left: 8, bottom: 16),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //logo
              Logo(),
              SizedBox(
                height: 25,
              ),
              Text(
                'Login',
                style: GoogleFonts.bebasNeue(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              //Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Textfieldpage(
                  hinttext: 'Enter Email Address',
                  textcontroller: _emailcontroller,
                  texttype: TextInputType.emailAddress,
                  labeltext: 'Email',
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Textfieldpage(
                  hinttext: 'Enter Password',
                  textcontroller: _passwordcontroller,
                  texttype: TextInputType.text,
                  labeltext: 'Password',
                  pass: true,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              //Password
              _isloading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: signinh,
                      child: Text(
                        'Login',
                        style: GoogleFonts.bebasNeue(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 224, 113, 38),
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have any account ?',
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Signup',
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              //Button
            ],
          ),
        ),
      )),
    );
  }
}
