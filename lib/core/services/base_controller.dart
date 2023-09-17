import 'package:bot_toast/bot_toast.dart';
import 'package:food_ordering_sp2/core/enums/operation_type.dart';
import 'package:food_ordering_sp2/core/enums/request_status.dart';
import 'package:get/get.dart';
import '../../ui/shared/utils.dart';
import '../data/repositories/user_repository.dart';
import 'cart_serves.dart';

class BaseController extends GetxController {
  UserRepository userRepository = Get.put(UserRepository());

  Rx<RequestStatus> requestStatus = RequestStatus.DEFUALT.obs;
  RxList<OperationType> operationType = <OperationType>[].obs;

  Future runFutureFunction({required Future function}) async {
    checkConnection(() async {
      await function;
    });
  }

  Future runLoadingFutureFunction(
      {required Future function,
      OperationType? type = OperationType.NONE}) async {
    checkConnection(() async {
      requestStatus.value = RequestStatus.LOADING;
      operationType.add(type!);
      await function;
      requestStatus.value = RequestStatus.DEFUALT;
      operationType.remove(type);
    });
  }

  Future runFullLoadingFunction({
    required Future function,
  }) async {
    checkConnection(() async {
      customLoader();
      await function;
      BotToast.closeAllLoading();
    });
  }
}
