import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'modules/forgot_password/forgot_password_module.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/onboarding/onboard_module.dart';
import 'modules/signup/signup_module.dart';
import 'shared/domain/usecases/fetch_all_disabilities_usecase_impl.dart';
import 'shared/domain/usecases/fetch_cities_usecase_impl.dart';
import 'shared/domain/usecases/get_token_usecase_impl.dart';
import 'shared/domain/usecases/set_token_usecase_impl.dart';
import 'shared/external/adapters/http_client/dio/dio_adapter.dart';
import 'shared/external/adapters/http_client/dio/interceptors/dio_interceptor.dart';
import 'shared/external/adapters/http_client/http_client_adapter.dart';
import 'shared/external/datasources/disabilities_remote_datasource_impl.dart';
import 'shared/external/datasources/ibge_remote_datasource_impl.dart';
import 'shared/external/datasources/token_local_datasource_impl.dart';
import 'shared/infra/repositories/disabilities_repository_impl.dart';
import 'shared/infra/repositories/ibge_repository_impl.dart';
import 'shared/infra/repositories/token_repository_impl.dart';
import 'shared/store/user/user_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => const FlutterSecureStorage(), isLazy: false),
    Bind((i) => IbgeRemoteDataSourceImpl(i.get())),
    Bind((i) => IbgeRepositoryImpl(i.get())),
    Bind((i) => FetchCitiesIbgeUsecaseImpl(i.get())),
    Bind((i) => TokenLocalDatasourceImpl(i.get())),
    Bind((i) => DisabilitiesRemoteDatasourceImpl(i.get())),
    Bind((i) => DisabilitiesRepositoryImpl(i.get())),
    Bind((i) => FetchAllDisabilitiesUsecaseImpl(i.get())),
    Bind((i) => TokenRepositoryImpl(i.get())),
    Bind((i) => SetTokenUsecaseImpl(i.get())),
    Bind((i) => GetTokenUsecaseImpl(i.get())),
    Bind.factory<BaseOptions>(
        (i) => BaseOptions(baseUrl: 'https://thiagosgdev.com')),
    Bind.factory((i) => Dio(i.get())),
    Bind.factory<CustomInterceptors>((i) => CustomInterceptors(i.get())),
    Bind.factory<IHttpClientAdapter>(
        (i) => DioAdapter(dio: i(), interceptors: [i<CustomInterceptors>()])),
    Bind((i) => UserStore())
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: OnboardModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/signup', module: SignUpModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/forgotPassword', module: ForgotPasswordModule()),
  ];
}
