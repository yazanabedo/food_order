import 'package:flutter/material.dart';

class Text_wedget extends StatelessWidget {
  const Text_wedget(
      {super.key,
      required this.text,
      this.textcolor = null,
      this.fontsize = null,
      this.fontWeight = null,
      this.decoration = null,
      this.decorationThickness = null,
      this.fontFamily = null});
  final String text;
  final Color? textcolor;
  final double? fontsize;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final double? decorationThickness;
  final String? fontFamily;

  

  @override
  Widget build(BuildContext context) {
    return Text(
     
      text,
      style: TextStyle(
        color: textcolor,
        fontSize: fontsize,
        fontWeight: fontWeight,
        decoration: decoration,
        decorationThickness: decorationThickness,
      ),
    );
  }
}
