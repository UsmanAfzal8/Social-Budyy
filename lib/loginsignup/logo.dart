import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/logo.png'), fit: BoxFit.fill)),
    );
  }
}
