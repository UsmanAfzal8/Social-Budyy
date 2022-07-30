import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialbuddy/loginsignup/login.dart';
import 'package:socialbuddy/resources/Auth_method.dart';
import 'package:socialbuddy/utils/imagepicker.dart';
import 'package:socialbuddy/widgets/textfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _bio = TextEditingController();
  Uint8List? _image;
  bool _isloading = false;
  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _bio.dispose();
    _username.dispose();
  }

  void signuph() async {
    setState(() {
      _isloading = true;
    });
    String res = await AuthMethods().signupUser(
      username: _username.text,
      bio: _bio.text,
      email: _emailcontroller.text,
      password: _passwordcontroller.text,
      file: _image!,
    );
    setState(() {
      _isloading = false;
    });
    showSnackBar(context, res);
    // if (res != 'success') {
    //   showSnackBar(context, res);
    // } else {}
    if (res == "Success") {
      //Navigator.pushNamed(context, '/Loginscreen');
      // Navigator.pushReplacement(context, MaterialPageRoute (BuildContext context) => const LoginUi(),);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const LoginUi(),
        ),
      );
    }
    print(res);
  }

  void selectimage() async {
    Uint8List? im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 32, right: 8, left: 8, bottom: 16),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Signup',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),

                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundColor: Colors.blueGrey,
                            backgroundImage: MemoryImage(_image!))
                        : CircleAvatar(
                            radius: 64,
                            backgroundColor: Colors.blueGrey,
                            backgroundImage: AssetImage('assets/noimage.png')),
                    Positioned(
                        bottom: -2,
                        right: 15,
                        child: IconButton(
                          onPressed: selectimage,
                          icon: Icon(Icons.add_a_photo,
                              color: Color.fromARGB(255, 253, 253, 253)),
                        )),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                //Email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Textfieldpage(
                    hinttext: 'Enter User Name',
                    textcontroller: _username,
                    texttype: TextInputType.text,
                    labeltext: 'User Name',
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
                //Email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Textfieldpage(
                    hinttext: 'Enter Bio',
                    textcontroller: _bio,
                    texttype: TextInputType.text,
                    labeltext: 'Bio',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                //Email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Textfieldpage(
                    hinttext: 'Enter password',
                    textcontroller: _passwordcontroller,
                    texttype: TextInputType.text,
                    labeltext: 'password',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                //Password
                _isloading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: signuph,
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.bebasNeue(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 224, 113, 38),
                        ),
                      ),
                // InkWell(
                //   onTap: () async {
                //     String res = await AuthMethods().signupUser(
                //         email: _emailcontroller.text,
                //         password: _passwordcontroller.text,
                //         username: _username.text,
                //         bio: _bio.text);
                //     print(_username.text);
                //     print(_bio.text);
                //     print(res);
                //   },
                //   child: Container(
                //     height: 50,
                //     width: 100,
                //     child: Center(child: Text('Signup')),
                //     color: Colors.red,
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'I have any account ?',
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/Loginscreen');
                      },
                      child: Text(
                        'Login',
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
