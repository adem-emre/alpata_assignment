import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper{
  final _tokenKey = "Token";

  Future<String?> getToken() async {
    final shared = await SharedPreferences.getInstance();
    return shared.getString(_tokenKey);
  }

  Future<bool> setToken(String token) async {
    final shared = await SharedPreferences.getInstance();
    final result = shared.setString(_tokenKey, token);
    return result;
  }


}