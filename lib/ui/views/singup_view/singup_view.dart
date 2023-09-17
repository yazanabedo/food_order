import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_ordering_sp2/ui/views/singup_view/signup_controler.dart';
import 'package:food_ordering_sp2/ui/views/singup_view/singup_view_widget/ChoseImage_widget.dart';

import '../../shared/custom_widgets/colors.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/text_widget.dart';
import '../../shared/custom_widgets/textfild_widget.dart';
import '../../shared/utils.dart';
import '../login_view/login_view.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
       



   SignupController controller = SignupController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Form(
          key:controller.formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
              child: Column(
                children: [
                  SizedBox(width: size.width ,height: size.width*0.6, child:ChoseImage() ,),
                   
                  Padding(
                    padding: EdgeInsets.only(top: size.width * 0.07),
                    child: Text_wedget(
                      text: "Sign Up",
                      fontsize: size.width * 0.09,
                    ),
                  ),
                  Text_wedget(
                      text: "Add your details to sign up",
                      fontsize: size.width * 0.045,
                      textcolor: AppColors.maincolorsmailtext),





                  TextFild_Widget(
                      hintText: "Ferst Name",
                      controlar: controller.firstName,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "pleas enter your Ferst name";
                        }
                      }),




                      TextFild_Widget(
                    hintText: "Last Name",
                    controlar: controller.lastName,
                    validator: (value) {
                        if (value!.isEmpty) {
                          return "pleas enter your Last name";
                        }
                      }

                  ),




                  TextFild_Widget(
                    hintText: "Email",
                    controlar: controller.email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "pleas enter your email";
                      } else if (!isEmail(value)) {
                        return "Invalid Email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  
                  TextFild_Widget(
                    hintText: "Password",
                    controlar:controller.password,
                    validator: (value) {
                        if (value!.isEmpty) {
                          return "pleas enter your Password";
                        }
                      }
                  ),
                  TextFild_Widget(
                    hintText: "Age",
                    controlar:controller.age,
                   
                  ),
                
                  
                      custom_button(
                        text: "Sign Up",
                        colortext: AppColors.maincolorwhite,
                        colorbouttom: AppColors.maincolororange,
                        colorborder: AppColors.maincolororange,
                        onPressed: () {
                       controller.Signup();
                        },
                      ),
                  Row(
                    children: [
                      Text_wedget(
                        text: "Already have an Account?",
                        fontsize: size.width * 0.05,
                        textcolor: AppColors.maincolorsmailtext,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return LoginView();
                            },
                          ));
                        },
                        child: Text_wedget(
                          text: " Login",
                          textcolor: AppColors.maincolororange,
                          fontsize: size.width * 0.06,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
