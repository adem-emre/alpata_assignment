import 'package:alpata_assignment/helper/shared_helper.dart';

class AuthManager {
  static String? token;
  

  static Future<bool> getToken() async {
    token = await SharedHelper().getToken();
    return token != null;
  }
}
