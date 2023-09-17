import 'package:dartz/dartz.dart';
import 'package:food_ordering_sp2/core/data/models/apis/token_info.dart';
import 'package:food_ordering_sp2/core/data/models/common_response.dart';
import 'package:food_ordering_sp2/core/data/network/endpoints/user_endpoints.dart';
import 'package:food_ordering_sp2/core/data/network/network_config.dart';
import 'package:food_ordering_sp2/core/enums/request_type.dart';
import 'package:food_ordering_sp2/core/utils/network_util.dart';

import '../models/apis/getprofile.dart';
import '../network/endpoints/GetProfile_endpoint.dart';
import '../network/endpoints/category_endpoints.dart';

class ProfileRepository {


  Future<Either<String, GetProfile>> Get_Profil()
   
  
   async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ProfileEndpoints.ViewProfile,
      
        headers: NetworkConfig.getHeaders(needAuth: true),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse = CommonResponse.fromJson(response);
           

        if (commonResponse.getStatus) {


          return Right(GetProfile.fromJson(commonResponse.data ?? {}));


        } 
        else {


          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }





}
