class UserSignupEntity {
  final String? id;
  final String firstName;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String? phone;
  final String? emergencyName;
  final String? emergencyPhone;
  UserSignupEntity({
    required this.firstName,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    this.id,
    this.phone,
    this.emergencyName,
    this.emergencyPhone,
  });
}
