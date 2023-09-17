import 'package:food_ordering_sp2/core/data/models/cart_model.dart';
import 'package:food_ordering_sp2/core/services/base_controller.dart';
import 'package:food_ordering_sp2/ui/shared/utils.dart';
import 'package:get/get.dart';

import '../checkout/checkout_view.dart';

class CartController extends BaseController {
  List<CartModel> get cartList => cartService.cartList;

 
  void removeFromCart(CartModel model) {
    cartService.removeFromCart(
      model: model,
    );
  }

  void changeCount(bool incress, CartModel model) {
    cartService.changeCount(
      incress: incress,
      model: model,
    );
  }

  void checkout() {
    runLoadingFutureFunction(
        function: Future.delayed(Duration(seconds: 2)).then((value) {
      Get.off(CheckoutView());
    }));
  }
}
