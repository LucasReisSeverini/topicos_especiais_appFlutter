import 'package:flutter/material.dart';
import 'package:multi_app2/components/app_bar.dart';
import 'package:multi_app2/controllers/auth_controller.dart';
import 'package:multi_app2/controllers/user_controller.dart';
import 'package:multi_app2/models/user.dart';
import 'package:multi_app2/shared/app_constants.dart';
import 'package:multi_app2/views/profile_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  User? _loggedUser;

  @override
  initState(){
    _getLoggedUser();
    super.initState();
  }

  Future<void> _getLoggedUser() async{
    User user = await UserController.instance.loggedUser;
    if(mounted){
      setState(() {
        _loggedUser = user;
      });
    }
  }

  @override
  void dispose(){
    _loggedUser = null;
    super.dispose();
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context,
      title: AppConstants.appName,
      actions: [
        PopupMenuButton(
          itemBuilder: (context)=> [
            PopupMenuItem(child: Text('Pefil'),
            onTap: (){
              if(_loggedUser != null){
                //navegue para tela de perfil
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(user: _loggedUser!)
                    )

                );
              }
            },
            
            ),
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

        ],
        child: Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: CircleAvatar(
          child:
            _loggedUser != null ? Image.network(_loggedUser!.image.toString()
            ): Icon(Icons.person, color: Colors.grey,), 
           
        ),
        )
        )
      ],
      
      )
    );
  }
}