import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/onboarding/onboard_module.dart';
import 'modules/signup/signup_module.dart';
import 'shared/external/adapters/http_client/dio/dio_adapter.dart';
import 'shared/external/adapters/http_client/dio/interceptors/dio_interceptor.dart';
import 'shared/external/adapters/http_client/http_client_adapter.dart';
import 'shared/external/datasources/token_local_datasource_impl.dart';
import 'shared/infra/repositories/token_repository_impl.dart';
import 'shared/usecases/get_token_usecase_impl.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => const FlutterSecureStorage(), isLazy: false),
    Bind((i) => TokenLocalDatasourceImpl(i.get())),
    Bind((i) => TokenRepositoryImpl(i.get())),
    Bind((i) => GetTokenUsecaseImpl(i.get())),
    Bind.factory<IHttpClientAdapter>(
        (i) => DioAdapter(dio: i(), interceptors: [i<CustomInterceptors>()])),
    Bind.factory<CustomInterceptors>((i) => CustomInterceptors(i.get())),
    Bind((i) => Dio(i())),
    Bind.factory<BaseOptions>(
        (i) => BaseOptions(baseUrl: 'https://thiagosgdev.com')),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: OnboardModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/signup', module: SignUpModule()),
  ];
}
