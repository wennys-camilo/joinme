import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/helpers/errors/failure.dart';
import '../../infra/datasources/token_local_datasource.dart';

class TokenLocalDatasourceImpl implements TokenLocalDatasource {
  final FlutterSecureStorage _localStorage;

  TokenLocalDatasourceImpl(this._localStorage);

  @override
  Future<void> setToken(String value) async {
    try {
      await _localStorage.write(key: 'token', value: value);
    } on Failure {
      rethrow;
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      final response = await _localStorage.read(key: 'token');
      return response;
    } on Failure {
      rethrow;
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<void> refreshToken(String value) async {
    try {
      await _localStorage.write(key: 'refreshToken', value: value);
    } on Failure {
      rethrow;
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    try {
      final response = await _localStorage.read(key: 'refreshToken');
      return response;
    } on Failure {
      rethrow;
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }
}
