import 'package:flutter_modular/flutter_modular.dart';
import 'domain/usecases/check_first_acess_usecase_impl.dart';
import 'domain/usecases/set_first_acess_usecase_impl.dart';
import 'infra/repositories/onboarding_repository_impl.dart';
import 'internal/onboarding_local_datasource.dart';
import 'presentation/onboard_controller.dart';
import 'presentation/onboard_page_one.dart';
import 'presentation/onboard_page_three.dart';
import 'presentation/onboard_page_two.dart';
import 'presentation/onboard_page_verify.dart';

class OnboardModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => OnboardingLocalDatasourceImpl(i.get())),
    Bind((i) => OnboradingRepositoryImpl(i.get())),
    Bind((i) => SetFirstAcessUsecaseImpl(i.get())),
    Bind((i) => CheckFirstAcessUsecaseImpl(i.get())),
    Bind.factory((i) => OnboardController(i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const OnboardPageVerify()),
    ChildRoute('/board1',
        child: (context, args) => const OnboardPageOne(),
        transition: TransitionType.fadeIn),
    ChildRoute('/board2',
        child: (context, args) => const OnboardPageTwo(),
        transition: TransitionType.fadeIn),
    ChildRoute('/board3',
        child: (context, args) => const OnboardPageThree(),
        transition: TransitionType.fadeIn),
  ];
}
