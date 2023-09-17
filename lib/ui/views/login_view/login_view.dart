import 'package:flutter/material.dart';
import 'package:food_ordering_sp2/ui/shared/colors.dart';
import 'package:food_ordering_sp2/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_ordering_sp2/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:food_ordering_sp2/ui/views/login_view/login_controller.dart';
import 'package:get/get.dart';
import '../../../app/my_app.dart';
import '../../../core/enums/connectivity_status.dart';
import '../../../core/translation/app_translation.dart';
import '../../shared/utils.dart';
import '../singup_view/singup_view.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = LoginController();
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [

               


                IconButton(
                  icon: Icon(
                    Icons.language,
                  ),
                  onPressed: () {
                    Get.defaultDialog(
                        title: 'Change Language',
                        content: Column(
                          children: [
                            TextButton(
                                onPressed: () {
                                  storage.setAppLanguage('en');
                                  Get.updateLocale(getLocal());
                                  Get.back();
                                },
                                child: Text('English')),
                            TextButton(
                                onPressed: () {
                                  storage.setAppLanguage('ar');
                                  Get.updateLocale(getLocal());
                                  Get.back();
                                },
                                child: Text('العربية')),
                          ],
                        ));
                  },
                ),
                SizedBox(
                  height: screenHeight(15),
                ),
                Text(
                  tr('key_login'),
                  style: TextStyle(
                      fontSize: screenHeight(25),
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainBlackColor),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight(50), bottom: screenHeight(50)),
                  child: Text(
                    tr("Key_Add your details to login"),
                    style: TextStyle(
                        fontSize: screenHeight(50),
                        fontWeight: FontWeight.normal,
                        color: AppColors.mainTextColor),
                  ),
                ),
                CustomTextField(
                  hitText: tr("Key_Your Email"),
                  controller: controller.emailController,
                  validator: (value) {
                    if (value!.isEmpty || !GetUtils.isEmail(value)) {
                      return 'please check your email';
                    }
                  },
                ),
                CustomTextField(
                  hitText: tr("Key_password"),
                  controller: controller.passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your password';
                    }
                  },
                ),
                custom_button(
                  text: tr('key_login'),
                  onPressed: () {
                    controller.login();
                    customLoader();
                  },
                  colorborder: AppColors.mainOrangeColor,
                  colorbouttom: AppColors.mainOrangeColor,
                  colortext: AppColors.mainWhiteColor,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight(50), bottom: screenHeight(20)),
                  child: Text(
                    tr("Key_Forget password"),
                    style: TextStyle(
                        fontSize: screenHeight(50),
                        fontWeight: FontWeight.normal,
                        color: AppColors.mainTextColor),
                  ),
                ),
                Text(
                  tr('Key_or Login With'),
                  style: TextStyle(
                      fontSize: screenHeight(50),
                      fontWeight: FontWeight.normal,
                      color: AppColors.mainTextColor),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight(50), bottom: screenHeight(50)),
                  child: custom_button(
                    text: tr("Key_Login with Facebook"),
                    svgName: 'Facebook',
                    colorborder: AppColors.mainBlueColor,
                    colorbouttom: AppColors.mainBlueColor,
                    colortext: AppColors.mainWhiteColor,
                    onPressed: () {},
                  ),
                ),
                custom_button(
                  text: tr("Key_Login with Google"),
                  svgName: 'google-plus-logo',
                  colorborder: AppColors.mainRedColor,
                  colorbouttom: AppColors.mainRedColor,
                  colortext: AppColors.mainWhiteColor,
                  onPressed: () {},
                ),
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      vertical: screenWidth(60), horizontal: screenHeight(13)),
                  child: Row(
                    children: [
                      Text(
                        tr("Key_Don't have an Account?"),
                        style: TextStyle(
                            color: AppColors.mainBlackColor,
                            fontSize: screenWidth(25)),
                      ),
                      InkWell(onTap: 
                      (){Get.off(SignUpScreen());}  
                       ,

                        child: Text(tr("Key_Sign Up"),
                            style: TextStyle(
                                color: AppColors.mainOrangeColor,
                                fontSize: screenWidth(25))),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
