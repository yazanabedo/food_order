import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_ordering_sp2/ui/shared/colors.dart';
import 'package:food_ordering_sp2/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_ordering_sp2/ui/shared/custom_widgets/custom_toast.dart';
import 'package:food_ordering_sp2/ui/shared/custom_widgets/text_widget.dart';
import 'package:food_ordering_sp2/ui/shared/custom_widgets/textfild_widget.dart';
import 'package:food_ordering_sp2/ui/shared/utils.dart';
import 'package:food_ordering_sp2/ui/views/login_view/login_view.dart';
import 'package:food_ordering_sp2/ui/views/main_view/main_view.dart';
import 'package:food_ordering_sp2/ui/views/singup_view/singup_view_widget/ChoseImage_widget.dart';

import 'core/data/repositories/shared_prefreance_repository.dart';
import 'core/data/repositories/user_repository.dart';
import 'core/enums/message_type.dart';

class teeeest extends StatefulWidget {
  const teeeest({super.key});

  @override
  State<teeeest> createState() => _teeeestState();
}

class _teeeestState extends State<teeeest> {


  TextEditingController ferstname = TextEditingController(); 
   TextEditingController lastname = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_Password = TextEditingController();
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: fromKey,
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
                      textcolor: AppColors.mainTextColor),
                  TextFild_Widget(
                      hintText: "First Name",
                      controlar: ferstname,
                      ),
                       TextFild_Widget(
                    hintText: "Last Name",
                     
                     controlar: lastname,
                  ),
                  TextFild_Widget(
                    hintText: "Email",
                    controlar: email,
                  
                  ),
                



                 
                 
                  TextFild_Widget(
                    hintText: "Password",
                    controlar: password,
                   
                  ),
                 
                
                       Padding(
                          padding: EdgeInsets.only(
                              top: size.width * 0.06,
                              bottom: size.width * 0.05),
                          child: custom_button(
                            text: "Sign Up",
                            colortext: AppColors.mainWhiteColor,
                            colorbouttom: AppColors.mainOrangeColor,
                            colorborder: AppColors.mainOrangeColor,
                            onPressed: () {
                              UserRepository().register(
                                email: email.toString(), 
                                password: password.toString(), 
                                firstName: ferstname.toString(), 
                                lastName: lastname.toString(),
                                
                  
                                ).then( (value) {value.fold(
                                    
                            (l)  
                             {
                          
                              CustomToast.showMeassge(
                                 
                                  message: l,
                                  messageType: MessageType.REJECTED
                                 );  }, 
                          
                            (r)
                             {
                              storage.setLoggedIN(true);
                              

                              Navigator.pushReplacement( context, MaterialPageRoute(   builder: (context) {  return MainView();},));
                                 
                             
                                
                                
                              
                            });
                          });



















                             
                            },
                          ),
                        ),
                  Row(
                    children: [
                      Text_wedget(
                        text: "Already have an Account?",
                        fontsize: size.width * 0.05,
                        textcolor: AppColors.mainTextColor,
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
                          textcolor: AppColors.mainTextColor,
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
