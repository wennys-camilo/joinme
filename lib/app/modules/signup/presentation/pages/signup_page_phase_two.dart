import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppTheme.colors.primary),
      ),
      body: TripleBuilder(
          store: store,
          builder: (context, triple) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 6,
                  margin: const EdgeInsets.fromLTRB(100, 20, 100, 70),
                  decoration: BoxDecoration(
                    color: AppTheme.colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 8, 30, 20),
                  child: Text(
                    'Gostaria de adicionar um contato de emergência?',
                    style: TextStyle(
                      color: AppTheme.colors.primary.withOpacity(0.79),
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
                InputTextWidget(
                  ontopHint: 'Qual o nome da pessoa?',
                  hintText: 'Nome',
                  onChanged: store.onChangeEmergencyName,
                ),
                InputTextWidget(
                  ontopHint: 'E o telefone?',
                  hintText: '(64) 99245-8628',
                  onChanged: store.onChangeEmergencyPhone,
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 8, 30, 20),
                  margin: const EdgeInsets.symmetric(horizontal: 100),
                  child: RoundedButtonWidget(
                    onPressed: () async => await store.signup(),
                    textButton: 'Criar conta',
                  ),
                ),
              ],
            );
          }),
    ));
  }
}
