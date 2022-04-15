import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:validatorless/validatorless.dart';
import '../../../../shared/presentation/themes/app_theme.dart';
import '../../../../shared/presentation/widgets/input_text_widget.dart';
import '../../../../shared/presentation/widgets/rounded_button_widget.dart';
import 'signup_store.dart';

class SignupPagePhaseTwo extends StatefulWidget {
  const SignupPagePhaseTwo({Key? key}) : super(key: key);

  @override
  State<SignupPagePhaseTwo> createState() => _SignupPagePhaseTwoState();
}

class _SignupPagePhaseTwoState
    extends ModularState<SignupPagePhaseTwo, SignupStore> {
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
        appBar: AppBar(
          backgroundColor: AppTheme.colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: AppTheme.colors.primary),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SvgPicture.asset(AppTheme.images.siren),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 8, 30, 20),
                child: Text(
                  'Você gostaria de adicionar um contato para emergências?',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 8, 30, 20),
                child: Text(
                  'Esse contato serve para enviarmos uma mensa-gem para alguém que você confia, caso você não se sinta segura ou confortável em alguma situação, através do botão de ajuda.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              InputTextWidget(
                labelText: 'Qual o nome do seu contato?',
                hintText: 'Nome',
                onChanged: store.onChangeEmergencyName,
                validator: Validatorless.required('Campo obrigatório'),
              ),
              InputTextWidget(
                labelText: 'E qual é o celular dele?',
                hintText: '(64) 99245-8628',
                onChanged: store.onChangeEmergencyPhone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter()
                ],
                keyboardType: TextInputType.phone,
                validator: Validatorless.required('Campo obrigatório'),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 8, 30, 20),
                child: RoundedButtonWidget(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await store.insertContactEmergency();
                    }
                  },
                  textButton: 'ADICIONAR CONTATO',
                ),
              ),
              GestureDetector(
                onTap: () => Modular.to.pushNamed('./phaseThree'),
                child: const Text(
                  'PULAR',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
