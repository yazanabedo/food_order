import 'package:food_ordering_sp2/core/services/base_controller.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../../core/data/models/apis/Meal _Model.dart';
import '../../../core/data/models/cart_model.dart';
import '../../shared/utils.dart';
import '../caet_view/cart_view.dart';

class MealDetailsController extends BaseController {
 MealDetailsController(MealModel mealModel) {
    model = mealModel;
  }

  MealModel model = MealModel();
  RxInt count = 1.obs;

  void changeCount(bool incress) {
    if (incress)
      count++;
    else {
      if (count > 1) count--;
    }
  }

  double calcTotal() {
    return (count.value * model.price!).toDouble();
  }

  void addToCart() {
    cartService.addToCart(
        model: model,
        count: count.value,
        afterAdd: () {
          Get.to(() => CartView());
        });
  }
}



