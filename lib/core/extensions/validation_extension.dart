
import 'package:flutter/cupertino.dart';

extension ValidateExtension on BuildContext{

  String? validateIsEmpty(String? value){
    if(value !=null && value.isNotEmpty){
      return null;
    }
    return "Bu alan boş geçilemez";
  }

}