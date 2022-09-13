import 'dart:io';

import 'package:alpata_assignment/const/api_const.dart';
import 'package:alpata_assignment/core/auth/auth_manager.dart';
import 'package:alpata_assignment/core/model/base_response_model.dart';
import 'package:dio/dio.dart';

class BaseNetwork{
  final Dio dio = Dio(BaseOptions(baseUrl: ApiConst.baseUrl));

  

  Future<T> basePost<T extends BaseResponseModel>(String endPoint,Map<String,dynamic> requestBody, T Function(Map<String, dynamic>) parser) async {
    final response = await dio.post(endPoint,
    data: requestBody,
    options: Options(
      
      headers: {
        "accept": "*/*",
        "Content-Type": "application/json",
        if(AuthManager.token != null)"Authorization":"Bearer ${AuthManager.token!}"
      }, 
    ));
    
    if (response.statusCode == HttpStatus.ok) {
        final responseModel = parser(response.data);
        return responseModel;
    }else{
      throw Exception("An error occured: ${response.statusCode}");
    }
    
  }

}