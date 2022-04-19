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
      "city": userSignupEntity.city,
    };
  }

  UserSignupEntity from(Map<String, dynamic> map, {bool update = false}) {
    if (update) {
      return UserSignupEntity(
        name: map['name'],
        email: map['email'],
        password: map['password'] ?? '',
        passwordConfirmation: map['passwordConfirmation'] ?? '',
        id: map['id'],
        emergencyName: map['emergencyName'] ?? '',
        emergencyPhone: map['emergencyPhone'] ?? '',
      );
    } else {
      return UserSignupEntity(
        id: map['user']['id'],
        name: map['user']['name'] ?? '',
        email: map['user']['email'] ?? '',
        password: map['user']['password'] ?? '',
        passwordConfirmation: map['passwordConfirmation'] ?? '',
        phone: map['user']['phone'] ?? '',
        emergencyName: map['user']['emergencyName'] ?? '',
        emergencyPhone: map['user']['emergencyPhone'] ?? '',
        tokenEnity: TokenEnity(
            refreshToken: map['token'] ?? '', token: map['refreshToken'] ?? ''),
      );
    }
  }
}
