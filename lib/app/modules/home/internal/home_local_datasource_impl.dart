import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../shared/domain/helpers/errors/failure.dart';
import '../infra/datasources/home_local_datasource.dart';

class HomeLocalDatasourceImpl implements HomeLocalDatasource {
  final FlutterSecureStorage _localStorage;

  const HomeLocalDatasourceImpl(this._localStorage);

  @override
  Future<void> setAcessMood() async {
    try {
      await _localStorage.write(
          key: 'acess_mood', value: DateTime.now().toString());
    } on Failure {
      rethrow;
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<bool> displayMood() async {
    try {
      final response = await _localStorage.read(key: 'acess_mood');
      if (response != null) {
        final date = DateTime.parse(response);
        if (DateTime.now().difference(date).inHours >= 24) {
          return true;
        } else {
          return false;
        }
      }
      return true;
    } on Failure {
      rethrow;
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }
}
