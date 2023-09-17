import 'package:food_ordering_sp2/core/services/base_controller.dart';
import 'package:get/get.dart';

import '../../../core/data/repositories/shared_prefreance_repository.dart';
import '../../shared/utils.dart';
import '../intro_view/intro_view.dart';
import '../login_view/login_view.dart';
import '../main_view/main_view.dart';

class splashScreenControlar extends BaseController {
  @override
  void onInit() {
    if (storage.getOrderPlaced()) {
      cartService.clearCart();
      storage.setOrderPlaced(false);
    }
    Future.delayed(Duration(seconds: 5)).then((value) {
      if (storage.getFirstLunch()) {
        Get.off(IntroView());
      } else {
        Get.off(storage.getLoggedIN() ? MainView() : LoginView());
      }
      //Get.back();
      storage.setFirstLunch(false);
    });
    super.onInit();
  }
}


