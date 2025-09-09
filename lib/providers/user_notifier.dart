import 'package:flutter/material.dart';
import 'package:multi_app2/controllers/user_controller.dart';
import 'package:multi_app2/models/user.dart';

class UserNotifier extends ChangeNotifier {
  User? _user;
  
  //getter
  User? get user => _user;

  //carregar o user logado
  Future<void> loadUser() async{
    try{
      _user = await UserController.instance.loggedUser;
      notifyListeners();
    }catch(e){
      _user = null;
      notifyListeners();
    }
  }

  //logout
  void logout(){
    _user = null;
    notifyListeners();
  }

}