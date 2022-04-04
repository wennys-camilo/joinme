import '../../domain/entities/user_signup_entity.dart';

class UserSignupMapper {
  Map<String, dynamic> to(UserSignupEntity userSignupEntity) {
    return {
      "firstName": userSignupEntity.firstName,
      "lastName": userSignupEntity.lastName,
      "email": userSignupEntity.email,
      "password": userSignupEntity.password,
      "passwordConfirmation": userSignupEntity.passwordConfirmation,
      "phone": userSignupEntity.phone,
      "emergencyName": userSignupEntity.emergencyName,
      "emergencyPhone": userSignupEntity.phone,
    };
  }
}
