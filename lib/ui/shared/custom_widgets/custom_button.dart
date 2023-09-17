import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../views/landing_view/landing_view.dart';


class custom_button extends StatelessWidget {
  const custom_button({
    super.key,
    required this.text,
    required this.colortext,
    required this.colorbouttom,
    required this.colorborder,
    this.svgName, 
    required this.onPressed,
   
     
  });

  final String text;
  final Color colortext;
  final Color colorbouttom;
  final Color colorborder;
  final String? svgName;
  final Function onPressed;



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ElevatedButton(
        onPressed: () {
        onPressed();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("images/$svgName.svg"),
           SizedBox(
              width: size.width * 0.02,
            ),
          Text(
            text,
            style: TextStyle(color: colortext,
             fontSize: size.width * 0.035,),
          )
        ],
      ),
      style: ElevatedButton.styleFrom(
          side: BorderSide(width: 1, color: colorborder),
          backgroundColor: colorbouttom,
          shape: StadiumBorder(),
          fixedSize: Size(size.width * 0.9, size.width * 0.14)),
    );
  }
}


//custom_button