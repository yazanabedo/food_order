
import 'package:get/get.dart';

import '../../../core/services/base_controller.dart';
import '../../shared/utils.dart';
import '../main_view/main_view.dart';

class CheckoutController extends BaseController {
  @override
  void onClose() {
    cartService.clearCart();
    Get.off(MainView());
    super.onClose();
  }
}