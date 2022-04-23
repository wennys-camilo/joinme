import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:validatorless/validatorless.dart';
import '../../../shared/domain/helpers/errors/failure.dart';
import '../../../shared/presentation/themes/app_theme.dart';
import '../../../shared/presentation/widgets/input_text_widget.dart';
import '../../../shared/presentation/widgets/rounded_button_widget.dart';
import 'forgot_password_state.dart';
import 'forgot_password_store.dart';

class ForgotPasswordPageOne extends StatefulWidget {
  const ForgotPasswordPageOne({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPageOne> createState() => _ForgotPasswordPageOneState();
}

class _ForgotPasswordPageOneState
    extends ModularState<ForgotPasswordPageOne, ForgotPasswordStore> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    store.observer(
        onError: ((error) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(error.message),
                  backgroundColor: AppTheme.colors.red),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () => Modular.to.navigate('/login/'),
              child: Icon(
                Icons.arrow_back,
                color: AppTheme.colors.primary,
                size: 40,
              )),
          backgroundColor: AppTheme.colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: TripleBuilder<ForgotPasswordStore, Failure, ForgotPasswordState>(
          store: store,
          builder: (context, triple) {
            return Form(
              key: _formKey,
              child: ListView(
                physics: const BouncingScrollPhysics(),
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 40),
                    child: Text(
                      'Não se preocupe, acontece! Digite seu e-mail abaixo que vamos enviar uma nova senha.',
                    ),
                  ),
                  InputTextWidget(
                    labelText: 'Seu e-mail',
                    hintText: 'Email',
                    onChanged: (value) => store.onChangeEmail(value),
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await store.reset();
                        }
                      },
                      textButton: 'ENVIAR',
                      styleText: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
