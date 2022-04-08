import 'package:camp_final/app/modules/login/domain/entities/token_enity.dart';

class UserSignupEntity {
  final String? id;
  final String firstName;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String? phone;
  final String? emergencyName;
  final String? emergencyPhone;
  final TokenEnity? tokenEnity;
  const UserSignupEntity({
    required this.firstName,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    this.tokenEnity,
    this.id,
    this.phone,
    this.emergencyName,
    this.emergencyPhone,
  });
}
