import 'package:flutter/material.dart';

import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/textfild_widget.dart';
import 'signup_controler.dart';

class signuptest extends StatefulWidget {
  const signuptest({super.key});

  @override
  State<signuptest> createState() => _signuptestState();
}

class _signuptestState extends State<signuptest> {
  SignupController controller = SignupController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Column(children: [
         TextFild_Widget(
                      hintText: "Ferst Name",
                      controlar: controller.firstName,
                     ),
    
       TextFild_Widget(
                    hintText: "Last Name",
                    controlar: controller.lastName,
                 

                  ),
    
    
    
                  TextFild_Widget(
                    hintText: "Email",
                    controlar: controller.email,
                 
                  ),
       TextFild_Widget(
                    hintText: "Password",
                    controlar:controller.password,
                   
                  ),
              


                   custom_button(
                        text: "Sign Up",
                        colortext: AppColors.mainWhiteColor,
                        colorbouttom: AppColors.mainOrangeColor,
                        colorborder: AppColors.mainOrangeColor,
                        onPressed: () {
                       controller.Signup();
                        },
                      ),
        
      ]) ,
    
    
    
    
    
    
    
    
    
    
    
      ),
    );
  }
}