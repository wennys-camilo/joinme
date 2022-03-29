import 'package:camp_final/app/modules/login/presentation/pages/login_state.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/entities/authenticate_entity.dart';
import '../../domain/usescases/login_usecase_impl.dart';

class LoginStore extends StreamStore<Failure, LoginState> {
  final LoginUsecase _loginUsecase;

  LoginStore(this._loginUsecase) : super(LoginState(email: '', password: ''));

  Future<void> login({required String email, required String password}) async {
    setLoading(true);
    final result = await _loginUsecase(
        AuthenticateEntity(email: email, password: password));
    result.fold(setError, (response) async {
      //TODO: CASO DE SUCESSO;
    });
    setLoading(false);
  }
}
