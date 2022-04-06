import 'package:camp_final/app/modules/signup/domain/entities/user_signup_entity.dart';

import '../../domain/entities/interests_entity.dart';

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
  final List<InterestsEntity> selectedInterests;
  final UserSignupEntity userSignupResponse;
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
  });

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
    List<InterestsEntity>? selectedInterests,
    UserSignupEntity? userSignupResponse,
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
    );
  }
}
