import 'package:camp_final/app/modules/home/domain/usecases/fetch_all_status_events_attendees_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../shared/store/user/user_store.dart';
import '../../domain/entities/event_description_entity.dart';
import '../../domain/usecases/fetch_all_events_usecase.dart';
import 'home_state.dart';

class HomeStore extends NotifierStore<Failure, HomeState> {
  final UserStore userStore;

  final FetchAllEventsUsecase _fetchAllEventsUsecase;
  final FetchAllStatusEventsAttendeesUsecase
      _fetchAllStatusEventsAttendeesUsecase;

  HomeStore(this.userStore, this._fetchAllEventsUsecase,
      this._fetchAllStatusEventsAttendeesUsecase)
      : super(HomeState(events: [], promotedEvents: [], attendees: []));

  bool isFavorite(String eventId) {
    var contain =
        state.attendees.where((element) => element.eventId == eventId);
    if (contain.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> getFavorites() async {
    final response = await _fetchAllStatusEventsAttendeesUsecase('SAVED');
    response.fold(setError, (result) {
      update(state.copyWith(attendees: result));
    });
  }

  Future<void> fetchEvents() async {
    final response = await _fetchAllEventsUsecase();
    response.fold(setError, (result) {
      List<EventDescriptionEntity> promoted = [];
      for (var element in result) {
        if (element.isPromoted) {
          promoted.add(element);
        }
      }
      update(state.copyWith(events: result, promotedEvents: promoted));
    });
  }
}
