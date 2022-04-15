import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:validatorless/validatorless.dart';
import '../../../../shared/presentation/themes/app_theme.dart';
import '../../../../shared/presentation/widgets/input_text_widget.dart';
import '../../../../shared/presentation/widgets/rounded_button_widget.dart';
import '../widgets/checkbox_widget.dart';
import 'signup_store.dart';

class SignUpPage extends StatefulWidget {
  final SignupStore store;
  const SignUpPage({Key? key, required this.store}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignupStore get store => widget.store;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
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
          child: Center(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 30, 30, 20),
                  child: Text(
                    'Olá! Primeiro crie sua conta:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                InputTextWidget(
                  labelText: 'Como podemos te chamar?',
                  hintText: 'Nome',
                  onChanged: store.onChangeName,
                  validator: Validatorless.required('Campo obrigatório'),
                ),
                InputTextWidget(
                  labelText: 'Seu e-mail:',
                  hintText: 'E-mail',
                  onChanged: store.onChangeEmail,
                  validator: Validatorless.multiple(
                    [
                      Validatorless.email('E-mail invalido'),
                      Validatorless.required('Campo obrigatório')
                    ],
                  ),
                ),
                InputTextWidget(
                  labelText: 'Digite uma senha:',
                  controller: passwordController,
                  hintText: 'Senha',
                  obscureText: true,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility_off,
                    ),
                  ),
                  onChanged: store.onChangePassword,
                  validator: Validatorless.multiple([
                    Validatorless.min(
                        6, 'Sua senha deve possui no mínimo 6 caracteres'),
                    Validatorless.required('Campo obrigatório'),
                  ]),
                ),
                InputTextWidget(
                  labelText: 'Confirme a senha:',
                  hintText: 'Digite a senha novamente',
                  obscureText: true,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility_off,
                    ),
                  ),
                  onChanged: store.onChangePasswordConfimation,
                  validator: Validatorless.multiple([
                    Validatorless.min(
                        6, 'Sua senha deve possui no mínimo 6 caracteres'),
                    Validatorless.required('Campo obrigatório'),
                    Validatorless.compare(passwordController,
                        'As duas senhas digitadas são diferentes')
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 8, 30, 20),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CheckboxWidget(
                          onChanged: store.onChangePoliciesTerms,
                        ),
                      ),
                      Flexible(
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            text: 'Li e concordo com os',
                            style: TextStyle(
                                fontSize: 16, color: AppTheme.colors.black),
                            children: [
                              TextSpan(
                                text:
                                    ' Termos e Condições e Politica de Privacidade',
                                style: TextStyle(
                                  color: AppTheme.colors.primary,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 8, 30, 5),
                  child: RoundedButtonWidget(
                    googleButton: true,
                    onPressed: () {},
                    textButton: 'CONTINUAR COM O GMAIL',
                    backgroundColor: AppTheme.colors.blueLight,
                    styleText: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.colors.primary),
                  ),
                ),
                TripleBuilder(
                  store: store,
                  builder: (context, triple) {
                    return !triple.isLoading
                        ? Container(
                            padding: const EdgeInsets.fromLTRB(30, 8, 30, 20),
                            child: RoundedButtonWidget(
                              onPressed: () async {
                                //Modular.to.navigate('./phaseThree');
                                if (_formKey.currentState!.validate() &&
                                    store.state.policiesTerms) {
                                  await store.signup();
                                }
                              },
                              textButton: 'CRIAR MINHA CONTA',
                            ),
                          )
                        : const Center(child: CircularProgressIndicator());
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Já tem uma conta?',
                        style: TextStyle(fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () => Modular.to.navigate('/login/'),
                        child: Text(
                          ' Entre aqui',
                          style: TextStyle(
                              color: AppTheme.colors.primary,
                              decoration: TextDecoration.underline,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
