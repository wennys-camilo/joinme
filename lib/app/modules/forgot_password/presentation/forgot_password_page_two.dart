import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import '../../../shared/presentation/widgets/rounded_button_widget.dart';

class ForgorPasswordPageTwo extends StatelessWidget {
  const ForgorPasswordPageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Nova senha enviada com sucesso!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 40),
                child: Text(
                  'Verifique seu e-mail e faça login com a nova senha!',
                ),
              ),
              Container(child: Lottie.asset('assets/images/lottieLogo1.json')),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 78, 30, 20),
                child: RoundedButtonWidget(
                  width: MediaQuery.of(context).size.width,
                  onPressed: () => Modular.to.navigate('/login/'),
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
                          onPressed: () {},
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
