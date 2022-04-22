import 'package:camp_final/app/modules/home/domain/entities/activities_description_entity.dart';
import 'package:camp_final/app/modules/home/external/mappers/activities_description_mapper.dart';
import 'package:camp_final/app/shared/domain/entites/disabilities_enity.dart';
import 'package:camp_final/app/shared/domain/entites/user_enity.dart';
import 'package:camp_final/app/shared/external/mappers/disabilities_mapper.dart';
import 'package:camp_final/app/shared/external/mappers/user_mapper.dart';
import 'package:dio/dio.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../shared/external/adapters/http_client/http_client_adapter.dart';

import '../../domain/entities/event_description_entity.dart';
import '../../infra/datasources/user_remote_datasource.dart';
import '../mappers/event_description_mapper.dart';

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

  @override
  Future<List<ActivitiesDescriptionEntity>> fetchActivities() async {
    try {
      final response = await _httpClient.get('/users/interests/list');
      return (response.data as List)
          .map((e) => ActivitiesDescriptionMapper().to(e))
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
  Future<List<EventDescriptionEntity>> userEvents() async {
    try {
      final response = await _httpClient.get('/events/list/user');
      return (response.data as List)
          .map((e) => EventDescriptionMapper().to(e))
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
  Future<List<DisabilitiesEntity>> disabilities() async {
    try {
      final response = await _httpClient.get('/users/disabilities/list');
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
