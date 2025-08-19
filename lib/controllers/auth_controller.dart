import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:multi_app2/shared/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static final AuthController instance = AuthController();
  late SharedPreferences _sharedPreferences;

  Future<bool> login(String username, String password) async{
    http.Response response = await http.post(
      Uri.parse('${AppConstants.baseAuthApiUrl}auth/login'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(
        {
          'username': username,
          'password': password,
          'expiresInMins': 30
        }
      )
    );
    print(response.body);
    print(json.decode(response.body)['accessToken']);

    await _sharedPreferences.setInt('userId', json.decode(response.body)['id']);

    if(response.statusCode == 200){
      _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.setString('accessToken', json.decode(response.body)['accessToken']);
      return true;

    }else{
      return false;
    }

  }

  Future<bool> verifyToken() async{
    _sharedPreferences = await SharedPreferences.getInstance();
    String? token = _sharedPreferences.getString('accessToken');

    print(token);

    if(token == null){
      return false;
    }

    


    try{
      print(JwtDecoder.getExpirationDate(token));
      print(JwtDecoder.getRemainingTime(token));
      print(JwtDecoder.isExpired(token));
      print(JwtDecoder.decode(token));
      return !JwtDecoder.isExpired(token);
    }catch(e){
      return false;
    }



    
  }

  Future<bool> Logout() async{
    _sharedPreferences = await SharedPreferences.getInstance();
    await _sharedPreferences.remove('accessToken');
    await _sharedPreferences.clear();
    return true;
  }

}

