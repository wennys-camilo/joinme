import 'package:flutter_modular/flutter_modular.dart';
import 'domain/usecases/reset_password_usecase_impl.dart';
import 'external/forgot_password_remote_datasource_impl.dart';
import 'infra/repositories/forgot_password_repository_impl.dart';
import 'presentation/forgot_passsword_page_one.dart';
import 'presentation/forgot_password_page_two.dart';
import 'presentation/forgot_password_store.dart';

class ForgotPasswordModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => ForgotPasswordRemoteDataSourceImpl(i.get())),
    Bind((i) => ForgotPasswordRepositoryImpl(i.get())),
    Bind((i) => ResetPasswordUsecaseImpl(i.get())),
    Bind((i) => ForgotPasswordStore(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ForgotPasswordPageOne()),
    ChildRoute('/pageTwo',
        child: (context, args) => const ForgorPasswordPageTwo()),
  ];
}
