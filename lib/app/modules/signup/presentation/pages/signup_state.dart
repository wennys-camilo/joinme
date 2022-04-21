import 'package:camp_final/app/shared/domain/entites/city_entity.dart';
import 'package:camp_final/app/shared/domain/entites/disabilities_enity.dart';

import '../../domain/entities/interests_entity.dart';
import '../../domain/entities/user_signup_entity.dart';

class SignupState {
  final bool policiesTerms;
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String emergencyName;
  final String emergencyPhone;
  final String phone;
  final List<InterestsEntity> interestsList;
  final List<String> selectedInterests;
  final UserSignupEntity userSignupResponse;

  final List<DisabilitiesEntity> disabilitiesList;
  final List<DisabilitiesEntity> selectedsDisaibilities;
  final List<String> selectedsIdsDisabilities;
  final String city;
  final List<CityEntity> citysList;
  SignupState({
    required this.policiesTerms,
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.emergencyName,
    required this.emergencyPhone,
    required this.phone,
    required this.interestsList,
    required this.selectedInterests,
    required this.userSignupResponse,
    required this.disabilitiesList,
    required this.selectedsIdsDisabilities,
    required this.selectedsDisaibilities,
    required this.city,
    required this.citysList,
  });

  factory SignupState.empty() {
    return SignupState(
        policiesTerms: false,
        name: "",
        email: "",
        disabilitiesList: [],
        selectedsDisaibilities: [],
        selectedsIdsDisabilities: [],
        password: "",
        passwordConfirmation: "",
        emergencyName: "",
        emergencyPhone: "",
        phone: "",
        interestsList: const [],
        selectedInterests: const [],
        userSignupResponse: const UserSignupEntity(
          email: '',
          password: '',
          id: '',
          name: '',
          passwordConfirmation: '',
        ),
        city: '',
        citysList: []);
  }

  SignupState copyWith({
    bool? policiesTerms,
    String? name,
    String? email,
    String? password,
    String? passwordConfirmation,
    String? emergencyName,
    String? emergencyPhone,
    String? phone,
    List<InterestsEntity>? interestsList,
    List<String>? selectedInterests,
    UserSignupEntity? userSignupResponse,
    List<String>? interestsId,
    List<DisabilitiesEntity>? disabilitiesList,
    List<DisabilitiesEntity>? selectedsDisaibilities,
    List<String>? selectedsIdsDisabilities,
    String? city,
    List<CityEntity>? citysList,
  }) {
    return SignupState(
      policiesTerms: policiesTerms ?? this.policiesTerms,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      emergencyName: emergencyName ?? this.emergencyName,
      emergencyPhone: emergencyPhone ?? this.emergencyPhone,
      phone: phone ?? this.phone,
      interestsList: interestsList ?? this.interestsList,
      selectedInterests: selectedInterests ?? this.selectedInterests,
      userSignupResponse: userSignupResponse ?? this.userSignupResponse,
      disabilitiesList: disabilitiesList ?? this.disabilitiesList,
      selectedsDisaibilities:
          selectedsDisaibilities ?? this.selectedsDisaibilities,
      selectedsIdsDisabilities:
          selectedsIdsDisabilities ?? this.selectedsIdsDisabilities,
      city: city ?? this.city,
      citysList: citysList ?? this.citysList,
    );
  }
}
