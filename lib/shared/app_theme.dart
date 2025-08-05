import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme{
    return ThemeData(
      useMaterial3: true, //usar a versão 3 do material
      brightness: Brightness.light, //define a cor que vai ser baseado o tema
      scaffoldBackgroundColor: Colors.white, //cor de fundo
      primaryColor: Colors.blue[800]
    );
  }

  static ThemeData get darkTheme{
    return ThemeData(
      useMaterial3: true, //usar a versão 3 do material
      brightness: Brightness.dark, //define a cor que vai ser baseado o tema
      scaffoldBackgroundColor: Colors.black87, //cor de fundo
      primaryColor: Colors.white60
    );
  }

}