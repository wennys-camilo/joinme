import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/entities/user_signup_entity.dart';
import '../../domain/usecases/signup_usecase_impl.dart';
import 'signup_state.dart';

class SignupStore extends StreamStore<Failure, SignupState> {
  final SignupUsecase _signupUsecase;

  SignupStore(this._signupUsecase)
      : super(SignupState(
          policiesTerms: false,
          name: '',
          email: '',
          password: '',
          passwordConfirmation: '',
          emergencyName: '',
          emergencyPhone: '',
          phone: '',
        ));

  Future<void> signup() async {
    setLoading(true);
    final result = await _signupUsecase.singup(UserSignupEntity(
      firstName: state.name,
      lastName: 'camilo',
      email: state.email,
      password: state.password,
      passwordConfirmation: state.passwordConfirmation,
      phone: state.phone,
      emergencyName: state.emergencyName,
      emergencyPhone: state.emergencyPhone,
    ));
    result.fold(setError, (response) async {
      Modular.to.navigate('/signup/confirmation');
    });
    setLoading(false);
  }

  onChangePoliciesTerms(bool? value) {
    update(state.copyWith(policiesTerms: !state.policiesTerms));
  }

  onChangeName(String value) {
    update(state.copyWith(name: value));
  }

  onChangeEmail(String value) {
    update(state.copyWith(email: value));
  }

  onChangePassword(String value) {
    update(state.copyWith(password: value));
  }

  onChangePasswordConfimation(String value) {
    update(state.copyWith(passwordConfirmation: value));
  }

  onChangeEmergencyName(String value) {
    update(state.copyWith(emergencyName: value));
  }

  onChangeEmergencyPhone(String value) {
    update(state.copyWith(emergencyPhone: value));
  }
}
