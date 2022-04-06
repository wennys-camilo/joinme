import '../../domain/entities/user_signup_entity.dart';

class UserSignupMapper {
  Map<String, dynamic> to(UserSignupEntity userSignupEntity) {
    return {
      "name": userSignupEntity.firstName,
      "email": userSignupEntity.email,
      "password": userSignupEntity.password,
      "passwordConfirmation": userSignupEntity.passwordConfirmation,
      "phone": userSignupEntity.phone,
      "emergencyName": userSignupEntity.emergencyName,
      "emergencyPhone": userSignupEntity.phone,
    };
  }

  UserSignupEntity from(Map<String, dynamic> map) {
    return UserSignupEntity(
      id: map['id'],
      firstName: map['firstName'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      passwordConfirmation: map['passwordConfirmation'] ?? '',
      phone: map['phone'],
      emergencyName: map['emergencyName'],
      emergencyPhone: map['emergencyPhone'],
    );
  }
}
