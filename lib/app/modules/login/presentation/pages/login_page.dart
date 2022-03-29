import 'package:camp_final/app/modules/login/presentation/pages/login_state.dart';
import 'package:camp_final/app/modules/login/presentation/pages/login_store.dart';
import 'package:camp_final/app/modules/login/presentation/widgets/input_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {
  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<LoginStore, Failure, LoginState>(
        store: store,
        onState: (context, state) => BodySucess(store: store),
        onError: (context, error) =>
            BodyFailure(store: store, message: error!.message),
        onLoading: (context) => const BodyLoading());
  }
}

class BodyFailure extends StatelessWidget {
  final String? message;
  final LoginStore store;

  const BodyFailure({Key? key, this.message, required this.store})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(child: Text(message ?? 'Falha ao logar')),
    )); //TODO: CASO DE FALHA
  }
}

class BodyLoading extends StatelessWidget {
  const BodyLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Center(
              child: CircularProgressIndicator())), //TODO: CASO DE LOADING
    );
  }
}

class BodySucess extends StatelessWidget {
  final LoginStore store;
  const BodySucess({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const InputTextWidget(
              hintText: 'Email',
            ),
            const InputTextWidget(
              hintText: 'Senha',
            ),
            TextButton(
                onPressed: () => store.login(
                    email: 'squad8.test@gmail.com', password: '12345678'),
                child: const Text('LOGIN')),
          ],
        ),
      )), //TODO: CASO DE SUCESSO
    );
  }
}
