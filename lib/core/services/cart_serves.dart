import 'package:get/get.dart';
import '../../ui/shared/utils.dart';
import '../data/models/apis/Meal _Model.dart';
import '../data/models/cart_model.dart';

class CartService {
  RxList<CartModel> cartList = storage.getCartList().obs;

  RxInt cartCount = 0.obs;

  RxDouble subTotal = 0.0.obs;
  RxDouble tax = 0.0.obs;
  RxDouble delivery = 0.0.obs;
  RxDouble total = 0.0.obs;

  CartService() {
    cartCount.value = getCartCount();
    calcTotals();
  }

  void addToCart({
    required MealModel model,
    required int count,
    Function? afterAdd,
  }) {
    if (getCartModel(model) != null) {
      int index = cartList.indexOf(getCartModel(model)!);
      cartList[index].count = cartList[index].count! + count;
      cartList[index].total = cartList[index].total! + (count * model.price!);
    } else {
      cartList.add(CartModel(
        count: count,
        total: (count * model.price!).toDouble(),
        mealModel: model,
      ));
    }
    cartCount.value += count;
    calcTotals();
    storage.setCartList(cartList);
    if (afterAdd != null) afterAdd();
  }

  void removeFromCart({required CartModel model, Function? afterRemove}) {
    cartList.remove(model);
    storage.setCartList(cartList);
    cartCount.value -= model.count!;
    calcTotals();

    if (afterRemove != null) afterRemove();
  }

  void changeCount(
      {required bool incress,
      required CartModel model,
      Function? afterChange}) {
    CartModel result = getCartModel(model.mealModel!)!;
    int index = cartList.indexOf(result);

    if (incress) {
      result.count = result.count! + 1;
      result.total = result.total! + model.mealModel!.price!;
      cartCount.value += 1;
    } else {
      if (result.count! > 1) {
        result.count = result.count! - 1;
        result.total = result.total! - model.mealModel!.price!;
        cartCount.value -= 1;
      }
    }

    cartList.remove(result);
    cartList.insert(index, result);

    calcTotals();

    storage.setCartList(cartList);
    if (afterChange != null) afterChange();
  }

  CartModel? getCartModel(MealModel model) {
    try {
      return cartList.firstWhere(
        (element) => element.mealModel!.id == model.id,
      );
    } catch (e) {
      return null;
    }
  }

  int getCartCount() {
    return cartList.fold(
        0, (previousValue, element) => previousValue + element.count!);
  }

  void calcTotals() {
    subTotal.value = cartList.fold(
        0, (previousValue, element) => previousValue + element.total!);

    tax.value = subTotal * taxAmount;
    delivery.value = (subTotal.value + tax.value) * deliveryAmount;
    total.value = subTotal.value + tax.value + delivery.value;
  }

  void clearCart() {
    cartList.clear();
    storage.setCartList(cartList);
    cartCount.value = 0;
    calcTotals();
  }
}
