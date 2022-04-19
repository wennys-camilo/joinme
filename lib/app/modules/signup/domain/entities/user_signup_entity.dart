import '../../../login/domain/entities/token_enity.dart';

class UserSignupEntity {
  final String? id;
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String? phone;
  final String? emergencyName;
  final String? emergencyPhone;
  final TokenEnity? tokenEnity;
  final String? city;
  const UserSignupEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    this.tokenEnity,
    this.id,
    this.phone,
    this.emergencyName,
    this.emergencyPhone,
    this.city,
  });

  @override
  String toString() {
    return 'UserSignupEntity(id: $id, name: $name, email: $email, password: $password, passwordConfirmation: $passwordConfirmation, phone: $phone, emergencyName: $emergencyName, emergencyPhone: $emergencyPhone, tokenEnity: $tokenEnity)';
  }
}
