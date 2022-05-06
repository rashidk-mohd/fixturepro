import 'dart:convert';

import 'package:fixture_pro/model/http_exception.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier{
  String? _token;
  DateTime? _expireDate;
  String? userid;
  bool get isAuth{
    return token !=null;
  }
String get token{
  if(_expireDate!=null && _expireDate!.isAfter(DateTime.now()) && _token!=null){
    return token;
  }
  return '';
  
}





  Future<void>_authenticate(String email,String password,String urlsegment)async{
    final url=Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:$urlsegment?key=AIzaSyB7Yre0Hk2xEYwTmPwIaBRt63810YnOc44');
    try{
       final response=await http.post(url,body: json.encode({
      'email':email,
      'password':password,
      'returnSecureToken':true
    }));
final responseData=json.decode(response.body);
if(responseData['error']!=null){
  throw HttpException(responseData['error']['message']);
}
     final  _token=responseData['idToken'];
      final  userid=responseData['localid'];
     final  _expireDate=DateTime.now().add(Duration(seconds: int.parse(responseData['expiresIn'])));
   
    }catch(error){
      throw error;
    }
  
  }

  Future<void>signUp(String email,String password)async{
  return  _authenticate(email, password, 'signUp');

  }
  Future<void>login(String email,String password)async{
  return  _authenticate(email, password, 'signInWithPassword');
    
  }
}