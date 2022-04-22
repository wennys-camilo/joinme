import 'package:dio/dio.dart';
import '../../../shared/domain/helpers/errors/failure.dart';
import '../../../shared/external/adapters/http_client/http_client_adapter.dart';
import '../infra/datasources/forgot_password_remote_datasource.dart';

class ForgotPasswordRemoteDataSourceImpl
    implements ForgotPasswordRemoteDataSource {
  final IHttpClientAdapter _httpClient;

  const ForgotPasswordRemoteDataSourceImpl(this._httpClient);

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _httpClient.patch('/users/resetpassword', data: {"email": email});
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
