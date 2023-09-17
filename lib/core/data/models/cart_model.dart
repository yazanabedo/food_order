import 'dart:convert';

import 'apis/Meal _Model.dart';


class CartModel {
  int? count;
  double? total;
  MealModel? mealModel;

  CartModel({this.count, this.total, this.mealModel});

  CartModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    total = json['total'];
    mealModel = json['meal_model'] != null
        ? new MealModel.fromJson(json['meal_model'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['total'] = this.total;
    if (this.mealModel != null) {
      data['meal_model'] = this.mealModel!.toJson();
    }
    return data;
  }

  static Map<String, dynamic> toMap(CartModel model) {
    return {
      "count": model.count,
      "total": model.total,
      "meal_model": model.mealModel,
    };
  }

  static String encode(List<CartModel> list) => json.encode(
        list
            .map<Map<String, dynamic>>((element) => CartModel.toMap(element))
            .toList(),
      );

  static List<CartModel> decode(String strList) =>
      (json.decode(strList) as List<dynamic>)
          .map<CartModel>((item) => CartModel.fromJson(item))
          .toList();
}
