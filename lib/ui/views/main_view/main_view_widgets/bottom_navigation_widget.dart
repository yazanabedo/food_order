import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ordering_sp2/core/enums/bottom_navigation.dart';
import 'package:food_ordering_sp2/ui/shared/colors.dart';
import 'package:food_ordering_sp2/ui/views/landing_view/landing_view.dart';

import '../../../../core/translation/app_translation.dart';
import '../../../shared/utils.dart';

class BottomNavigationWidget extends StatefulWidget {
  final BottomNavigationEnum bottomNavigation;
  final Function(BottomNavigationEnum, int) onTap;
  BottomNavigationWidget(
      {Key? key,
       required this.bottomNavigation,
       required this.onTap})
      : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        InkWell(
          onTap: () {
            widget.onTap(BottomNavigationEnum.HOME, 2);
          },
          child: Padding(
            padding: EdgeInsets.only(bottom: screenWidth(9) ),
            child: CircleAvatar(
              radius: screenWidth(10),
              backgroundColor:
                  widget.bottomNavigation == BottomNavigationEnum.HOME
                      ? AppColors.mainOrangeColor
                      : AppColors.mainGreyColor,
              child: SvgPicture.asset(
                'images/ic_home.svg',
                color: AppColors.mainWhiteColor,
              ),
            ),
          ),
        ),
        // SvgPicture.asset(
        //   'images/bg_bottom_navigation.svg',
        //   fit: BoxFit.fitWidth,
        // ),
        CustomPaint(
          painter: ClipShadowShadowPainter(
              clipper: BottomClip(),
              shadow: Shadow(
                  blurRadius:screenWidth(20),
                  offset: Offset(0, 1),
                  color: AppColors.mainTextColor)),
          child: ClipPath(
            clipper: BottomClip(),
            child: Container(
              width: size.width,
              height: screenWidth(4),
              color: AppColors.mainWhiteColor,
            ),
          ),
        ),
        Positioned.directional(
          bottom: screenWidth(20),
          end: screenWidth(20),
          start:screenWidth(20),
          textDirection:TextDirection.rtl ,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:screenWidth(80)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    navItem(
                        onTap: () {
                          widget.onTap(BottomNavigationEnum.MENU, 0);
                        },
                        size: size,
                        imageName: 'ic_menu',
                        text: tr("Key_Menu"),
                        isSelected: widget.bottomNavigation ==
                            BottomNavigationEnum.MENU
                            ),


                            
                    SizedBox(
                      width: screenWidth(10),
                    ),
                    navItem(
                        onTap: () {
                          widget.onTap(BottomNavigationEnum.OFFERS, 1);
                        },
                        size: size,
                        imageName: 'ic_shopping',
                        text: tr('Key_Offers'),
                        isSelected: widget.bottomNavigation ==
                            BottomNavigationEnum.OFFERS),
                  ],
                ),
                Row(
                  children: [
                    navItem(
                        onTap: () {
                          widget.onTap(BottomNavigationEnum.PROFILE, 3);
                        },
                        size: size,
                        imageName: 'ic_user',
                        text: tr( "Key_Profile"),
                        isSelected: widget.bottomNavigation ==
                            BottomNavigationEnum.PROFILE),



                    SizedBox(
                      width: screenWidth(10),
                    ),



                    navItem(
                        onTap: () {
                          widget.onTap(BottomNavigationEnum.MORE, 4);
                        },
                        size: size,
                        imageName: 'ic_more',
                        text:tr( 'Key_More') ,
                        isSelected: widget.bottomNavigation ==
                            BottomNavigationEnum.MORE
                            ),


                            
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget navItem(
      {required Size size,
      required String imageName,
      required String text,
      required bool isSelected,
      required Function onTap}) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          SvgPicture.asset(
            'images/$imageName.svg',
            width: screenWidth(15),
            color: isSelected
                ? AppColors.mainOrangeColor
                : AppColors.mainTextColor,
          ),
          Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? AppColors.mainOrangeColor
                  : AppColors.mainTextColor,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width * 0.3381500, 0);
    path0.quadraticBezierTo(size.width * 0.3731500, size.height * 0.0069000,
        size.width * 0.3757000, size.height * 0.1236000);
    path0.quadraticBezierTo(size.width * 0.4022000, size.height * 0.5633000,
        size.width * 0.5006000, size.height * 0.5896000);
    path0.quadraticBezierTo(size.width * 0.5955500, size.height * 0.5727000,
        size.width * 0.6200000, size.height * 0.1240000);
    path0.quadraticBezierTo(size.width * 0.6204500, size.height * -0.0157000,
        size.width * 0.6646000, 0);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, 0);
    path0.lineTo(size.width * 0.6225000, size.height * 0.6100000);
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
