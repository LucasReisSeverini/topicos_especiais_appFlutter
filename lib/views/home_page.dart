import 'package:flutter/material.dart';
import 'package:multi_app2/components/app_button.dart';
import 'package:multi_app2/shared/app_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.0),
        //colunas ocupam sempre a maior altura possivel e a menor largura possivel
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //centraliza a coluna verticalmente (altura)
          crossAxisAlignment: CrossAxisAlignment.stretch, //centraliza horizental (largura)
          children: [
            Icon(
              Icons.dashboard,
              size: 100,
              color: Theme.of(context).primaryColor, //cor definida no tema app_theme.dart
            ),
            Text(
              AppConstants.appName, //pegando o nome do app_contants
              textAlign: TextAlign.center, //alinhando o texto no centro
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold, //colocando um tema q ja existe mas mudando do meu jeito
                color: Theme.of(context).primaryColor //colocando a cor primaria definida no app_theme

              ),
            ),
            Text(
              AppConstants.appSlogan,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor
              ),

            ),
            const SizedBox(height: 40), // ditancia do texto para o botao de acordo com o parametro é 40 pixel de altura
            AppButton(
              text: 'Entrar', //botao foi tirado do app_button criado no componetns
              onPressed: (){},
            ),
            const SizedBox(height: 24), // ditancia um botao do outro na altura como colocado no parametro
              AppButton(
              text: 'Cadastrar-se',
              onPressed: (){},
            )

          ],
        ),
        ), //espaçamento interno dentro do widget 24 pixels
    );
  }
}