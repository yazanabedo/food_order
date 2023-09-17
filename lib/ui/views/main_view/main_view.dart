import 'package:flutter/material.dart';
import 'package:food_ordering_sp2/ui/views/main_view/profile_view/profile_view.dart';

import '../../../core/enums/bottom_navigation.dart';
import '../../shared/custom_widgets/custom_drawer.dart';
import 'home_view/home_view.dart';
import 'main_view_widgets/bottom_navigation_widget.dart';
import 'menu_view/menu_view.dart';
import 'more_view/more_view.dart';
import 'offers_view/offers_view.dart';

class MainView extends StatefulWidget {
  MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  BottomNavigationEnum selected = BottomNavigationEnum.HOME;
  PageController controller = PageController(initialPage: 2);
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          key: key,
          drawer: CustomDrawer(),
          body: Stack(
            children: [
              PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: controller,
                children: [
                  MenuView(),
                  OffersView(),
                  HomeView(onPressed: (){},),
                  ProfileView(),
                  MoreView()
                ],
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: BottomNavigationWidget(
                  bottomNavigation: selected,
                  onTap: (select, pageNumber) {
                    setState(() {
                      selected = select;
                    });
                    controller.jumpToPage(pageNumber);
                  },
                ),

                
              ),
            ],
          )),
    );
  }
}
