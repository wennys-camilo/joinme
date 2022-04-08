import 'package:dio/dio.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../shared/external/adapters/http_client/http_client_adapter.dart';
import '../../domain/entities/interests_entity.dart';
import '../../domain/entities/user_interests_entity.dart';
import '../../infra/datasources/interests_remote_datasource.dart';
import '../mappers/interests_mapper.dart';
import '../mappers/user_interests_mapper.dart';

class InterestsRemoteDatasourceImpl implements InterestsRemoteDatasource {
  final IHttpClientAdapter _httpClient;
  const InterestsRemoteDatasourceImpl(this._httpClient);

  @override
  Future<List<InterestsEntity>> fetch() async {
    try {
      final response = await _httpClient.get('/activities/list');
      return (response.data as List)
          .map((e) => InterestsMapper().to(e))
          .toList();
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
  Future<void> insert(UserInterestsEntity userInterestsEntity) async {
    try {
      await _httpClient.post('/users/interests',
          data: UserInterestsMapper().to(userInterestsEntity));
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
