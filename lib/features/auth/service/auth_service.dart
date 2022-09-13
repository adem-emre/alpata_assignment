import 'package:alpata_assignment/core/auth/auth_manager.dart';
import 'package:alpata_assignment/core/network/base_network.dart';
import 'package:alpata_assignment/features/auth/models/login_response.dart';
import 'package:alpata_assignment/features/auth/models/token_response.dart';
import 'package:alpata_assignment/helper/shared_helper.dart';
import 'package:uuid/uuid.dart';

class AuthService extends BaseNetwork {
  Future<bool> login(String userMail, String password) async {
    final requestId = const Uuid().v4();
    final response = await basePost<LoginResponse>(
        "Authentication/KullaniciGiris/KullaniciGirisYap",
        {"kullaniciAdi": userMail, "sifre": password, "requestId": requestId},
        LoginResponse.fromJson);
    final tokenBody = {
      "requestId": requestId,
      "authToken": response.token,
      "authCode": response.authType
    };

    final oAuthToken = await basePost<TokenResponse>(
        "Authentication/KullaniciGiris/OAuthToken",
        tokenBody,
        TokenResponse.fromJson);
    final sharedHelper = SharedHelper();
    if (oAuthToken.token != null) {
      await sharedHelper.setToken(oAuthToken.token!);
      AuthManager.token = oAuthToken.token;
      return true;
    }
    return false;
  }
}
