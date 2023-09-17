

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/data/repositories/user_repository.dart';
import '../../../core/enums/message_type.dart';
import '../../../core/services/base_controller.dart';
import '../../shared/custom_widgets/custom_toast.dart';
import '../../shared/utils.dart';
import '../main_view/main_view.dart';

class SignupController extends BaseController {
  TextEditingController lastName = TextEditingController(text: "ret");
  TextEditingController firstName = TextEditingController(text: "ert");

  TextEditingController email = TextEditingController(text: "qwe@qh.com");
  TextEditingController password = TextEditingController(text: "334ewreAA");
  TextEditingController age = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void Signup() {
    String em =email.text;
    String fs =firstName.text;
    String ls =lastName.text;
    String ps =password.text;
   
    if (formKey.currentState!.validate()) {
      runLoadingFutureFunction(
          function: UserRepository().register(email: em,
          lastName: ls,firstName: fs, password: ps,
             
                 )
              .then((value) {
        value.fold((l) {
          CustomToast.showMeassge(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          storage.setLoggedIN(true);

          Get.off(MainView(), transition: Transition.cupertino);
        });
      }));
    }
  }
}
