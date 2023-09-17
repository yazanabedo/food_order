import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../app/my_app_controller.dart';
import '../../core/data/repositories/shared_prefreance_repository.dart';
import '../../core/enums/connectivity_status.dart';
import '../../core/enums/message_type.dart';
import '../../core/services/cart_serves.dart';
import '../../core/services/connectivity_service.dart';
import '../../core/services/location_service.dart';
import '../../core/services/notification_service.dart';
import 'colors.dart';
import 'custom_widgets/custom_toast.dart';

bool isEmail(String value) {
  RegExp regExp = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return regExp.hasMatch(value);
}

bool isPasswordValid(String value) {
  RegExp regExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  return regExp.hasMatch(value);
}

double screenWidth (double perecent){
return Get.size.width/perecent;
}
ConnectivityService get connectivityService => Get.find<ConnectivityService>();


bool get isOnline =>
    Get.find<MyAppController>().connectionStatus == ConnectivityStatus.ONLINE;



double screenHeight (double perecent){
return Get.size.height/perecent;
}

SharedPrefranceRepository get storage => 
Get.find<SharedPrefranceRepository>();

CartService get cartService => Get.find<CartService>();

LocationService get locationService => Get.find<LocationService>();
NotificationService get notificationService => Get.find<NotificationService>();


void fadeInTransition(Widget view) {
  Get.to(view, transition: Transition.fadeIn);
}

void customLoader() => BotToast.showCustomLoading(toastBuilder: (builder) {
      return Container(
        width: screenWidth(5),
        height: screenWidth(5),
        decoration: BoxDecoration(
            color: AppColors.mainBlackColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15)),
        child: SpinKitCircle(color: AppColors.mainOrangeColor),
      );
    });
double get taxAmount => 0.18;
double get deliveryAmount => 0.1;

void checkConnection(Function function) {
  if (isOnline)
    function();
  else
    CustomToast.showMeassge(
        message: 'Please check internet connection',
        messageType: MessageType.WARNING);
}

