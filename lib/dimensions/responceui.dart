import 'package:flutter/material.dart';
import 'package:socialbuddy/utilis/dimensions.dart';

class ResponsiveUi extends StatelessWidget {
  final Widget mobileScreeenlayout;
  final Widget webScreeenlayout;
  const ResponsiveUi(
      {Key? key,
      required this.webScreeenlayout,
      required this.mobileScreeenlayout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        return webScreeenlayout;
      } else
        return mobileScreeenlayout;
    });
  }
}
// class ResponsiveUi extends StatefulWidget {
//   final Widget mobileScreeenlayout;
//   final Widget webScreeenlayout;
//   const ResponsiveUi({Key? key, required this.mobileScreeenlayout,required this.webScreeenlayout}) : super(key: key);

//   @override
//   State<ResponsiveUi> createState() => _ResponsiveUiState();
// }

// class _ResponsiveUiState extends State<ResponsiveUi> {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraints) {
//       if(constraints.maxWidth>webScreenSize)
//       return webScreeenlayout();
//     },
//     );
//   }
// }
