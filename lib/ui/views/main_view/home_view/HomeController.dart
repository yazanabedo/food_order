import 'package:food_ordering_sp2/core/data/models/apis/category_model.dart';
import 'package:food_ordering_sp2/core/enums/message_type.dart';
import 'package:food_ordering_sp2/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';
import '../../../../core/data/models/apis/Meal _Model.dart';
import '../../../../core/data/repositories/Meal_Repository.dart';
import '../../../../core/data/repositories/category_repositories.dart';
import '../../../../core/enums/operation_type.dart';
import '../../../../core/enums/request_status.dart';
import '../../../../core/services/base_controller.dart';
import '../../../../core/services/cart_serves.dart';
import '../../../shared/utils.dart';

class HomeController extends BaseController {
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxList<MealModel> mealList = <MealModel>[].obs;
   
   


  bool get isCategoryLoading => requestStatus.value == RequestStatus.LOADING &&operationType == OperationType.CATEGORY;
     
      

  bool get isMealLoading =>
      requestStatus.value == RequestStatus.LOADING &&
      operationType == OperationType.MEAL;

 
  
  @override
  void onInit() {
    getAllGategory();
    getAllmeal();
    super.onInit();
  }

 

  void getAllGategory() {
    runLoadingFutureFunction(
        type: OperationType.CATEGORY,
        function: CategoryRepository().getAll().then((value) {
          value.fold((l) {
            CustomToast.showMeassge(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            categoryList.addAll(r);
          });
        }));
  }

  void getAllmeal() {
    runLoadingFutureFunction(
        type: OperationType.MEAL,
        function: MealRepository().getAll().then((value) {
          value.fold((l) {
            CustomToast.showMeassge(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            mealList.addAll(r);
          });
        }));
  }

  void addToCart(MealModel model) {
    cartService.addToCart(
        model: model,
        count: 1,
        afterAdd: () {
          CustomToast.showMeassge(
              message: 'Added', messageType: MessageType.SUCCSESS);
        });
  }
}
