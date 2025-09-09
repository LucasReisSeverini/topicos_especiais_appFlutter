import 'package:flutter/material.dart';
import 'package:multi_app2/components/app_button.dart';
import 'package:multi_app2/components/custom_snack_bar.dart';
import 'package:multi_app2/components/custom_text_field.dart';
import 'package:multi_app2/controllers/auth_controller.dart';
import 'package:multi_app2/providers/user_notifier.dart';
import 'package:multi_app2/shared/app_constants.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
   final messenger = ScaffoldMessenger.of(context);
   final navigator = Navigator.of(context);
    if (_formKey.currentState!.validate()) {
      bool login = await AuthController.instance.login(
        _usernameController.text,
        _passwordController.text,
      );

      if(login){
        // Navegação
        context.read<UserNotifier>().loadUser();
        navigator.pushReplacementNamed('/dashboard');
      }else{
        messenger.showSnackBar(
          customSnackBar(
            message: 'As crendencias informadas estão incorretas',
            backgroundColor: Color(0xffff6b6b),
            icon: Icons.error_outline
          )
        );
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(AppConstants.appLoginMsg, textAlign: TextAlign.center),
              CustomTextField(
                label: 'Usuário',
                hint: 'Digite seu usuário',
                controller: _usernameController,
                prefixIcon: Icon(Icons.person_2_outlined),
                validator: (username) {
                  if (username == null || username.isEmpty) {
                    return 'Preencha o campo username corretamente';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              CustomTextField(
                label: 'Senha',
                hint: 'Digite sua senha',
                controller: _passwordController,
                prefixIcon: Icon(Icons.lock_outlined),
                obscureText: _obscureText,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                validator: (password) {
                  if (password == null || password.isEmpty) {
                    return 'Preencha o campo senha corretamente';
                  }
                  
                  return null;
                },
                onFieldSubmitted: (_){
                _login();
              },
             
              ),
              const SizedBox(height: 16.0),
              AppButton(text: 'Entrar', onPressed: _login ),
            ],
          ),
        ),
      ),
    );
  }
}
