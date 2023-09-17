import 'package:flutter/material.dart';
import 'package:food_ordering_sp2/ui/shared/colors.dart';
import 'package:food_ordering_sp2/ui/views/login_view/login_view.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: size.width * 0.1, horizontal: size.width * 0.1),
      width: size.width * 0.65,
      color: AppColors.mainWhiteColor,
      child: Column(
        children: [
          drawerItem(
              size: size,
              text: 'Profile',
              iconName: Icons.verified_user,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return LoginView();
                })));
              }),
          drawerItem(
              size: size, text: 'Address', iconName: Icons.pin, onTap: () {})
        ],
      ),
    );
  }

  Widget drawerItem(
      {required Size size,
      required IconData iconName,
      required String text,
      required Function onTap}) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Row(
        children: [
          Icon(iconName),
          SizedBox(
            width: size.width * 0.02,
          ),
          Text(
            text,
            style: TextStyle(
              color: AppColors.mainTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
