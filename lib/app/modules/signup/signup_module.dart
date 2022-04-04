import 'package:flutter_modular/flutter_modular.dart';
import 'domain/usecases/signup_usecase.dart';
import 'external/datasource/signup_remote_datasource_impl.dart';
import 'infra/repositories/signup_repositort_impl.dart';
import 'presentation/pages/signup_confimation_page.dart';
import 'presentation/pages/signup_page_phase_one.dart';
import 'presentation/pages/signup_page_phase_two.dart';
import 'presentation/pages/signup_store.dart';

class SignUpModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => SignupRemoteDatasourceImpl(i.get())),
    Bind((i) => SignupRepositoryImpl(i.get())),
    Bind((i) => SignupUsecaseImpl(i.get())),
    Bind(((i) => SignupStore(i.get()))),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (context, args) => SignUpPage(store: context.read())),
    ChildRoute('/phaseTwo',
        child: (context, args) => const SignupPagePhaseTwo()),
    ChildRoute('/confirmation',
        child: (context, args) => const SignupConfirmationPage()),
  ];
}
