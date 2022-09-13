import 'dart:io';

import 'package:alpata_assignment/const/api_const.dart';
import 'package:alpata_assignment/core/auth/auth_manager.dart';
import 'package:alpata_assignment/core/model/base_response_model.dart';
import 'package:dio/dio.dart';

class BaseNetwork{
  final Dio dio = Dio(BaseOptions(
    headers: {
        "accept": "*/*",
        "Content-Type": "application/json",
        if(AuthManager.token != null)"Authorization":"Bearer ${AuthManager.token!}"
      },baseUrl: ApiConst.baseUrl));

  

  Future<T> basePost<T extends BaseResponseModel>(String endPoint,Map<String,dynamic> requestBody, T Function(Map<String, dynamic>) parser,{Map<String, dynamic>? queryParameters}) async {
    final response = await dio.post(endPoint,
    data: requestBody,
    queryParameters:queryParameters 
   );
    
    if (response.statusCode == HttpStatus.ok) {
        final responseModel = parser(response.data);
        return responseModel;
    }
    else{
      throw Exception("An error occured: ${response.statusCode}");
    }
    
  }

}