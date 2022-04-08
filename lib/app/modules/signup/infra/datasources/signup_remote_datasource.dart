import '../../domain/entities/user_signup_entity.dart';

abstract class SignupRemoteDatasource {
  Future<UserSignupEntity> signup(UserSignupEntity userSignupEntity);
  Future<UserSignupEntity> update(UserSignupEntity userSignupEntity);
}
