import 'package:flutter/material.dart';
import 'package:multi_app2/shared/app_constants.dart';
import 'package:multi_app2/shared/app_theme.dart';
import 'package:multi_app2/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme, // carega o tema
      darkTheme: AppTheme.darkTheme, //carrega o tema dark
      themeMode: ThemeMode.system, //escolhe o tema que vai ser usado
      debugShowCheckedModeBanner: false, //tira debug da tela do chrome
      initialRoute: '/',
      routes: {
        '/':(context) => HomePage(),
      },

    );
  }
}