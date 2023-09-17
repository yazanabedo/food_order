import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:food_ordering_sp2/core/data/models/notification_model.dart';
import 'package:food_ordering_sp2/core/enums/application_state.dart';
import 'package:food_ordering_sp2/core/enums/notification_type.dart';
import 'package:food_ordering_sp2/firebase_options.dart';
import 'package:food_ordering_sp2/ui/shared/utils.dart';
import 'package:get/utils.dart';

class NotificationService {
  StreamController<NotificationModel> notificationStream =
      StreamController.broadcast();

  NotificationService() {
    onInit();
  }

  void onInit() async {
    try {
    

      final fcmToken = await FirebaseMessaging.instance.getToken();
      print(fcmToken);

      //!--- Here to call api ----

      FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
        // TODO: If necessary send token to application server.

        // Note: This callback is fired at each app startup and whenever a new
        // token is generated.
        //!--- Here to call api ----
      }).onError((err) {
        // Error getting token.
      });

      if (GetPlatform.isIOS) {
        FirebaseMessaging messaging = FirebaseMessaging.instance;

        NotificationSettings settings = await messaging.requestPermission(
          alert: true,
          provisional: true,
          sound: true,
          badge: true,
          carPlay: false,
          criticalAlert: false,
        );

        // if (settings.authorizationStatus == AuthorizationStatus.denied) {

        // }
      }

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        NotificationModel model = NotificationModel.fromJson(message.data);
        handelNotification(
            model: model, applicationState: ApplicationState.FOREGROUND);
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        NotificationModel model = NotificationModel.fromJson(message.data);
        handelNotification(
            model: model, applicationState: ApplicationState.BACKGROUND);
      });
    } catch (e) {
      print(e);
    }
  }

  void handelNotification(
      {required NotificationModel model,
      required ApplicationState applicationState}) {
    notificationStream.add(model);
    if (model.notificatioNType == NotificationType.SUBSECRIPTION.name) {
      storage.setSubStatus(model.model == '1' ? true : false);
    }
  }
}
