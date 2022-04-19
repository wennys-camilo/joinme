import 'package:camp_final/app/modules/signup/domain/usecases/insert_disabilities_usecase_impl.dart';
import 'package:camp_final/app/modules/signup/domain/usecases/insert_city_user_usecase_impl.dart';
import 'package:camp_final/app/modules/signup/presentation/pages/signup_address_page.dart';
import 'package:camp_final/app/modules/signup/presentation/pages/signup_disabilities_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/fetch_interests_usecase_impl.dart';
import 'domain/usecases/insert_emergency_contact_usecase_impl.dart';
import 'domain/usecases/insert_interests_usecase_impl.dart';
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
    Bind((i) => InsertEmergencyContactUsecaseImpl(i.get())),
    Bind((i) => InsertCityUserUsecaseImpl(i.get())),
    Bind((i) => InterestsRemoteDatasourceImpl(i.get())),
    Bind((i) => InterestsRepositoryImpl(i.get())),
    Bind((i) => InsertInterestsUsecaseImpl(i.get())),
    Bind((i) => InsertDisabilitiesUsecaseImpl(i.get())),
    Bind(((i) => SignupStore(i.get(), i.get(), i.get(), i.get(), i.get(),
        i.get(), i.get(), i.get(), i.get()))),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (context, args) => SignUpPage(store: context.read())),
    ChildRoute('/phaseTwo',
        child: (context, args) => const SignupPagePhaseTwo()),
    ChildRoute('/phaseThree',
        child: (context, args) => const SignupInterestPage()),
    ChildRoute('/phaseFour',
        child: (context, args) => const DisabilitiesPage()),
    ChildRoute('/phaseFive',
        child: (context, args) => const SignupAddressPage()),
    ChildRoute('/confirmation',
        child: (context, args) => const SignupConfirmationPage()),
  ];
}
