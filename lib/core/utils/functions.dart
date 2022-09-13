
import 'dart:io';

String checkAndReturnErrorMessage(Object e){
  if(e is SocketException ){
    return "Lütfen internet bağlantınızı kontrol edin";
  }
  return e.toString();
}