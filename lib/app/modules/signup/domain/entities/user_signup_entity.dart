class UserSignupEntity {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String phone;
  final String emergencyName;
  final String emergencyPhone;
  UserSignupEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.phone,
    required this.emergencyName,
    required this.emergencyPhone,
  });
}
