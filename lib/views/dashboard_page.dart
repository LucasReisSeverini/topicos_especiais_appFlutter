import 'package:flutter/material.dart';
import 'package:multi_app2/components/app_bar.dart';
import 'package:multi_app2/controllers/auth_controller.dart';
import 'package:multi_app2/shared/app_constants.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context,
      title: AppConstants.appName,
      actions: [
        PopupMenuButton(
          itemBuilder: (context)=> [
            PopupMenuItem(
              child: Text('Sair'),
              onTap: () async{
                //Logout
                final navigator = Navigator.of(context);
                bool logout = await AuthController.instance.Logout();
                if(logout){
                  navigator.pushReplacementNamed('/');
                }
              },
              )

        ]
        )
      ]
      ),
    );
  }
}