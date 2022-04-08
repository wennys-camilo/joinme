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
          child: ListView(
            shrinkWrap: true,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => Modular.to.navigate('/login/'),
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppTheme.colors.primary,
                  ),
                ),
              ),
              //TODO: COMPONENTIZAR
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: MediaQuery.of(context).size.height / 6,
                  //margin: const EdgeInsets.all(100)
                  margin: const EdgeInsets.fromLTRB(100, 20, 100, 70),
                  decoration: BoxDecoration(
                    color: AppTheme.colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add_a_photo_outlined,
                    size: 32,
                    color: AppTheme.colors.primary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 8, 30, 20),
                child: Text(
                  'Vamos começar?',
                  style: TextStyle(
                    color: AppTheme.colors.primary.withOpacity(0.79),
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              InputTextWidget(
                ontopHint: 'Como podemos te chamar?',
                hintText: 'Nome',
                onChanged: store.onChangeName,
                validator: Validatorless.required('Campo obrigatório'),
              ),
              InputTextWidget(
                ontopHint: 'Seu e-mail:',
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
                ontopHint: 'Digite uma senha:',
                controller: passwordController,
                hintText: 'Senha',
                obscureText: true,
                onChanged: store.onChangePassword,
                validator: Validatorless.multiple([
                  Validatorless.min(
                      6, 'Sua senha deve possui no mínimo 6 caracteres'),
                  Validatorless.required('Campo obrigatório'),
                ]),
              ),
              InputTextWidget(
                ontopHint: 'Confirme a senha:',
                hintText: 'Digite a senha novamente',
                obscureText: true,
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
                        text: TextSpan(
                          text: 'Li e concordo com os',
                          style: TextStyle(
                              fontSize: 14, color: AppTheme.colors.black),
                          children: [
                            TextSpan(
                              text:
                                  ' Termos e Condições e Politica de Privacidade',
                              style: TextStyle(
                                color: AppTheme.colors.primary,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TripleBuilder(
                store: store,
                builder: (context, triple) {
                  return !triple.isLoading
                      ? Container(
                          padding: const EdgeInsets.fromLTRB(30, 8, 30, 20),
                          margin: const EdgeInsets.symmetric(horizontal: 100),
                          child: Align(
                            child: RoundedButtonWidget(
                              onPressed: () async {
                                //Modular.to.navigate('./phaseThree');
                                if (_formKey.currentState!.validate() &&
                                    store.state.policiesTerms) {
                                  await store.signup();
                                }
                              },
                              textButton: 'Criar conta',
                            ),
                          ),
                        )
                      : const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
