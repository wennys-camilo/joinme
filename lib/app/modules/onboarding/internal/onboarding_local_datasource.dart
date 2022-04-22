import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../shared/domain/helpers/errors/failure.dart';
import '../infra/datasources/onborading_local_datasource.dart';

class OnboardingLocalDatasourceImpl implements OnboardingLocalDatasource {
  final FlutterSecureStorage _localStorage;

  OnboardingLocalDatasourceImpl(this._localStorage);

  @override
  Future<void> firstAcess(bool value) async {
    try {
      await _localStorage.write(key: 'first_acess', value: value.toString());
    } on Failure {
      rethrow;
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<bool> check() async {
    try {
      final response = await _localStorage.containsKey(key: 'first_acess');
      if (response) {
        return false;
      } else {
        return true;
      }
    } on Failure {
      rethrow;
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }
}
