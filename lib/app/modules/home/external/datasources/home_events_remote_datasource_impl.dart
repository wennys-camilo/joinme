import 'package:camp_final/app/modules/home/domain/entities/attendees_entity.dart';
import 'package:camp_final/app/modules/home/domain/entities/attendees_response_entity.dart';
import 'package:camp_final/app/modules/home/external/mappers/attendees_mapper.dart';
import 'package:dio/dio.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../shared/external/adapters/http_client/http_client_adapter.dart';
import '../../domain/entities/event_description_entity.dart';
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
}
