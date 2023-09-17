import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:food_ordering_sp2/core/data/models/apis/token_info.dart';
import 'package:food_ordering_sp2/core/data/models/common_response.dart';
import 'package:food_ordering_sp2/core/data/network/endpoints/user_endpoints.dart';
import 'package:food_ordering_sp2/core/data/network/network_config.dart';
import 'package:food_ordering_sp2/core/enums/request_type.dart';
import 'package:food_ordering_sp2/core/utils/network_util.dart';

class UserRepository {
  Future<Either<String, TokenInfo>> login({
    required String email,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndpoints.login,
        body: {
          'userName': email,
          'password': password,
        },
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }



  Future<Either<String, dynamic>> register({
  required String email,
  required String password,
  required String firstName,
  required String lastName,
 
}) async {
  try {
    return NetworkUtil.sendMultipartRequest(
      type: RequestType.MULTIPART,
      url: UserEndpoints.Register,
      fields: {
        'Email': email,
        'FirstName': firstName,
        'LastName': lastName,
        'Password': password,
        
      
      },
      headers: NetworkConfig.getHeaders(needAuth: false),
    ).then((response) {
      CommonResponse<Map<String, dynamic>> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
      } else {
        return Left(commonResponse.message ?? '');
      }
    });
  } catch (e) {
    BotToast.showText(text: e.toString());
    return Left(e.toString());
  }
}


}





Future<Either<String, String>> ForgotPassword({
  required String email1,
}) async {
  try {
    return NetworkUtil.sendRequest(
      type: RequestType.POST,
      url: UserEndpoints.ForgotPassword,
    params:{'email1':'$email1'}, 
      
      headers: NetworkConfig.getHeaders(needAuth: false),
    ).then((response) {
      CommonResponse<Map<String, dynamic>> commonResponse =
          CommonResponse.fromJson(response);

      if (commonResponse.getStatus) {
        return Right(response);
      } else {
        return Left(commonResponse.message ?? '');
      }
    });
  } catch (e) {
    return Left(e.toString());
  }
}
