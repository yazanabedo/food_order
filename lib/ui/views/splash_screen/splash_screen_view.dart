import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ordering_sp2/ui/shared/colors.dart';
import 'package:food_ordering_sp2/ui/shared/utils.dart';
import 'package:food_ordering_sp2/ui/views/splash_screen/splash_screen_controlar.dart';
import 'package:get/get.dart';


class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
    splashScreenControlar controlar =Get.put(splashScreenControlar());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      fit: StackFit.expand,
      children: [
        SvgPicture.asset(
          'images/bg_background.svg',
          height: screenHeight(1),
          width: screenWidth(1),
        ),
        Center(
          child: SvgPicture.asset(
            'images/Logo.svg',
            width: screenWidth(3),
            height: screenHeight(3),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: screenHeight(1.5)),
          child: SpinKitThreeBounce(
            color: AppColors.mainOrangeColor,
          ),
        )
      ],
    )));
  }
}
