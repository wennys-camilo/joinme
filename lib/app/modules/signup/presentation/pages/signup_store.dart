import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../../shared/domain/entites/disabilities_enity.dart';
import '../../../../shared/domain/entites/user_enity.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../shared/domain/usecases/fetch_all_disabilities_usecase.dart';
import '../../../../shared/domain/usecases/fetch_cities_usecase.dart';
import '../../../../shared/domain/usecases/set_token_usecase.dart';
import '../../../../shared/store/user/user_store.dart';
import '../../domain/entities/user_disabilities_entity.dart';
import '../../domain/entities/user_interests_entity.dart';
import '../../domain/entities/user_signup_entity.dart';
import '../../domain/usecases/fetch_interests_usecase.dart';
import '../../domain/usecases/insert_city_user_usecase.dart';
import '../../domain/usecases/insert_disabilities_usecase.dart';
import '../../domain/usecases/insert_emergency_contact_usecase.dart';
import '../../domain/usecases/insert_interests_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';
import 'signup_state.dart';

class SignupStore extends StreamStore<Failure, SignupState> {
  final SignupUsecase _signupUsecase;
  final FetchInterestsUsecase _interestsUsecase;
  final InsertEmergencyContactUsecase _emergencyContactUsecase;
  final SetTokenUsecase _setTokenUsecase;
  final InsertInterestsUsecase _insertInterestsUsecase;
  final FetchAllDisabilitiesUsecase _fetchAllDisabilitiesUsecase;
  final InsertDisabilitiesUsecase _insertDisabilitiesUsecase;
  final FetchCitiesUsecase _fetchCitiesUsecase;
  final InsertCityUserUsecase _insertCityUserUsecase;

  SignupStore(
    this._signupUsecase,
    this._interestsUsecase,
    this._emergencyContactUsecase,
    this._setTokenUsecase,
    this._insertInterestsUsecase,
    this._fetchAllDisabilitiesUsecase,
    this._insertDisabilitiesUsecase,
    this._fetchCitiesUsecase,
    this._insertCityUserUsecase,
  ) : super(SignupState.empty());

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

  onChangeCity(String value) {
    update(state.copyWith(city: value));
  }

  Future<void> signup() async {
    setLoading(true);
    final result = await _signupUsecase.singup(UserSignupEntity(
      name: state.name,
      email: state.email,
      password: state.password,
      passwordConfirmation: state.passwordConfirmation,
    ));
    result.fold(setError, (response) async {
      update(state.copyWith(userSignupResponse: response));

      Modular.get<UserStore>().setUser(
        UserEntity(
          name: state.userSignupResponse.name,
          email: state.userSignupResponse.email,
          phone: state.userSignupResponse.phone,
          emergencyName: state.userSignupResponse.name,
          emergencyPhone: state.userSignupResponse.emergencyPhone,
        ),
      );
      var responseToken = await _setTokenUsecase(response.tokenEnity!.token);
      responseToken.fold(setError, (r) {});
      Modular.to.pushNamed('./confirmation');
    });
    setLoading(false);
  }

  Future<void> insertContactEmergency() async {
    setLoading(true);
    final result = await _emergencyContactUsecase(UserSignupEntity(
      name: state.name,
      email: state.email,
      password: state.password,
      passwordConfirmation: state.passwordConfirmation,
      emergencyName: state.emergencyName,
      emergencyPhone: state.emergencyPhone,
      phone: "",
    ));
    result.fold(setError, (response) {
      update(state.copyWith(userSignupResponse: response));
      Modular.to.pushNamed('/signup/phaseThree');
    });
    setLoading(false);
  }

  Future<void> insertCity() async {
    final result = await _insertCityUserUsecase(state.city);
    result.fold(setError, (response) {
      update(state.copyWith(userSignupResponse: response));
      Modular.to.pushNamed('/home/homePage');
    });
  }

  addInterest(String interestID) {
    List<String> ids = [];
    if (state.selectedInterests.contains(interestID)) {
      ids.addAll([...state.selectedInterests]..remove(interestID));
    } else {
      ids.addAll([...state.selectedInterests, interestID]);
    }
    update(state.copyWith(selectedInterests: ids));
  }

  Future<void> insertInterest() async {
    final response = await _insertInterestsUsecase(
        UserInterestsEntity(activityIds: state.selectedInterests));
    response.fold(setError, (r) {
      //TODO: PASSAR O USUARIO PARA A USERSTORE
      Modular.get<UserStore>().setUser(
        UserEntity(
          name: state.userSignupResponse.name,
          email: state.userSignupResponse.email,
          phone: state.userSignupResponse.phone,
          emergencyName: state.userSignupResponse.name,
          emergencyPhone: state.userSignupResponse.emergencyPhone,
        ),
      );
      Modular.to.pushNamed('./phaseFour');
    });
  }

  Future<void> fethInterests() async {
    setLoading(true);
    final response = await _interestsUsecase();
    response.fold(setError, (result) {
      update(state.copyWith(interestsList: result));
    });
    setLoading(false);
  }

  onChangeSelectedsDesabilities(List<DisabilitiesEntity> value) {
    List<String> ids = [];
    for (var accessibilite in value) {
      ids.add(accessibilite.id);
    }
    update(state.copyWith(
        selectedsDisaibilities: value, selectedsIdsDisabilities: ids));
  }

  Future<void> fetchDisabilities() async {
    final response = await _fetchAllDisabilitiesUsecase();
    response.fold(setError, (result) {
      update(state.copyWith(disabilitiesList: result));
    });
  }

  Future<void> inserDisabilities() async {
    final response = await _insertDisabilitiesUsecase(
        UserDisabilitiesEntity(disabilityIds: state.selectedsIdsDisabilities));
    response.fold(setError, (r) {
      Modular.to.navigate('./phaseFive');
    });
  }

  Future<void> cities() async {
    final response = await _fetchCitiesUsecase();
    response.fold(setError, (result) {
      update(state.copyWith(citysList: result));
    });
  }
}
