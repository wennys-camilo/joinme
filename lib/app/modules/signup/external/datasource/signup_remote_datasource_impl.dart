import 'package:dio/dio.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../shared/external/adapters/http_client/http_client_adapter.dart';
import '../../domain/entities/user_signup_entity.dart';
import '../../infra/datasources/signup_remote_datasource.dart';
import '../mappers/user_signup_mapper.dart';

class SignupRemoteDatasourceImpl implements SignupRemoteDatasource {
  final IHttpClientAdapter _httpClient;

  const SignupRemoteDatasourceImpl(this._httpClient);

  @override
  Future<UserSignupEntity> signup(UserSignupEntity userSignupEntity) async {
    try {
      final response = await _httpClient.post(
        '/users/signup',
        data: UserSignupMapper().to(userSignupEntity),
      );
      final responseLogin = await _httpClient.post('/users/signin', data: {
        "email": userSignupEntity.email,
        "password": userSignupEntity.password
      });
      return UserSignupMapper().from((response.data as Map<String, dynamic>)
        ..addAll({
          "token": responseLogin.data['token'],
          "refreshToken": responseLogin.data['refreshToken'],
        }));
    } on Failure {
      rethrow;
    } on DioError catch (error, stackTrace) {
      throw ApiFailure(stackTrace: stackTrace, message: error.message);
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<UserSignupEntity> update(UserSignupEntity userSignupEntity) async {
    try {
      final response = await _httpClient.patch(
        '/users',
        data: UserSignupMapper().to(userSignupEntity),
      );
      print(response.data);
      return UserSignupMapper().from(response.data);
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
