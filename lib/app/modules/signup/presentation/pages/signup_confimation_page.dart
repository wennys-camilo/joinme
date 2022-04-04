import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../shared/presentation/themes/app_theme.dart';
import '../../../../shared/presentation/widgets/rounded_button_widget.dart';

class SignupConfirmationPage extends StatelessWidget {
  const SignupConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                color: AppTheme.colors.grey,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_outlined,
                size: 90,
                color: AppTheme.colors.white,
              ),
            ),
          ),
          Text(
            'Bem vindo!',
            style: TextStyle(
                color: AppTheme.colors.primary,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Sua conta foi criada!',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 50,
          ),
          RoundedButtonWidget(
            onPressed: () => Modular.to.navigate('/login/'),
            textButton: 'Próximo',
          )
        ],
      ),
    );
  }
}
