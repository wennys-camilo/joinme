import 'package:flutter_modular/flutter_modular.dart';
import 'domain/usecases/fetch_interests_usecase_impl.dart';
import 'domain/usecases/signup_usecase_impl.dart';
import 'external/datasource/interests_remote_datasource_impl.dart';
import 'external/datasource/signup_remote_datasource_impl.dart';
import 'infra/repositories/interests_repository_impl.dart';
import 'infra/repositories/signup_repositort_impl.dart';
import 'presentation/pages/signup_confimation_page.dart';
import 'presentation/pages/signup_interests_page.dart';
import 'presentation/pages/signup_page_phase_one.dart';
import 'presentation/pages/signup_page_phase_two.dart';
import 'presentation/pages/signup_store.dart';

class SignUpModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => SignupRemoteDatasourceImpl(i.get())),
    Bind((i) => SignupRepositoryImpl(i.get())),
    Bind((i) => SignupUsecaseImpl(i.get())),
    Bind((i) => InterestsRemoteDatasourceImpl(i.get())),
    Bind((i) => InterestsRepositoryImpl(i.get())),
    Bind((i) => FetchInterestsUsecaseImpl(i.get())),
    Bind(((i) => SignupStore(i.get(), i.get()))),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (context, args) => SignUpPage(store: context.read())),
    ChildRoute('/phaseTwo',
        child: (context, args) => const SignupPagePhaseTwo()),
    ChildRoute('/phaseThree',
        child: (context, args) => const SignupInterestPage()),
    ChildRoute('/confirmation',
        child: (context, args) => const SignupConfirmationPage()),
  ];
}
