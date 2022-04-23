import 'package:dio/dio.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../shared/external/adapters/http_client/http_client_adapter.dart';
import '../../domain/entities/authenticate_entity.dart';
import '../../domain/entities/response_auth_entity.dart';
import '../../infra/datasources/login_remote_datasource.dart';
import '../mappers/response_auth_mapper.dart';

class LoginRemoteDatasourceImpl implements LoginRemoteDatasource {
  final IHttpClientAdapter _httpClient;

  const LoginRemoteDatasourceImpl(this._httpClient);

  @override
  Future<ResponseAuthEntity> signin(
      {required AuthenticateEntity userAuth}) async {
    try {
      final response = await _httpClient.post(
        '/users/signin',
        data: {"email": userAuth.email, "password": userAuth.password},
      );
      return ResonseAuthMapper().to(response.data);
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
