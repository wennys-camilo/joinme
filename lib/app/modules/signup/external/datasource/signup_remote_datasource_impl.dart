import 'package:dio/dio.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../shared/external/adapters/http_client/http_client_adapter.dart';
import '../../domain/entities/user_disabilities_entity.dart';
import '../../domain/entities/user_signup_entity.dart';
import '../../infra/datasources/signup_remote_datasource.dart';
import '../mappers/user_disabilities_mapper.dart';
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

      return UserSignupMapper().from((response.data));
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
      return UserSignupMapper().from(response.data, update: true);
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
  Future<UserSignupEntity> updateCity(String city) async {
    try {
      final response = await _httpClient.patch('/users', data: {"city": city});
      return UserSignupMapper().from(response.data, update: true);
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
  Future<void> disabilities(
      UserDisabilitiesEntity userDisabilitiesEntity) async {
    try {
      await _httpClient.post('/users/disabilities',
          data: UserDisabilitiesMapper().to(userDisabilitiesEntity));
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
