import '../../domain/entities/user_disabilities_entity.dart';
import '../../domain/entities/user_signup_entity.dart';

abstract class SignupRemoteDatasource {
  Future<UserSignupEntity> signup(UserSignupEntity userSignupEntity);
  Future<UserSignupEntity> update(UserSignupEntity userSignupEntity);
  Future<void> disabilities(UserDisabilitiesEntity userDisabilitiesEntity);
  Future<UserSignupEntity> updateCity(String city);
}
