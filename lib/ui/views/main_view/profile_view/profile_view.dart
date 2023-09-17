import 'package:flutter/material.dart';
import '../../../../core/data/models/apis/getprofile.dart';
import '../../../../core/data/repositories/Profile_repositories.dart';
import '../../../shared/colors.dart';
import '../../../shared/custom_widgets/text_widget.dart';
import '../../singup_view/singup_view_widget/ChoseImage_widget.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileRepository a = ProfileRepository();
  GetProfile p = GetProfile();

  @override
  void initState() {
    super.initState();

    a.Get_Profil().then((value) {
      value.fold(
        (l) => null,
        (r) {
          setState(() {
            p = r;
          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(  
          body: 
 SingleChildScrollView(
        child:  Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text_wedget(text: 'Profile', fontsize: size.width * 0.07),
              Icon(
                Icons.shopping_cart,
                size: size.width * 0.08,
              )
            ],
          ),
          SizedBox(
              height: size.width * 0.6, width: size.width, child: ChoseImage()),
          Text_wedget(
              text: 'Hi there ${p.firstName.toString()}!',
              fontsize: size.width * 0.07),
          Text_wedget(
              text: 'Sign Out',
              fontsize: size.width * 0.03,
              textcolor: AppColors.mainTextColor),
          Container(
            width: size.width,
            height: size.width * 0.15,
            decoration: BoxDecoration(
              color: AppColors.mainGreyColor, //blue
              borderRadius: BorderRadius.circular(45),
            ),
            child: Column(children: [
              Text_wedget(text: 'Name', fontsize: size.width * 0.03 , textcolor: Colors.grey.shade500 ),
              Text_wedget(text: '${p.firstName.toString()} ${p.lastName.toString()}', fontsize: size.width * 0.06),
            ]),
          ),SizedBox(height: 10,),
            Container(
            width: size.width,
            height: size.width * 0.15,
            decoration: BoxDecoration(
              color: AppColors.mainGreyColor, //blue
              borderRadius: BorderRadius.circular(45),
            ), 
            child: Column(children: [
              Text_wedget(text: 'Email', fontsize: size.width * 0.03 , textcolor: Colors.grey.shade500 ),
              Text_wedget(text: '${p.email.toString()} ', fontsize: size.width * 0.06),
            ]),
          )
        ]),
      )
          
           ),
    );
  }
}

 // Text('${p.email.toString()}'),


