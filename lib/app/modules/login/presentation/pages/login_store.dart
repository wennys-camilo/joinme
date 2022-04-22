import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../../shared/store/user/user_store.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../shared/domain/usecases/set_token_usecase.dart';
import '../../domain/entities/authenticate_entity.dart';
import '../../domain/usescases/login_usecase.dart';
import 'login_state.dart';

class LoginStore extends StreamStore<Failure, LoginState> {
  final LoginUsecase _loginUsecase;
  final SetTokenUsecase _setTokenUsecase;

  LoginStore(this._loginUsecase, this._setTokenUsecase)
      : super(LoginState(
            email: '', password: '', obscurePass: true, rememberMe: false));

  Future<void> login() async {
    setLoading(true);
    final result = await _loginUsecase(
        AuthenticateEntity(email: state.email, password: state.password));
    result.fold(setError, (response) async {
      var responseToken = await _setTokenUsecase(response.token.token);
      responseToken.fold(setError, (r) {});
      Modular.get<UserStore>().setUser(response.user);
      Modular.to.navigate('/home/homePage');
      update(LoginState(
          email: '', password: '', obscurePass: true, rememberMe: false));
    });
    setLoading(false);
  }

  onChangeEmail(String value) {
    update(state.copyWith(email: value));
  }

  onChangePass(String value) {
    update(state.copyWith(password: value));
  }

  onChangeObscurePass() {
    update(state.copyWith(obscurePass: !state.obscurePass));
  }

  onChangeRememberMe() {
    update(state.copyWith(rememberMe: !state.rememberMe));
  }
}
