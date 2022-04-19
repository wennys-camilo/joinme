import 'package:camp_final/app/shared/domain/entites/city_entity.dart';
import 'package:camp_final/app/shared/external/adapters/http_client/http_client_adapter.dart';
import 'package:camp_final/app/shared/external/mappers/city_mapper.dart';
import 'package:dio/dio.dart';
import '../../domain/helpers/errors/failure.dart';
import '../../infra/datasources/ibge_remote_datasource.dart';

class IbgeRemoteDataSourceImpl implements IbgeRemoteDataSource {
  final IHttpClientAdapter _httpClient;

  const IbgeRemoteDataSourceImpl(this._httpClient);

  @override
  Future<List<CityEntity>> fetch() async {
    try {
      final response = await _httpClient.get(
          'https://servicodados.ibge.gov.br/api/v1/localidades/municipios?orderBy=nome');

      return (response.data as List).map((e) => CityMapper().to(e)).toList();
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
