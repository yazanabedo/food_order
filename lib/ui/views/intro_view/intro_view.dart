import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ordering_sp2/ui/shared/colors.dart';
import 'package:food_ordering_sp2/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_ordering_sp2/ui/views/landing_view/landing_view.dart';

import '../../../core/translation/app_translation.dart';

class IntroView extends StatefulWidget {
  IntroView({Key? key}) : super(key: key);

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  List<String> titleList = [
    tr('Key_Find Food You Love'),
    tr('Key_Fast Delivery'),
   tr('Key_Live Tracking') 
  ];

  List<String> descriptionList = [
   tr("Key_Discover the best foods from over 1,000") +"\n" +tr("Key_restaurants and fast delivery to your doorstep"),
    tr("Key_Fast food delivery to your home, office")+ "\n" + tr("Key_wherever you are"),
    tr("Key_Real time tracking of your food on the app")+ ' \n'+ tr("Key_once you placed the order") 
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.width * 0.07),
        child: Column(children: [
          SvgPicture.asset('images/intro$currentIndex.svg'),
          Padding(
            padding: EdgeInsets.only(
                top: size.width * 0.05, bottom: size.width * 0.1),
            child: DotsIndicator(
              dotsCount: 3,
              position: currentIndex.toDouble(),
              decorator: DotsDecorator(
                
                color: AppColors.mainTextColor,
                activeColor: AppColors.mainOrangeColor,
              ),
            ),
          ),
          Text(
            titleList[currentIndex],
            style: TextStyle(
                color: AppColors.mainBlackColor,
                fontSize: size.width * 0.07,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.width * 0.05, bottom: size.width * 0.1),
            child: Text(descriptionList[currentIndex],
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.mainBlackColor,
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.normal)),
          ),
          Spacer(),
          custom_button(
            text: currentIndex != 2 ? tr('Key_Next') :tr('Key_Finish') ,
            onPressed: () {
              if (currentIndex != 2)
                setState(() {
                  currentIndex = currentIndex + 1;
                });
              else
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return LandingView();
                  },
                ));
            }, colorborder: AppColors.mainOrangeColor, colorbouttom: AppColors.mainOrangeColor, colortext: AppColors.mainWhiteColor, 
          )
        ]),
      ),
    ));
  }
}
