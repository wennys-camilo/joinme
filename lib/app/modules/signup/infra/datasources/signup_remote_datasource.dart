import 'package:dartz/dartz.dart';
import '../../domain/entities/user_signup_entity.dart';

abstract class SignupRemoteDatasource {
  Future<Unit> signup(UserSignupEntity userSignupEntity);
}
