import 'package:camp_final/app/modules/home/home_module.dart';
import 'package:camp_final/app/modules/login/login_module.dart';
import 'package:camp_final/app/modules/onboarding/onboard_module.dart';
import 'package:camp_final/app/modules/signup/signup_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio(BaseOptions(baseUrl: 'https://thiagosgdev.com'))),
    Bind((i) => const FlutterSecureStorage(), isLazy: false),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: OnboardModule()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/signup', module: SignUpModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
