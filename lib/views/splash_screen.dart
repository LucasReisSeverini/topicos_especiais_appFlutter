import 'package:flutter/material.dart';
import 'package:multi_app2/components/responsive_container.dart';
import 'package:multi_app2/controllers/auth_controller.dart';
import 'package:multi_app2/providers/user_notifier.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    //Verificação de token
    _init();
  }

  Future<void> _init() async{

    final currentContext = context.read<UserNotifier>();

    //Delay forçado
    await Future.delayed(Duration(milliseconds: 3000));

    bool hasToken = await AuthController.instance.verifyToken();

    if(hasToken){
      await currentContext.loadUser();
    }

    if(!mounted) return;


    Navigator.of(context).pushReplacementNamed(hasToken ? '/dashboard' : '/home');

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveContainer(
        child: Center(
          child: Column(
            children: [
              CircularProgressIndicator(),
              Text('Carregando...')
              
            ],
          ),
        ),
      ),
    );
  }
}