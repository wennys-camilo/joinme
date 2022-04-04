class SignupState {
  final bool policiesTerms;
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String emergencyName;
  final String emergencyPhone;
  final String phone;
  SignupState({
    required this.policiesTerms,
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.emergencyName,
    required this.emergencyPhone,
    required this.phone,
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
    );
  }
}
