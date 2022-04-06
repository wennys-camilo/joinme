import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/entities/interests_entity.dart';
import '../../domain/entities/user_signup_entity.dart';
import '../../domain/usecases/fetch_interests_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';
import 'signup_state.dart';

class SignupStore extends StreamStore<Failure, SignupState> {
  final SignupUsecase _signupUsecase;
  final FetchInterestsUsecase _interestsUsecase;

  SignupStore(this._signupUsecase, this._interestsUsecase)
      : super(
          SignupState(
            policiesTerms: false,
            name: "",
            email: "",
            password: "",
            passwordConfirmation: "",
            emergencyName: "",
            emergencyPhone: "",
            phone: "",
            interestsList: [],
            selectedInterests: [],
            userSignupResponse: UserSignupEntity(
              email: '',
              password: '',
              id: '',
              firstName: '',
              passwordConfirmation: '',
            ),
          ),
        );

  Future<void> signup() async {
    setLoading(true);
    final result = await _signupUsecase.singup(UserSignupEntity(
      firstName: state.name,
      email: state.email,
      password: state.password,
      passwordConfirmation: state.passwordConfirmation,
    ));
    result.fold(setError, (response) async {
      update(state.copyWith(userSignupResponse: response));
      Modular.to.navigate('/signup/phaseTwo');
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

  addInterest(InterestsEntity interest) {
    if (state.selectedInterests.contains(interest)) {
      state.selectedInterests.remove(interest);
      update(state.copyWith(selectedInterests: state.selectedInterests));
      return;
    }
    state.selectedInterests.add(interest);
    update(state.copyWith(selectedInterests: state.selectedInterests));
  }

  Future<void> fethInterests() async {
    final response = await _interestsUsecase();
    response.fold(setError, (result) {
      update(state.copyWith(interestsList: result));
    });
  }
}
