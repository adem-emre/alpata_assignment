import 'package:alpata_assignment/core/model/base_response_model.dart';

class LoginResponse implements BaseResponseModel {
  String? token;
  String? authType;

  LoginResponse({this.token, this.authType});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    authType = json['authType'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['authType'] = authType;
    return data;
  }
}
