import '../../../login/domain/entities/token_enity.dart';
import '../../domain/entities/user_signup_entity.dart';

class UserSignupMapper {
  Map<String, dynamic> to(UserSignupEntity userSignupEntity) {
    return {
      "name": userSignupEntity.name,
      "email": userSignupEntity.email,
      "password": userSignupEntity.password,
      "passwordConfirmation": userSignupEntity.passwordConfirmation,
      "phone": userSignupEntity.phone,
      "emergencyName": userSignupEntity.emergencyName,
      "emergencyPhone": userSignupEntity.emergencyPhone,
    };
  }

  UserSignupEntity from(Map<String, dynamic> map) {
    return UserSignupEntity(
      id: map['id'],
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      passwordConfirmation: map['passwordConfirmation'] ?? '',
      phone: map['phone'],
      emergencyName: map['emergencyName'],
      emergencyPhone: map['emergencyPhone'],
      tokenEnity: TokenEnity(
          refreshToken: map['token'] ?? '', token: map['refreshToken'] ?? ''),
    );
  }
}
