import 'package:camp_final/app/shared/presentation/themes/app_theme.dart';
import 'package:camp_final/app/shared/presentation/widgets/input_text_widget.dart';
import 'package:camp_final/app/shared/presentation/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:validatorless/validatorless.dart';

class ForgotPasswordPageOne extends StatelessWidget {
  const ForgotPasswordPageOne({Key? key}) : super(key: key);

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
              Container(
                height: MediaQuery.of(context).size.height / 7,
                margin: const EdgeInsets.fromLTRB(100, 50, 100, 30),
                child: SvgPicture.asset(AppTheme.images.joinmeLogo),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 8, 30, 9),
                child: Text(
                  'Esqueceu a senha?',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 40),
                child: Text(
                  'Não se preocupe, acontece! Digite seu e-mail abaixo que vamos enviar uma nova senha.',
                ),
              ),
              InputTextWidget(
                labelText: 'Seu e-mail',
                hintText: 'Email',
                // onChanged: store.onChangeEmail,
                validator: Validatorless.multiple(
                  [
                    Validatorless.email('E-mail invalido'),
                    Validatorless.required('Campo obrigatório')
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 120, 30, 20),
                child: RoundedButtonWidget(
                  onPressed: () => Modular.to.navigate('/pageTwo/'),
                  textButton: 'ENVIAR',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
