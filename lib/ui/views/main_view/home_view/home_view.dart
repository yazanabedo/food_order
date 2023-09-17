import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_ordering_sp2/ui/shared/colors.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import '../../../../core/services/cart_serves.dart';
import '../../../../core/translation/app_translation.dart';
import '../../../shared/custom_widgets/custom_button.dart';
import '../../../shared/custom_widgets/custom_text_field.dart';
import '../../../shared/utils.dart';
import '../../map_view/map_view.dart';
import '../../mealdetails/mealdetails.dart';
import 'HomeController.dart';

class HomeView extends StatefulWidget {
  final Function onPressed;
  HomeView({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());

  TextEditingController Search = TextEditingController();



  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: screenWidth(50), vertical: screenWidth(50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr("Key_Good morning"),
                      style: TextStyle(fontSize: screenWidth(20)),
                    ),
                    Icon(
                      Icons.shopping_cart,
                      size: screenWidth(12),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: screenWidth(8), start: screenWidth(20)),
                child: Text(tr("Key_Delivering to"),
                    style: TextStyle(color: Colors.grey.shade500)),
              ),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: screenWidth(20), vertical: screenWidth(6)),
                child: InkWell(
                  onTap: () async{
              LocationData? currentLocation=await locationService.getCurrentLocation();
              
              
if(currentLocation!=null)
              Get.to(() => 
              (
                MapView(currentLocation: currentLocation,)
            ));
            },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tr("Key_Current Location"),
                        style: TextStyle(
                            fontSize: screenWidth(20),
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.only(end: screenWidth(2.6)),
                        child: Icon(
                          Icons.expand_more_outlined,
                          size: screenWidth(15),
                          color: AppColors.mainOrangeColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: screenWidth(4)),
                child: CustomTextField(
                  hitText: tr("Key_Search food"),
                  controller: Search,
                  prefixIcon: Icon(Icons.search, size: screenWidth(12)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(top: screenHeight(4)),
                child: Column(
                  children: [
                    Obx(() {
                      return controller.isCategoryLoading
                          ? SpinKitCircle(
                              color: AppColors.mainOrangeColor,
                            )
                          : Expanded(
                              child: controller.categoryList.isEmpty
                                  ? Text('No Category')
                                  : ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: controller.categoryList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl:
                                                  'http://via.placeholder.com/350x150',
                                              placeholder: (context, url) =>
                                                  CircularProgressIndicator(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            ),
                                            Text(
                                              controller.categoryList[index]
                                                      .name ??
                                                  '',
                                              style: TextStyle(fontSize: 50),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                            );
                    }),
                    Obx(() {
                      return controller.isCategoryLoading
                          ? SpinKitCircle(
                              color: AppColors.mainOrangeColor,
                            )
                          : Expanded(
                              child: controller.mealList.isEmpty
                                  ? Text('No Meal')
                                  : ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: controller.mealList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InkWell(
                                          onTap: () {
                                            Get.to(MealDetailsView(
                                                model: controller
                                                    .mealList[index]));
                                          },
                                          child: Column(
                                            children: [
                                              CachedNetworkImage(
                                                imageUrl:
                                                    'http://via.placeholder.com/350x150',
                                                placeholder: (context, url) =>
                                                    CircularProgressIndicator(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                              Text(
                                                controller
                                                        .mealList[index].name ??
                                                    '',
                                                style: TextStyle(fontSize: 50),
                                              ),
                                              Text(
                                                controller.mealList[index].price
                                                    .toString(),
                                                style: TextStyle(fontSize: 50),
                                              ),
                                           Obx((){
                                            return    Row(
                                                children: [
                                                  Text(
                                                    controller.mealList[index].name ??'',
                                                            
                                                        
                                                    style:
                                                        TextStyle(fontSize: 50),
                                                  ),
                                                  SizedBox(width: screenWidth(5),
                                                    child: custom_button(
                                                      text: '+',
                                                      onPressed: () {
                                                        controller.addToCart(controller.mealList[index]);
                                                            
                                                                
                                                      },
                                                      colorborder: AppColors
                                                          .mainOrangeColor,
                                                      colorbouttom: AppColors
                                                          .mainOrangeColor,
                                                      colortext: AppColors
                                                          .mainWhiteColor,
                                                    ),
                                                  ),
                                                  
                                                 Obx(() {
                                                  return SizedBox( width: screenWidth(5),
                                                      child: custom_button(
                                                              text:  '${cartService.cartCount}',
                                                        onPressed: () { },
                                                        colorborder: AppColors
                                                            .mainOrangeColor,
                                                        colorbouttom: AppColors
                                                            .mainOrangeColor,
                                                        colortext: AppColors
                                                            .mainWhiteColor,
                                                      ),
                                                    );
                                                 })
                                                
                                                ],
                                              );
                                           })
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                            );
                    }),
                  ],
                ),
              )

              // Padding(
              //   padding: EdgeInsets.only(top: size.width * 0.5),
              //   child: FutureBuilder<List<dynamic>>(
              //       future: Future.wait([
              //         CategoryRepository().getAll(),
              //         MealRepository().getAll(),
              //       ]),
              //       builder: ((context, AsyncSnapshot<List<dynamic>> snapshot1) {
              //         var categories = snapshot1.data != null
              //             ? snapshot1.data![0]
              //                 as dartz.Either<String, List<CategoryModel>>
              //             : null;

              //         var meals = snapshot1.data != null
              //             ? snapshot1.data![1]
              //                 as dartz.Either<String, List<MealModel>>
              //             : null;

              //         if (snapshot1.connectionState != ConnectionState.waiting) {
              //           categories!.fold((l) {
              //             CustomToast.showMeassge(

              //                 message: l,
              //                 messageType: MessageType.REJECTED);
              //           }, (r) {
              //             categoryList.clear();
              //             categoryList.addAll(r);
              //           });

              //           meals!.fold((l) {
              //             CustomToast.showMeassge(

              //                 message: l,
              //                 messageType: MessageType.REJECTED);
              //           }, (r) {
              //             mealList.clear();
              //             mealList.addAll(r);
              //           });
              //         }

              //         return Column(
              //           children: [
              //             categories == null
              //                 ? SizedBox(
              //                     height: size.width * 0.30,
              //                     width: size.width,
              //                     child: ListView.builder(
              //                       scrollDirection: Axis.horizontal,
              //                       shrinkWrap: true,
              //                       itemCount: 15,
              //                       itemBuilder: (BuildContext context, int index) {
              //                         return Column(
              //                           children: [
              //                             Padding(
              //                               padding: const EdgeInsets.all(8.0),
              //                               child: Shimmer.fromColors(
              //                                   baseColor: Colors.grey.shade300,
              //                                   highlightColor: Colors.white,
              //                                   child: ClipRRect(
              //                                     borderRadius:
              //                                         BorderRadius.circular(
              //                                             size.width * 0.05),
              //                                     child: Container(
              //                                       height: size.width * 0.2,
              //                                       width: size.width * 0.2,
              //                                       color: Colors.grey,
              //                                     ),
              //                                   )),
              //                             ),
              //                             Padding(
              //                               padding: const EdgeInsets.all(2.0),
              //                               child: Shimmer.fromColors(
              //                                   baseColor: Colors.grey.shade300,
              //                                   highlightColor: Colors.white,
              //                                   child: ClipRRect(
              //                                     borderRadius:
              //                                         BorderRadius.circular(
              //                                             size.width * 0.05),
              //                                     child: Container(
              //                                       height: size.width * 0.025,
              //                                       width: size.width * 0.15,
              //                                       color: Colors.grey,
              //                                     ),
              //                                   )),
              //                             ),
              //                           ],
              //                         );
              //                       },
              //                     ),
              //                   )
              //                 : Container(
              //                     height: size.width * 0.45,
              //                     width: size.width,
              //                     child: ListView.builder(
              //                       scrollDirection: Axis.horizontal,
              //                       shrinkWrap: true,
              //                       itemCount: categoryList.length,
              //                       itemBuilder: (BuildContext context, int index) {
              //                         return Padding(
              //                           padding: EdgeInsets.all(10.0),
              //                           child: Container(
              //                             height: size.width * 0.2,
              //                             width: size.width * 0.2,
              //                             child: Column(
              //                               children: [
              //                                 ClipRRect(
              //                                   borderRadius: BorderRadius.circular(
              //                                       size.width * 0.05),
              //                                   child: CachedNetworkImage(
              //                                     imageUrl:
              //                                         'https://images.pexels.com/photos/2097090/pexels-photo-2097090.jpeg?auto=compress&cs=tinysrgb&w=600',
              //                                     placeholder: (context, url) =>
              //                                         CircularProgressIndicator() ,
              //                                     errorWidget: (context, url,
              //                                             error) =>
              //                                         Icon(Icons
              //                                             .wifi_tethering_error_outlined),
              //                                   ),
              //                                 ),
              //                                 Text(
              //                                   categoryList[index].name ?? '',
              //                                   style: TextStyle(
              //                                       fontSize: size.width * 0.03,
              //                                       fontWeight: FontWeight.bold),
              //                                 ),
              //                               ],
              //                             ),
              //                           ),
              //                         );
              //                       },
              //                     ),
              //                   ),
              //             meals == null
              //                 ? Padding(
              //                   padding:  EdgeInsetsDirectional.symmetric(vertical: 80),
              //                   child: SizedBox(
              //                       height: 500,
              //                       width: 1000,
              //                       child: ListView.builder(
              //                         scrollDirection: Axis.vertical,
              //                         shrinkWrap: true,
              //                         itemCount: 5,
              //                         itemBuilder: (BuildContext context, int index) {
              //                           return Shimmer.fromColors(
              //                               baseColor: Colors.grey.shade300,
              //                               highlightColor: Colors.white,
              //                               child: Column(
              //                                 children: [
              //                                   ClipRRect(
              //                                     borderRadius: BorderRadius.circular(
              //                                         size.width * 0.05),
              //                                     child: Padding(
              //                                       padding:
              //                                           const EdgeInsets.all(8.0),
              //                                       child: Container(
              //                                         height: 250,
              //                                         width: 1000,
              //                                         color: Colors.grey,
              //                                       ),
              //                                     ),
              //                                   ),

              //                                   Padding(
              //                                     padding: EdgeInsetsDirectional.only(top: 10, end: 150),
              //                                     child: ClipRRect(
              //                                       borderRadius: BorderRadius.circular( size.width * 0.05),

              //                                       child: Container(
              //                                         height: size.width * 0.05,
              //                                         width: size.width * 0.5,
              //                                         color: Colors.grey,
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 ],
              //                               ));
              //                         },
              //                       ),
              //                     ),
              //                 )
              //                 : Padding(
              //                     padding: EdgeInsetsDirectional.only(
              //                       start: size.width * 0.05,
              //                       end: size.width * 0.05,
              //                       bottom: size.width * 0.05,
              //                     ),
              //                     child: Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceBetween,
              //                       children: [
              //                         Text(
              //                           'Popular Restaurents',
              //                           style:
              //                               TextStyle(fontSize: size.width * 0.05),
              //                         ),
              //                         Text(
              //                           'View all',
              //                           style: TextStyle(
              //                               fontSize: size.width * 0.03,
              //                               color: AppColors.mainOrangeColor),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //             SizedBox(
              //               height: 300,
              //               width: 1000,
              //               child: ListView.builder(
              //                 scrollDirection: Axis.vertical,
              //                 shrinkWrap: true,
              //                 itemCount: mealList.length,
              //                 itemBuilder: (BuildContext context, int index) {
              //                   return Column(
              //                     children: [
              //                       SizedBox(width: 1000 ,height:250 ,
              //                         child: CachedNetworkImage(
              //                           imageUrl:
              //                               'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              //                           placeholder: (context, url) =>
              //                               CircularProgressIndicator(),
              //                           errorWidget: (context, url, error) =>
              //                               Icon(Icons.error),
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: EdgeInsets.only(
              //                             top: size.width * 0.02,
              //                             right: size.width * 0.65,
              //                             left: size.width * 0.01),
              //                         child: Text(
              //                           mealList[index].name ?? '',
              //                           style: TextStyle(
              //                               fontSize: 20,
              //                               fontWeight: FontWeight.bold),
              //                         ),
              //                       ),
              //                     ],
              //                   );
              //                 },
              //               ),
              //             ),
              //           ],
              //         );
              //       })),
              // ),
            ],
          )),
    );
  }
}
