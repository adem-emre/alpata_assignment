import 'package:alpata_assignment/core/utils/functions.dart';
import 'package:alpata_assignment/features/auth/service/auth_service.dart';
import 'package:flutter/cupertino.dart';

class LoginNotifier extends ChangeNotifier {
  String? _errorStr;
  String? get errorStr => _errorStr;
  final AuthService _authService = AuthService();

  late String userMail;
  late String password;

  Future<bool> login() async {
    try {
      final success = await _authService.login(userMail, password);
      return success;
    } catch (e) {
      _errorStr = checkAndReturnErrorMessage(e);
      return false;
    }
  }
}
