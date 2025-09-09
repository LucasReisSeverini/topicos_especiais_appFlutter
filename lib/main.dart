import 'package:flutter/material.dart';
import 'package:multi_app2/providers/user_notifier.dart';
import 'package:multi_app2/shared/app_constants.dart';
import 'package:multi_app2/shared/app_theme.dart';
import 'package:multi_app2/views/dashboard_page.dart';
import 'package:multi_app2/views/home_page.dart';
import 'package:multi_app2/views/login_page.dart';
import 'package:multi_app2/views/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserNotifier())
      ],
      child: MyApp(),
      )
  );
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
        '/':(context) => SplashScreen(),
        '/home':(context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/dashboard': (context)=> DashboardPage()
      },

    );
  }
}