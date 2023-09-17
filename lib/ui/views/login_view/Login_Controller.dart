import 'package:flutter/material.dart';
import 'package:food_ordering_sp2/core/data/repositories/user_repository.dart';
import 'package:food_ordering_sp2/core/enums/message_type.dart';
import 'package:food_ordering_sp2/ui/shared/custom_widgets/custom_toast.dart';
import 'package:food_ordering_sp2/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';
import '../../../core/services/base_controller.dart';
import '../../shared/utils.dart';

class LoginController extends BaseController {
  TextEditingController emailController =TextEditingController(text: 'Test@gmail.com');
      
  TextEditingController passwordController =TextEditingController(text: 'Test@1234');
      

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


 
  void login() {
    if (formKey.currentState!.validate()) {
      runLoadingFutureFunction(
     
          function: UserRepository()
              .login(
                  email: emailController.text,
                  password: passwordController.text)
              .then((value) {
        value.fold((l) {
          CustomToast.showMeassge(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          storage.setLoggedIN(true);
          storage.setTokenInfo(r);
          Get.off(MainView(), transition: Transition.cupertino);
        });
      }));
    }
  }

 
}

void cupertinoTransition(Widget view) {
  Get.off(view, transition: Transition.cupertino);
}


