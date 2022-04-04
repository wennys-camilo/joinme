import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../domain/entities/user_signup_entity.dart';
import '../../infra/datasources/signup_remote_datasource.dart';
import '../mappers/user_signup_mapper.dart';

class SignupRemoteDatasourceImpl implements SignupRemoteDatasource {
  final Dio _httpClient;
  const SignupRemoteDatasourceImpl(this._httpClient);

  @override
  Future<Unit> signup(UserSignupEntity userSignupEntity) async {
    try {
      await _httpClient.post(
        '/users/signup',
        data: UserSignupMapper().to(userSignupEntity),
      );
      return unit; //TODO: DEIXAR APENNAS NO REPOSITORIES
    } on Failure {
      rethrow;
    } on DioError catch (error, stackTrace) {
      throw ApiFailure(stackTrace: stackTrace, message: error.message);
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }
}
