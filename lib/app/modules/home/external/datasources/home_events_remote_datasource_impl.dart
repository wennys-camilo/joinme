import 'package:camp_final/app/modules/home/domain/entities/attendees_entity.dart';
import 'package:camp_final/app/modules/home/domain/entities/attendees_response_entity.dart';
import 'package:camp_final/app/modules/home/domain/entities/mood_entity.dart';
import 'package:camp_final/app/modules/home/external/mappers/attendees_mapper.dart';
import 'package:camp_final/app/modules/home/external/mappers/mood_response_mapper.dart';
import 'package:camp_final/app/modules/home/external/mappers/wellness_mapper.dart';
import 'package:dio/dio.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../shared/external/adapters/http_client/http_client_adapter.dart';
import '../../domain/entities/event_description_entity.dart';
import '../../domain/entities/wellness_entity.dart';
import '../../infra/datasources/home_events_datasource.dart';
import '../mappers/event_description_mapper.dart';

class HomeEventsRemoteDataSourceImpl implements HomeEventsRemoteDataSource {
  final IHttpClientAdapter _httpClient;

  HomeEventsRemoteDataSourceImpl(this._httpClient);

  @override
  Future<List<EventDescriptionEntity>> events() async {
    try {
      final response = await _httpClient.get('/events/list');
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
  Future<AttendeesReponseEntity> setAttendees(AttendeesEntity entity) async {
    try {
      final response = await _httpClient.post('/events/attendees',
          data: AtendeesMapper().to(entity));
      return AtendeesMapper().from(response.data);
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
  Future<List<AttendeesReponseEntity>> getStatusList(String type) async {
    try {
      final response = await _httpClient.get('/events/attendees/list/user',
          queryParameters: {"status": type});
      return (response.data as List)
          .map((e) => AtendeesMapper().from(e))
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
  Future<List<MoodEntity>> getMoods() async {
    try {
      final response = await _httpClient.get(
        '/moods/list',
      );
      return (response.data as List)
          .map((e) => MoodResponseMapper().to(e))
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
  Future<List<WellnessEntity>> getWellness() async {
    try {
      final response = await _httpClient
          .get('/wellness/list', queryParameters: {'skip': 1, 'take': 10});
      return (response.data as List)
          .map((e) => WellnessMapper().to(e))
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
