import 'package:alpata_assignment/core/model/base_response_model.dart';

class TokenResponse implements BaseResponseModel {
  String? token;

  TokenResponse({this.token});

  TokenResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }
}
