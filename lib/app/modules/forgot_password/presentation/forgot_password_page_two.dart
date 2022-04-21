import 'package:camp_final/app/shared/presentation/themes/app_theme.dart';
import 'package:camp_final/app/shared/presentation/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

class ForgorPasswordPageTwo extends StatelessWidget {
  const ForgorPasswordPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () => Modular.to.pop(),
              child: Icon(
                Icons.arrow_back,
                color: AppTheme.colors.primary,
                size: 40,
              )),
          backgroundColor: AppTheme.colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: Form(
          child: ListView(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 90, 30, 9),
                  child: Text(
                    'Nova senha enviada com sucesso!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 40),
                  child: Text(
                    'Verifique seu e-mail e faça login com a nova senha!',
                  ),
                ),
              ),
              Container(child: Lottie.asset('assets/images/lottieLogo1.json')),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 78, 30, 20),
                child: RoundedButtonWidget(
                  onPressed: () => Modular.to.pushReplacementNamed('./login'),
                  textButton: 'ACESSAR SUA CONTA',
                  styleText: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Não recebeu a senha?',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      TextButton(
                          onPressed: () { },
                          child: const Text('Reenvie aqui!',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
