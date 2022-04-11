import 'package:flutter_modular/flutter_modular.dart';
import 'domain/usescases/login_usecase_impl.dart';
import 'external/datasources/login_remote_datasource_impl.dart';
import 'infra/repositories/login_repository_impl.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/login_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => LoginRemoteDatasourceImpl(i.get())),
    Bind((i) => LoginRepositoryImpl(i.get())),
    Bind((i) => LoginUsecaseImpl(i.get())),
    Bind((i) => LoginStore(i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const LoginPage()),
  ];
}
