import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ordering_sp2/core/services/location_service.dart';
import 'package:food_ordering_sp2/ui/shared/colors.dart';
import 'package:food_ordering_sp2/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_ordering_sp2/ui/views/login_view/login_view.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../../../core/translation/app_translation.dart';
import '../../shared/utils.dart';
import '../main_view/home_view/home_view.dart';
import '../map_view/map_view.dart';
import '../singup_view/singup_view.dart';
import 'landing_controller.dart';

class LandingView extends StatefulWidget {
  
  const LandingView({Key? key}) : super(key: key);

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
    LandingController controller = Get.put(LandingController());

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        Stack(
          children: [
            CustomPaint(
              painter: ClipShadowShadowPainter(
                clipper: LandingClipper(),
                shadow: Shadow(blurRadius: screenWidth(40)),
              ),
              child: ClipPath(
                clipper: LandingClipper(),
                child: Container(
                  width: screenWidth(1),
                  height: screenWidth(1.1),
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    'images/Background objects.svg',
                    fit: BoxFit.fitWidth,
                    width: screenWidth(1),
                  ),
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(252, 96, 17, 1)),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: screenWidth(1.3)),
                child: SvgPicture.asset(
                  'images/Logo.svg',
                  width: screenWidth(2.5),
                  height: screenWidth(2.5),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: screenWidth(10)),
          child: Text(
            tr('Key_Discover the best foods from over 1,000') +
                "\n" +
                tr('Key_restaurants and fast delivery to your doorstep'),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: screenWidth(25)),
          ),
        ),
        Column(children: [
          custom_button(
                text: 'Login',
               
                onPressed: () async {
                  LocationData? currentLocation =
                      await locationService.getCurrentLocation();

                  if (currentLocation != null)
                    Get.to(MapView(
                      currentLocation: currentLocation,
                    ));
                },
                 colortext: AppColors.mainWhiteColor,
            colorbouttom: controller.color.value,
             colorborder: AppColors.mainOrangeColor,
                  ),








          // custom_button(
          //   text: tr('key_login'),
          //   onPressed: () {
          
          //     Get.to(() => 
          //     (
               
          //     HomeView(onPressed: (){},)));
          //   },
          //   colortext: AppColors.mainWhiteColor,
          //   colorbouttom: AppColors.mainOrangeColor,
          //   colorborder: AppColors.mainOrangeColor,
          // ),
          SizedBox(
            height: screenWidth(20),
          ),
          custom_button(
            text: tr('Key_Create an Account'),
            onPressed: () {
              Get.to(() => (SignUpScreen()));
            },
            colorborder: AppColors.mainOrangeColor,
            colorbouttom: AppColors.mainWhiteColor,
            colortext: AppColors.mainOrangeColor,
          ),
        ]),
      ],
    )));
  }
}

class LandingClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.0008333, size.height * 0.0014286);
    path0.lineTo(size.width, 0);
    path0.quadraticBezierTo(size.width, size.height * 0.6964286, size.width,
        size.height * 0.9285714);
    path0.quadraticBezierTo(size.width * 0.9968083, size.height * 1.0063571,
        size.width * 0.9591667, size.height);
    path0.lineTo(size.width * 0.6664500, size.height);
    path0.quadraticBezierTo(size.width * 0.6596000, size.height * 0.7251000,
        size.width * 0.5001750, size.height * 0.7281714);
    path0.quadraticBezierTo(size.width * 0.3309417, size.height * 0.7312429,
        size.width * 0.3327583, size.height);
    path0.lineTo(size.width * 0.0460500, size.height);
    path0.quadraticBezierTo(size.width * 0.0006667, size.height * 1.0078714, 0,
        size.height * 0.9271429);
    path0.quadraticBezierTo(size.width * 0.0002083, size.height * 0.6957143,
        size.width * 0.0008333, size.height * 0.0014286);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
