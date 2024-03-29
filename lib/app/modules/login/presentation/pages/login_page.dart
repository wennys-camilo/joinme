import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:validatorless/validatorless.dart';
import '../../../../shared/presentation/themes/app_theme.dart';
import '../../../../shared/presentation/widgets/input_text_widget.dart';
import '../../../../shared/presentation/widgets/rounded_button_widget.dart';

import '../pages/login_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    store.observer(
        onError: ((error) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.message)))));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 7,
                margin: const EdgeInsets.fromLTRB(100, 50, 100, 30),
                child: SvgPicture.asset(AppTheme.images.joinmeLogo),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 8, 30, 20),
                child: Text(
                  'Olá! Acesse sua conta:',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              InputTextWidget(
                labelText: 'Seu e-mail',
                hintText: 'Email',
                onChanged: store.onChangeEmail,
                validator: Validatorless.multiple(
                  [
                    Validatorless.email('E-mail invalido'),
                    Validatorless.required('Campo obrigatório')
                  ],
                ),
              ),
              TripleBuilder(
                store: store,
                builder: (context, triple) {
                  return InputTextWidget(
                    labelText: 'Digite sua senha',
                    onChanged: store.onChangePass,
                    obscureText: store.state.obscurePass,
                    suffixIcon: IconButton(
                      icon: Icon(
                        store.state.obscurePass
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () => store.onChangeObscurePass(),
                    ),
                    validator: Validatorless.multiple([
                      Validatorless.min(
                          6, 'Sua senha deve possui no mínimo 6 caracteres'),
                      Validatorless.required('Campo obrigatório'),
                    ]),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 15, 30, 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: TripleBuilder(
                          store: store,
                          builder: (context, triple) {
                            return FlutterSwitch(
                              activeColor: AppTheme.colors.primary,
                              width: 42.0,
                              height: 24.0,
                              valueFontSize: 12.0,
                              toggleSize: 18.0,
                              value: store.state.rememberMe,
                              padding: 2,
                              onToggle: (_) => store.onChangeRememberMe(),
                            );
                          }),
                    ),
                    Text(
                      'Permanecer logado',
                      style: TextStyle(
                          fontSize: 16,
                          color: AppTheme.colors.black.withOpacity(0.5)),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Modular.to.navigate('/forgotPassword/'),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    'Esqueceu a senha?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppTheme.colors.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 8, 30, 5),
                child: RoundedButtonWidget(
                  googleButton: true,
                  backgroundColor: AppTheme.colors.blueLight,
                  onPressed: () async {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Em breve!'),
                    ));
                  },
                  textButton: 'ACESSAR COM O GMAIL',
                  styleText: TextStyle(
                    color: AppTheme.colors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TripleBuilder(
                store: store,
                builder: (context, triple) {
                  if (triple.isLoading) {
                    return const Center(
                        child: Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: CircularProgressIndicator(),
                    ));
                  }
                  return Container(
                    padding: const EdgeInsets.fromLTRB(30, 8, 30, 20),
                    child: RoundedButtonWidget(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await store.login();
                        }
                      },
                      textButton: 'ENTRAR',
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: GestureDetector(
                  onTap: () => Modular.to.navigate('/signup/'),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Não tem uma conta? ",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: AppTheme.colors.black.withOpacity(0.5),
                      ),
                      children: [
                        TextSpan(
                          text: "Cadastre-se aqui",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: AppTheme.colors.primary,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ],
                    ),
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
