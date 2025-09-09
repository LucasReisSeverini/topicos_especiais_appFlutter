import 'dart:convert';

import 'package:multi_app2/models/user.dart';
import 'package:multi_app2/shared/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserController {
  static final UserController instance = UserController();
  late SharedPreferences _sharedPreferences;

  Future<User> get loggedUser async {
    _sharedPreferences = await SharedPreferences.getInstance();
    final userId = _sharedPreferences.getInt('userId');

    if(userId==null){
      throw Exception('Nenhum usuario logado');
    }

    return getByid(userId);
  } 

  Future<User> getByid (int id)async{
    //id
    //TOken de Autorização

    _sharedPreferences = await SharedPreferences.getInstance();
    http.Response response = await http.get(
      Uri.parse('${AppConstants.baseAuthApiUrl}users/${id.toString()}',),
      headers: <String, String>{
      'Authorization': 'Bearer ${_sharedPreferences.getString('acessToken')}',
      'Content-Type': 'application/json'
    },
    );
    print(json.decode(response.body));
    if(response.statusCode == 200){
      //Retorna instancia de usuario
      return User.fromJson(json.decode(response.body));
    }else{
      throw Exception('falha ao  buscar usuario');
    }
  }
}