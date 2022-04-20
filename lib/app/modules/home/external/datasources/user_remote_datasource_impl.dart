import 'package:camp_final/app/shared/domain/entites/user_enity.dart';
import 'package:camp_final/app/shared/external/mappers/user_mapper.dart';
import 'package:dio/dio.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../shared/external/adapters/http_client/http_client_adapter.dart';
import '../../infra/datasources/user_remote_datasource.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final IHttpClientAdapter _httpClient;

  const UserRemoteDataSourceImpl(this._httpClient);

  @override
  Future<void> postMood(String moodId) async {
    try {
      await _httpClient.post('/users/moods', data: {"moodId": moodId});
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
  Future<UserEntity> fetchUser() async {
    try {
      final respose = await _httpClient.get('/users/find');
      return UserMapper().to(respose.data);
    } on Failure {
      rethrow;
    } on DioError catch (error, stackTrace) {
      throw ApiFailure(stackTrace: stackTrace, message: error.message);
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }

//TODO
  @override
  Future<UserEntity> fetchInterests() async {
    try {
      final respose = await _httpClient.get('/users/find');
      return UserMapper().to(respose.data);
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
