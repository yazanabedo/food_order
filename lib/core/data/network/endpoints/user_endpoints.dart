import 'package:food_ordering_sp2/core/data/network/network_config.dart';

class UserEndpoints {
  static String login = NetworkConfig.getFullApiUrl('user/login');
    static String Register = NetworkConfig.getFullApiUrl('user/Register');
    static String ForgotPassword = NetworkConfig.getFullApiUrl('user/ForgotPassword');



}
