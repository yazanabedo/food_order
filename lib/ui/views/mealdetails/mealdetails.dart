import 'package:flutter/material.dart';
import 'package:food_ordering_sp2/ui/shared/colors.dart';
import 'package:food_ordering_sp2/ui/shared/utils.dart';
import 'package:get/get.dart';
import '../../../core/data/models/apis/Meal _Model.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../caet_view/cart_view.dart';
import 'mealdetailscontrolar.dart';

class MealDetailsView extends StatefulWidget {

  final MealModel model;

  MealDetailsView({Key? key, required this.model}) : super(key: key);

  @override
  State<MealDetailsView> createState() => _MealDetailsViewState();
}

class _MealDetailsViewState extends State<MealDetailsView> {
  late MealDetailsController controller;
  @override
  void initState() {
    controller = Get.put(MealDetailsController(widget.model));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Text(
            'Price: ${widget.model.price}',
            style: TextStyle(fontSize: screenWidth(10)),
          ),
          Obx(() {
            return Row(
              children: [
                SizedBox(
                  width: screenWidth(5),
                  child: custom_button(
                    text: '+',
                    onPressed: () {
                      controller.changeCount(true);
                    },
                    colorborder: AppColors.mainOrangeColor,
                    colorbouttom: AppColors.mainOrangeColor,
                    colortext: AppColors.mainWhiteColor,
                  ),
                ),
                SizedBox(
                  width: screenWidth(5),
                  child: custom_button(
                    text: controller.count.value.toString(),
                    colorborder: AppColors.mainWhiteColor,
                    colorbouttom: AppColors.mainWhiteColor,
                    colortext: AppColors.mainOrangeColor,
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: screenWidth(5),
                  child: custom_button(
                    text: '-',
                    onPressed: () {  controller.count.value == 1 ? null:
                      controller.changeCount(false);
                    },
                    colorborder: controller.count.value == 1
                        ? AppColors.mainGreyColor
                        : AppColors.mainOrangeColor,
                    colorbouttom: controller.count.value == 1
                        ? AppColors.mainGreyColor
                        : AppColors.mainOrangeColor,
                    colortext: controller.count.value == 1
                        ? AppColors.mainOrangeColor
                        : AppColors.mainGreyColor,
                  ),
                ),
              ],
            );
          }),
          Obx(() {
            return Text(
              controller.calcTotal().toString(),
              style: TextStyle(fontSize: screenWidth(10)),
            );
          }),
          custom_button(
            text: 'add',
            colorborder: AppColors.mainGreyColor,
            colortext: AppColors.mainTextColor,
            colorbouttom: AppColors.mainGreyColor,
            onPressed: () {
              controller.addToCart();
              Get.to(() => CartView());
            },
          )
        ],
      )),
    );
  }
}
