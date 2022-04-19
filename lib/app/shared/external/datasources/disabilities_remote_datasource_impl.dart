import 'package:dio/dio.dart';
import '../../domain/entites/disabilities_enity.dart';
import '../../domain/helpers/errors/failure.dart';
import '../../infra/datasources/disabilities_remote_datasource.dart';
import '../adapters/http_client/http_client_adapter.dart';
import '../mappers/disabilities_mapper.dart';

class DisabilitiesRemoteDatasourceImpl implements DisabilitiesRemoteDatasource {
  final IHttpClientAdapter _httpClient;

  DisabilitiesRemoteDatasourceImpl(this._httpClient);

  @override
  Future<List<DisabilitiesEntity>> fetch() async {
    try {
      final response = await _httpClient.get('/disabilities/list');
      return (response.data as List)
          .map((e) => DisabilitiesMapper().to(e))
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
}
